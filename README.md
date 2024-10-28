# devel-env

_**Devel-env**_ is aimed to set the development environment up on Linux server _**WITHOUT**_ root privileges.

It provides the following stuffs:
1. GCC toolchain **(GCC 14.2 + GLIBC 2.39)** - relocated by [patchelf](https://github.com/NixOS/patchelf)
2. Toolset - built from source manually

### TIPS: The GCC toolchain can be used *standalone*.

---

## Use Prebuilt Toolchain

1. Go to [the release page](https://github.com/adonis0147/devel-env/releases) and fetch the `install_toolchain_x86_64.sh` (if you're on an x64 system) or `install_toolchain_aarch64.sh` (if you're on an ARM64 system).
2. Extract the toolchain, don't run this as root but simply as your regular user:
   ```
   ./install_toolchain_x86_64.sh my-gcc-toolchain
   ```
3. Optionally, ajust the `$PATH` variable to easily access all the tools:
   ```
   export PATH="`pwd`/my-gcc-toolchain/compiler/bin:${PATH}"
   ```
4. Now `gcc --help` should work!

## Build GCC Toolchain Yourself (Advanced)

1. Build the docker image. _**CAVEAT:**_ It may take **TOO TOO LONG** time to finish on **ARM64** platform (e.g.
   macOS with Apple Silicon). It is recommended to download it from [the release page](https://github.com/adonis0147/devel-env/releases).
   ```shell
   cd toolchain
   docker build --platform=linux/x86-64 -t toolchain .
   ```

2. Generate the toolchain.
   ```shell
   mkdir output
   docker run --platform=linux/x86-64 --rm --mount type=bind,source="$(pwd)/output",target=/output toolchain
   ```

3. You can now use the `output/install_toolchain.sh` script [like above](#use-prebuilt-toolchain)!

## Use Optional Toolset
### Install the toolset
```shell
cp output/install_toolchain.sh devel/scripts

# Download the packages
bash devel/downloads/download_packages.sh

# Copy the whole devel directory to the target server (e.g. ${HOME}/.local/share/devel) and run the following commands.

# Optional: DEVEL_HOME_PATH="${HOME}/.local/share/devel" by default.
export DEVEL_HOME_PATH="<some devel home path>"

cd "some/path/devel/scripts"
./install.sh
```
### Usage
```shell
source "some/path/devel/scripts/env_vars.sh"
```
