# AGENTS.md

## Project and source map

This project provides a rootless Linux development environment for `x86_64` and `aarch64`. Keep its three workflows separate:

- `toolchain/`: builds GCC, glibc, binutils, Linux headers, libxcrypt, and musl-obstack, then bundles a self-extracting toolchain installer.
- `devel/`: downloads archives and installs the optional toolset using that toolchain.
- `devel/downloads/check_updates/`: standalone Python maintenance helper; not part of installation, package CI, or releases.

Read the relevant implementation before changing behavior:

| File                                   | Responsibility                                                                                                            |
| -------------------------------------- | ------------------------------------------------------------------------------------------------------------------------- |
| `toolchain/generate_toolchain.sh`      | Toolchain version pins, MD5 checks, staged cross/native builds; defaults to `PREFIX=/compiler`, `TARGET=x86_64-linux-gnu` |
| `toolchain/Dockerfile`                 | Build dependencies, separate bundled patchelf pin, archive creation, installer assembly                                   |
| `toolchain/setup_toolchain.sh`         | Self-extracting installer header and toolchain relocation                                                                 |
| `devel/downloads/packages.sh`          | Optional package URLs, SHA256 checks, archive names, extracted-directory names, architecture branches                     |
| `devel/downloads/download_packages.sh` | Downloads all optional packages and rustup-init; verifies package archives and retries GNU mirror URLs                    |
| `devel/scripts/install.sh`             | Package build recipes, dependency-ordered default sequence, CLI dispatch, install-root preparation                        |
| `devel/scripts/setup_package.sh`       | Exposes files under `opt/<package>` through relative symlinks in the install root                                         |
| `devel/scripts/env_vars.sh`            | Runtime environment and relocation, locale, terminfo, certificate helpers                                                 |
| `devel/scripts/common.sh`              | Shared logging; `log_error` exits with status 1                                                                           |

`README.md` documents user setup. Update it when changing user-facing commands or prerequisites. Prefer existing Bash recipe conventions: quoted paths, local function variables, `pushd`/`popd`, and per-package prefixes. Preserve package-specific flags and compatibility workarounds.

## Optional toolset workflow

Run from the repository root; export a custom root before installing or sourcing the environment:

```bash
export DEVEL_HOME_PATH=/some/path # optional; default: ${HOME}/.local/share/devel

devel/downloads/download_packages.sh
# Download the matching release asset to devel/scripts/install_toolchain.sh.
# See README.md for the latest-release download command.
chmod a+x devel/scripts/install_toolchain.sh

devel/scripts/install.sh
source devel/scripts/env_vars.sh
```

The installer only requires `devel/scripts/install_toolchain.sh` when `${DEVEL_HOME_PATH}/compiler` is absent. Existing compiler directories are reused, not upgraded. Archives must already be in `devel/downloads/packages/`; installation does not download them.

Useful commands:

```bash
devel/scripts/install.sh <package>...          # install exactly this sequence
devel/scripts/install.sh --continue <package> # restart the default sequence at this package
devel/scripts/setup_package.sh [package]      # rebuild links for one package or all
```

Important behavior:

- CLI package names are function suffixes: use `pkg_config` and `polyfill_glibc`, not their hyphenated install-directory names. Use `wget`, `python`, and `neovim` for those recipes.
- Explicit package lists do not resolve dependencies or reorder packages. Only a missing `make` is bootstrapped automatically. Consult the default sequence and recipes before selecting packages.
- `--continue` cannot be combined with an explicit package list. It skips earlier defaults, then reruns the selected recipe and everything after it; most recipes delete and re-extract sources, so this is not an incremental build resume. An unknown start package installs no packages.
- Default package order is hardcoded in `install_packages`. `zsh` is appended only when `tty` succeeds; request it explicitly in noninteractive runs if needed.
- Before any package selection, installation removes `compiler/$(uname -m)-linux-gnu` and replaces it with `..`, creates `lib64 -> lib` and `usr -> compiler`, and generates `en_US.UTF-8` locale data under `${HOME}/.locale`.
- Most packages install into `${DEVEL_HOME_PATH}/opt/<package>` and call `setup_package`. Inspect exceptions such as Rust, GDB, and LLVM rather than assuming every recipe uses the same layout.
- Rust also modifies `${HOME}/.cargo` and `${HOME}/.rustup`; LLVM creates configuration under `${HOME}/.config/llvm` before moving it into its installation.

## Runtime and relocation

Source `devel/scripts/env_vars.sh` before testing installed tools. It sets `PATH`, `PKG_CONFIG_PATH`, `ACLOCAL_PATH`, `GCONV_PATH`, `MANPATH`, and `GOFLAGS='-ldflags=-linkmode=external'`; it sets `TZDIR` if installed zoneinfo exists. It also sets editor/pager variables when Neovim is available and `GPG_TTY` when `tty` succeeds.

Helpers are `relocate [--overwrite] <path>`, `setup_locale`, `setup_terminfo`, and `setup_ca_certificate`. These can modify ELF files, user-home files, or configuration; sourcing the file alone does not invoke these helpers.

