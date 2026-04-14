# AGENTS.md

## Scope

- `toolchain/` builds the portable GCC/glibc toolchain and packages it into a self-extracting `install_toolchain.sh`.
- `devel/` downloads package archives and installs the optional userland toolset into `DEVEL_HOME_PATH`.
- `devel/downloads/check_updates/` is a separate maintenance helper for auditing version pins in `devel/downloads/packages.sh`; it is not part of the normal install or release flow.

## High-Value Commands

- Download all package archives: `devel/downloads/download_packages.sh`
- Install the full optional toolset: `devel/scripts/install.sh`
- Install only selected packages: `devel/scripts/install.sh <package>...`
- Resume a failed package build: `devel/scripts/install.sh --continue <package>`
- Recreate top-level symlinks for one package or all packages: `devel/scripts/setup_package.sh [package]`
- Load runtime environment after install: `source devel/scripts/env_vars.sh`
- Run package update audit from `devel/downloads/check_updates/`: `uv run check_updates`

## Required Order

For the optional toolset, the expected order is:

1. `devel/downloads/download_packages.sh`
2. place the release installer at `devel/scripts/install_toolchain.sh`
3. `chmod a+x devel/scripts/install_toolchain.sh`
4. `devel/scripts/install.sh`
5. `source devel/scripts/env_vars.sh`

`devel/scripts/install.sh` expects `devel/scripts/install_toolchain.sh` to already exist. The documented path is to download the latest release asset into that exact location before running the install.

## Important Defaults And Quirks

- `DEVEL_HOME_PATH` defaults to `${HOME}/.local/share/devel`.
- `devel/scripts/install.sh` always installs the toolchain first if `${DEVEL_HOME_PATH}/compiler` does not already exist.
- `install.sh` rewires the install root before package installs:
  - `compiler/$(uname -m)-linux-gnu -> ..`
  - `lib64 -> lib`
  - `usr -> compiler`
- `install.sh` generates locale data before installing packages with `setup_locale 'UTF-8' 'en_US' 'en_US.UTF-8'`.
- When no explicit package list is passed, the default package sequence is hardcoded in `devel/scripts/install.sh`.
- `zsh` is only appended to the default package list when `tty` is available; non-interactive runs will skip it unless passed explicitly.
- CI intentionally removes `llvm` from the default package list before invoking `devel/scripts/install.sh`; do not change that unless you are intentionally changing CI behavior.

## Runtime Environment

- Source `devel/scripts/env_vars.sh` before testing installed tools; it sets `PATH`, `PKG_CONFIG_PATH`, `ACLOCAL_PATH`, `GCONV_PATH`, `MANPATH`, `TZDIR`, and `GOFLAGS='-ldflags=-linkmode=external'`.
- That script also provides helper functions used during debugging and relocation: `relocate`, `setup_locale`, `setup_terminfo`, and `setup_ca_certificate`.

## check_updates Helper

- `devel/downloads/check_updates/` is a separate `uv` project for auditing version pins in `devel/downloads/packages.sh`.
- It requires Python `3.14` (`.python-version` and `pyproject.toml` both pin that).
- It is not used by the normal install scripts, CI package builds, or release workflow.
- It uses `uv.lock`, so prefer `uv run ...` over invoking Python directly.
- GitHub version lookups use the GraphQL API and read `GITHUB_TOKEN` from the environment.
- The script reports two groups: packages that should be updated, and packages that should be checked manually because their URL host is not handled.
- Do not assume it covers every entry in `devel/downloads/packages.sh`; unsupported hosts are intentionally left for manual review.
- When updating a package URL in `devel/downloads/packages.sh`, update the corresponding pinned `SHA256SUM` in the same change.
- Prefer calculating the checksum from stdio instead of saving the archive first, e.g. `curl -L https://xxx -o - | sha256sum -`.
- If `check_updates` behaves unexpectedly, inspect `devel/downloads/check_updates/src/check_updates/check_updates.py` before changing package pins.

## Verification

- There is no conventional root unit-test suite; verification is mainly shell lint plus install/build smoke tests.
- GitHub Actions shell lint: `.github/workflows/shellcheck.yml`
- Alpine package install smoke test: `.github/workflows/build_packages.yml`
- CentOS 7 old-kernel build path: `.github/workflows/build.yml`
- Cirrus CI package builds on `x86_64` and `aarch64`: `.cirrus.yml`
- If you change shell scripts, run `shellcheck` from repo root so `.shellcheckrc` can resolve sourced files correctly.

## Toolchain Build Notes

- The toolchain build path is separate from the optional package installer.
- Key entrypoints: `toolchain/Dockerfile`, `toolchain/generate_toolchan.sh`, `toolchain/setup_toolchain.sh`
- Documented local build flow:
  1. `docker build --platform=linux/x86-64 -t toolchain toolchain`
  2. `mkdir output`
  3. `docker run --platform=linux/x86-64 --rm --mount type=bind,source="$(pwd)/output",target=/output toolchain`
- The README explicitly warns local toolchain builds can take a very long time on ARM64/macOS.
- `toolchain/setup_toolchain.sh` rewrites interpreters, rpaths, `ldd`, and GCC specs; do not treat it as a simple extractor.

## Release And CI Notes

- Release publishing uses `.github/workflows/release.yml`.
- The release workflow depends on the `.github/cirrus-ci-tools` git submodule.
- Release automation runs `uv sync --no-dev` inside `.github/cirrus-ci-tools` before triggering Cirrus CI builds.

## Generated / Ignored Artifacts

- Do not commit generated download caches or local installer artifacts: `devel/downloads/packages/*`, `toolchain/packages/*`, root `install_toolchain.sh`.
