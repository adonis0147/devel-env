# devel-env

_**Devel-env**_ is aimed to set the development environment up on Linux server _**WITHOUT**_ root privileges.

It provides the following stuffs:

1. Portable GCC toolchain **(GCC 14.2 + GLIBC 2.41)** - relocated by [patchelf](https://github.com/NixOS/patchelf)
2. Toolset - built from source manually

### TIPS: The GCC toolchain can be used *standalone*.

---

## Portable GCC Toolchain

### Prerequisites

* Linux (x86_64 or aarch64)
* Bash
* XZ

### Use Prebuilt GCC Toolchain

1. Go to [the release page](https://github.com/adonis0147/devel-env/releases) to download the **all-in-one** script or use
   the following command.

```shell
curl -LO "$(curl -L https://api.github.com/repos/adonis0147/devel-env/releases/latest |
    sed -n 's|[[:space:]]*"browser_download_url": "\(.*\)\"|\1|p' |
    grep "$(uname -m | sed 's/arm64/aarch64/')")"
```

2. Run the **all-in-one** script to set the portable GCC toolchain up.

```shell
# The toolchain will be extracted to /some/path/compiler
bash "install_toolchain_$(uname -m | sed 's/arm64/aarch64/').sh" /some/path
```

3. Optionally, export the `PATH` environment variable to access the toolchain.

```shell
export PATH="/some/path/compiler/bin:${PATH}"
```

4. Now `gcc --version` should work!

### Examples

**Alpine Linux**

```shell
$ docker run -it alpine:latest


# In container

apk add bash libc6-compat

bash install_toolchain_x86_64.sh /root

export PATH="/root/compiler/bin:${PATH}"
```

**Ubuntu**

```shell
apt install xz-utils

bash install_toolchain_x86_64.sh /root

export PATH="/root/compiler/bin:${PATH}"
```

**CentOS**

```shell
bash install_toolchain_x86_64.sh /root

export PATH="/root/compiler/bin:${PATH}"
```

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

3. Usage

```shell
# Copy the output/install_toolchain.sh to the target server and run the following commands.

bash install_toolchain.sh /some/path

export PATH="/some/path/compiler/bin:${PATH}"
```

## Optional Toolset

The project provides scripts to install some softwares built by the GCC toolchain.

### Prerequisites

* Linux (x86_64 or aarch64)
* Bash
* XZ
* install_toolchain.sh (_*provided*_)

## Usage

```shell
git clone https://github.com/adonis0147/devel-env

cd devel-env

# Download packages
devel/downloads/download_packages.sh

# Download the latest GCC toolchain
curl -L "$(curl -L https://api.github.com/repos/adonis0147/devel-env/releases/latest |
    sed -n 's|[[:space:]]*"browser_download_url": "\(.*\)\"|\1|p' |
    grep "$(uname -m | sed 's/arm64/aarch64/')")" -o devel/scripts/install_toolchain.sh
chmod a+x devel/scripts/install_toolchain.sh

# Optional: DEVEL_HOME_PATH="${HOME}/.local/share/devel" by default.
# The toolchain will be extracted to /some/path/compiler and the softwares will be installed in /some/path
export DEVEL_HOME_PATH=/some/path

devel/scripts/install.sh

# Set some environment variables and useful functions up
source devel/scripts/env_vars.sh
```

### Examples

**Alpine Linux**

```shell
$ docker run -it alpine:latest


# In container

apk add bash libc6-compat git curl

git clone https://github.com/adonis0147/devel-env

cd devel-env

devel/downloads/download_packages.sh

curl -L "$(curl -L https://api.github.com/repos/adonis0147/devel-env/releases/latest |
    sed -n 's|[[:space:]]*"browser_download_url": "\(.*\)\"|\1|p' |
    grep "$(uname -m | sed 's/arm64/aarch64/')")" -o devel/scripts/install_toolchain.sh
chmod a+x devel/scripts/install_toolchain.sh

# The toolchain will be extracted to /root/devel/compiler and the softwares will be installed in /root/devel
export DEVEL_HOME_PATH=/root/devel

devel/scripts/install.sh

source devel/scripts/env_vars.sh
```

**Ubuntu**

```shell
apt install xz-utils git curl

...
```

**CentOS**

```shell
yum install git curl

...
```