Treat install and relocation smoke tests as mutating operations. Use disposable containers or VMs with an isolated `HOME` and `DEVEL_HOME_PATH`, not the developer's active environment. The `/` install-root guard is not a substitute for isolation.

## Updating packages

- Change optional package pins in `devel/downloads/packages.sh`: keep URL, SHA256, archive name, and extracted-directory name consistent. Update every architecture-specific checksum affected by a release.
- `ARCH` can be supplied when sourcing package pins; otherwise it comes from `uname -m`, with `arm64` normalized to `aarch64`. This selects downloads, not a full cross-compilation mode.
- The Expat checksum variable is currently spelled `EXPRT_PACKAGE_SHA256SUM` in both pins and downloader. Do not rename only one side.
- Calculate checksums from the actual archive bytes, preferably without retaining the archive: `set -o pipefail; curl -fL <url> | sha256sum`. Do not guess or copy a checksum for a different asset.
- Toolchain pins and MD5 sums live separately in `toolchain/generate_toolchain.sh`. The Dockerfile's bundled patchelf pin is independent of the optional toolset's patchelf pin.
- Adding an optional package generally touches the pins, downloader, `install_<name>` recipe, and default sequence if it should be installed by default. Place it after its dependencies and finish its link setup.

### Required update-audit workflow

When asked to check or update optional package versions, run the existing audit helper first instead of manually searching every upstream or writing a replacement checker. From the repository root:

```bash
cd devel/downloads/check_updates && uv run check_updates
```

- Use the reported updates as candidates, then verify upstream releases before editing pins; the audit is not an automatic updater.
- Manually check URLs the helper reports as unhandled. Toolchain pins and the Dockerfile's bundled patchelf pin are outside its scope and need separate checks.
- If the audit fails or cannot run, report the blocker and which packages remain unchecked; do not claim a complete audit. Inspect the helper when its results look wrong.
- GitHub GraphQL lookups require `GITHUB_TOKEN`. Check whether it is set without printing its value; never include tokens in commands, logs, or documentation. If unavailable, request access or explicitly report a manual-check fallback.

`.python-version` selects Python 3.14; `pyproject.toml` requires `>=3.14`. Use the existing `uv.lock` and `uv run` rather than installing dependencies globally.

The helper reads `data/packages.sh`, a tracked symlink to `../../packages.sh`; preserve that link rather than duplicating pins. Implementation is in `src/check_updates/check_updates.py`. It reports updates and unhandled URLs for manual checks; it does not edit pins or verify checksums. GitHub tagged-package checks use the most recently committed tag, not necessarily the latest stable release. Inspect unexpected results and verify upstream releases before changing pins.

## Toolchain build and release

A native Docker build from the repository root:

```bash
mkdir -p output
docker build -t toolchain toolchain
docker run --rm --mount type=bind,source="$(pwd)/output",target=/output toolchain
# Produces output/install_toolchain.sh
bash output/install_toolchain.sh /some/path
```

The Dockerfile sets `TARGET` from its build architecture. For emulated builds, select the same Docker platform for both build and run (for example `--platform=linux/amd64`). Builds are expensive, especially under emulation; prefer release installers for routine package work.

The installer is `setup_toolchain.sh` followed by an XZ archive, separated by the `# -*- EOF -*-` marker. Preserve that marker and assembly contract. It refuses extraction over an existing `compiler` directory and rewrites ELF interpreters/rpaths, text paths, `ldd`, and GCC specs. Its optional second argument `false` skips extraction but still reconfigures the existing toolchain; it is not a harmless dry run. Paths embedded during configuration mean moving installed files is not simply a directory rename.

## Verification and CI

There is no tracked unit-test suite or root test runner. For shell changes, run syntax checks and ShellCheck from the repository root so `.shellcheckrc` resolves sourced files:

```bash
bash -n path/to/changed.sh
shellcheck path/to/changed.sh
```

For installer changes, use a targeted package smoke test in an isolated environment when practical; lint alone does not verify builds or relocation. Report which checks ran and whether full builds were skipped.

Current CI definitions:

- `.github/workflows/shellcheck.yml`: ShellCheck on pushes.
- `.github/workflows/build_packages.yml`: default optional-toolset install in Alpine on pushes/PRs, using the latest released toolchain.
- `.circleci/config.yml`: CentOS 7 container package builds on `x86_64` and `aarch64`.
- `.github/workflows/build.yml`: manually dispatched CentOS 7 VM test on kernel `3.10.0-123.1.2`; installs an explicit bootstrap subset and accepts a toolchain URL or Actions artifact URL.
- `.github/workflows/release.yml`: tag-triggered native toolchain builds on `x86_64` and `aarch64`, then publishes `install_toolchain_<arch>.sh` assets using `.github/templates/release.md`.

Package CI intentionally removes LLVM from the default sequence. Preserve this unless changing CI coverage deliberately. QEMU cloud-init credentials are test fixtures for the disposable VM, not deployment credentials.

## Generated files

Do not commit download/build caches, generated installers, or local environments: `devel/downloads/packages/*`, `toolchain/packages/*`, `output/`, root or `devel/scripts/install_toolchain.sh`, `.venv/`, `__pycache__/`, and Python build artifacts. Not all generated paths are covered by `.gitignore`; check `git status` before finishing.
