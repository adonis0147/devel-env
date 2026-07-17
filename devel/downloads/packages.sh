#!/bin/bash
# shellcheck disable=2034

if [[ -z "${ARCH}" ]]; then
	ARCH="$(uname -m)"
	if [[ "${ARCH}" == 'arm64' ]]; then
		ARCH='aarch64'
	fi
fi

RUST_PACKAGE_URL="https://static.rust-lang.org/dist/rust-1.97.1-${ARCH}-unknown-linux-gnu.tar.xz"
if [[ "${ARCH}" == 'x86_64' ]]; then
	RUST_PACKAGE_SHA256SUM='88f28fa9af20594179f85d6df67078dfd6fa93e2f6da5e1e9b0ac4997988ca4f'
elif [[ "${ARCH}" == 'aarch64' ]]; then
	RUST_PACKAGE_SHA256SUM='9a7a2c336b4787f1b72f6bab7c35d5b7af2fd03cbd39b4fc721466a70d402a7d'
fi
RUST_PACKAGE_NAME="rust-1.97.1-${ARCH}-unknown-linux-gnu.tar.xz"
RUST_PACKAGE_EXTRACTED_DIR="rust-1.97.1-${ARCH}-unknown-linux-gnu"

TZDB_PACKAGE_URL='https://github.com/eggert/tz/archive/refs/tags/2026c.tar.gz'
TZDB_PACKAGE_SHA256SUM='99fcce3d468fbb94b9395db2d4a83777ffdf7740a1890ba2e52e8ae089cc8e3b'
TZDB_PACKAGE_NAME='tz-2026c.tar.gz'
TZDB_PACKAGE_EXTRACTED_DIR='tz-2026c'

M4_PACKAGE_URL='https://ftpmirror.gnu.org/m4/m4-1.4.21.tar.xz'
M4_PACKAGE_SHA256SUM='f25c6ab51548a73a75558742fb031e0625d6485fe5f9155949d6486a2408ab66'
M4_PACKAGE_NAME='m4-1.4.21.tar.xz'
M4_PACKAGE_EXTRACTED_DIR='m4-1.4.21'

AUTOCONF_PACKAGE_URL='https://ftpmirror.gnu.org/autoconf/autoconf-2.73.tar.gz'
AUTOCONF_PACKAGE_SHA256SUM='259ddfa3bddc799cfb81489cc0f17dfdf1bd6d1505dda53c0f45ff60d6a4f9a7'
AUTOCONF_PACKAGE_NAME='autoconf-2.73.tar.gz'
AUTOCONF_PACKAGE_EXTRACTED_DIR='autoconf-2.73'

AUTOMAKE_PACKAGE_URL='https://ftpmirror.gnu.org/automake/automake-1.18.1.tar.gz'
AUTOMAKE_PACKAGE_SHA256SUM='63e585246d0fc8772dffdee0724f2f988146d1a3f1c756a3dc5cfbefa3c01915'
AUTOMAKE_PACKAGE_NAME='automake-1.18.1.tar.gz'
AUTOMAKE_PACKAGE_EXTRACTED_DIR='automake-1.18.1'

LIBTOOL_PACKAGE_URL='https://ftpmirror.gnu.org/libtool/libtool-2.6.2.tar.gz'
LIBTOOL_PACKAGE_SHA256SUM='24adb3aa9ae035c70faba344af57d73215eb89281045af6c7ccd307751f8b0bf'
LIBTOOL_PACKAGE_NAME='libtool-2.6.2.tar.gz'
LIBTOOL_PACKAGE_EXTRACTED_DIR='libtool-2.6.2'

MAKE_PACKAGE_URL='https://ftpmirror.gnu.org/make/make-4.4.1.tar.gz'
MAKE_PACKAGE_SHA256SUM='dd16fb1d67bfab79a72f5e8390735c49e3e8e70b4945a15ab1f81ddb78658fb3'
MAKE_PACKAGE_NAME='make-4.4.1.tar.gz'
MAKE_PACKAGE_EXTRACTED_DIR='make-4.4.1'

PKG_CONFIG_PACKAGE_URL='https://pkgconfig.freedesktop.org/releases/pkg-config-0.29.2.tar.gz'
PKG_CONFIG_PACKAGE_SHA256SUM='6fc69c01688c9458a57eb9a1664c9aba372ccda420a02bf4429fe610e7e7d591'
PKG_CONFIG_PACKAGE_NAME='pkg-config-0.29.2.tar.gz'
PKG_CONFIG_PACKAGE_EXTRACTED_DIR='pkg-config-0.29.2'

NINJA_PACKAGE_URL='https://github.com/ninja-build/ninja/archive/refs/tags/v1.13.2.tar.gz'
NINJA_PACKAGE_SHA256SUM='974d6b2f4eeefa25625d34da3cb36bdcebe7fbce40f4c16ac0835fd1c0cbae17'
NINJA_PACKAGE_NAME='ninja-1.13.2.tar.gz'
NINJA_PACKAGE_EXTRACTED_DIR='ninja-1.13.2'

PATCHELF_PACKAGE_URL="https://github.com/NixOS/patchelf/releases/download/0.19.1/patchelf-0.19.1-${ARCH}.tar.gz"
if [[ "${ARCH}" == 'x86_64' ]]; then
	PATCHELF_PACKAGE_SHA256SUM='a6818fef80128fb354423234ecacdcca3e993913d774e5d8346bc63f70fed4cf'
elif [[ "${ARCH}" == 'aarch64' ]]; then
	PATCHELF_PACKAGE_SHA256SUM='a2f8f5add5910a521d35062adf2c9f55d75b65ae5508d290758787004054e702'
fi
PATCHELF_PACKAGE_NAME="patchelf-0.19.1-${ARCH}.tar.gz"

NCURSES_PACKAGE_URL='https://ftpmirror.gnu.org/ncurses/ncurses-6.6.tar.gz'
NCURSES_PACKAGE_SHA256SUM='355b4cbbed880b0381a04c46617b7656e362585d52e9cf84a67e2009b749ff11'
NCURSES_PACKAGE_NAME='ncurses-6.6.tar.gz'
NCURSES_PACKAGE_EXTRACTED_DIR='ncurses-6.6'

READLINE_PACKAGE_URL='https://ftpmirror.gnu.org/readline/readline-8.3.tar.gz'
READLINE_PACKAGE_SHA256SUM='fe5383204467828cd495ee8d1d3c037a7eba1389c22bc6a041f627976f9061cc'
READLINE_PACKAGE_NAME='readline-8.3.tar.gz'
READLINE_PACKAGE_EXTRACTED_DIR='readline-8.3'

LIBFFI_PACKAGE_URL='https://github.com/libffi/libffi/releases/download/v3.7.1/libffi-3.7.1.tar.gz'
LIBFFI_PACKAGE_SHA256SUM='d5e9a6638ddbd2513ddb54518eb67e4bbe6fa707bcc01c10f6212f0a088d819d'
LIBFFI_PACKAGE_NAME='libffi-3.7.1.tar.gz'
LIBFFI_PACKAGE_EXTRACTED_DIR='libffi-3.7.1'

ZLIB_PACKAGE_URL='https://github.com/madler/zlib/archive/refs/tags/v1.3.2.tar.gz'
ZLIB_PACKAGE_SHA256SUM='b99a0b86c0ba9360ec7e78c4f1e43b1cbdf1e6936c8fa0f6835c0cd694a495a1'
ZLIB_PACKAGE_NAME='zlib-1.3.2.tar.gz'
ZLIB_PACKAGE_EXTRACTED_DIR='zlib-1.3.2'

PERL_PACKAGE_URL='https://www.cpan.org/src/5.0/perl-5.42.2.tar.gz'
PERL_PACKAGE_SHA256SUM='9384e8deb75b7b1695e5637971b752281aaecd025a3d5d4734d33c1d0adfee47'
PERL_PACKAGE_NAME='perl-5.42.2.tar.gz'
PERL_PACKAGE_EXTRACTED_DIR='perl-5.42.2'

OPENSSL_PACKAGE_URL='https://github.com/openssl/openssl/releases/download/openssl-3.6.2/openssl-3.6.2.tar.gz'
OPENSSL_PACKAGE_SHA256SUM='aaf51a1fe064384f811daeaeb4ec4dce7340ec8bd893027eee676af31e83a04f'
OPENSSL_PACKAGE_NAME='openssl-3.6.2.tar.gz'
OPENSSL_PACKAGE_EXTRACTED_DIR='openssl-3.6.2'

CURL_PACKAGE_URL='https://curl.se/download/curl-8.21.0.tar.gz'
CURL_PACKAGE_SHA256SUM='d9b327997999045a24cda50f3983e69e51c516bd8be6ef9842fc7f99135e33bb'
CURL_PACKAGE_NAME='curl-8.21.0.tar.gz'
CURL_PACKAGE_EXTRACTED_DIR='curl-8.21.0'

WGET_PACKAGE_URL='https://ftpmirror.gnu.org/wget/wget2-2.2.1.tar.gz'
WGET_PACKAGE_SHA256SUM='d7544b13e37f18e601244fce5f5f40688ac1d6ab9541e0fbb01a32ee1fb447b4'
WGET_PACKAGE_NAME='wget2-2.2.1.tar.gz'
WGET_PACKAGE_EXTRACTED_DIR='wget2-2.2.1'

BZIP2_PACKAGE_URL='https://sourceware.org/pub/bzip2/bzip2-1.0.8.tar.gz'
BZIP2_PACKAGE_SHA256SUM='ab5a03176ee106d3f0fa90e381da478ddae405918153cca248e682cd0c4a2269'
BZIP2_PACKAGE_NAME='bzip2-1.0.8.tar.gz'
BZIP2_PACKAGE_EXTRACTED_DIR='bzip2-1.0.8'

XZ_PACKAGE_URL='https://github.com/tukaani-project/xz/releases/download/v5.8.3/xz-5.8.3.tar.gz'
XZ_PACKAGE_SHA256SUM='3d3a1b973af218114f4f889bbaa2f4c037deaae0c8e815eec381c3d546b974a0'
XZ_PACKAGE_NAME='xz-5.8.3.tar.gz'
XZ_PACKAGE_EXTRACTED_DIR='xz-5.8.3'

SQLITE_PACKAGE_URL='https://sqlite.org/2026/sqlite-autoconf-3530300.tar.gz'
SQLITE_PACKAGE_SHA256SUM='c917d7db16648ec95f714974ace5e5dcf46b7dc70e26600a0a102a3141125db0'
SQLITE_PACKAGE_NAME='sqlite-autoconf-3530300.tar.gz'
SQLITE_PACKAGE_EXTRACTED_DIR='sqlite-autoconf-3530300'

PYTHON_PACKAGE_URL='https://github.com/python/cpython/archive/refs/tags/v3.14.6.tar.gz'
PYTHON_PACKAGE_SHA256SUM='7f77ccf3613ddadc74dfb8d6f8082581a8835115a25e1307d189f03aa750893e'
PYTHON_PACKAGE_NAME='cpython-3.14.6.tar.gz'
PYTHON_PACKAGE_EXTRACTED_DIR='cpython-3.14.6'

EXPAT_PACKAGE_URL='https://github.com/libexpat/libexpat/releases/download/R_2_8_2/expat-2.8.2.tar.gz'
EXPRT_PACKAGE_SHA256SUM='ef7d1994f533c9e7343d6c19f31064fc8ebbcbcaa144be3812b4f43052a05f4c'
EXPAT_PACKAGE_NAME='expat-2.8.2.tar.gz'
EXPAT_PACKAGE_EXTRACTED_DIR='expat-2.8.2'

GETTEXT_PACKAGE_URL='https://ftpmirror.gnu.org/gettext/gettext-1.0.tar.xz'
GETTEXT_PACKAGE_SHA256SUM='71132a3fb71e68245b8f2ac4e9e97137d3e5c02f415636eb508ae607bc01add7'
GETTEXT_PACKAGE_NAME='gettext-1.0.tar.xz'
GETTEXT_PACKAGE_EXTRACTED_DIR='gettext-1.0'

GIT_PACKAGE_URL='https://github.com/git/git/archive/refs/tags/v2.55.0.tar.gz'
GIT_PACKAGE_SHA256SUM='72923418db7b26dfddc21e2268660c5118e560bdfaa09b4489b67b38e9b69c49'
GIT_PACKAGE_NAME='git-2.55.0.tar.gz'
GIT_PACKAGE_EXTRACTED_DIR='git-2.55.0'

GMP_PACKAGE_URL='https://ftpmirror.gnu.org/gmp/gmp-6.3.0.tar.xz'
GMP_PACKAGE_SHA256SUM='a3c2b80201b89e68616f4ad30bc66aee4927c3ce50e33929ca819d5c43538898'
GMP_PACKAGE_NAME='gmp-6.3.0.tar.xz'
GMP_PACKAGE_EXTRACTED_DIR='gmp-6.3.0'

MPFR_PACKAGE_URL='https://ftpmirror.gnu.org/mpfr/mpfr-4.2.2.tar.xz'
MPFR_PACKAGE_SHA256SUM='b67ba0383ef7e8a8563734e2e889ef5ec3c3b898a01d00fa0a6869ad81c6ce01'
MPFR_PACKAGE_NAME='mpfr-4.2.2.tar.xz'
MPFR_PACKAGE_EXTRACTED_DIR='mpfr-4.2.2'

TEXINFO_PACKAGE_URL='https://ftpmirror.gnu.org/texinfo/texinfo-7.3.tar.xz'
TEXINFO_PACKAGE_SHA256SUM='51f74eb0f51cfa9873b85264dfdd5d46e8957ec95b88f0fb762f63d9e164c72e'
TEXINFO_PACKAGE_NAME='texinfo-7.3.tar.xz'
TEXINFO_PACKAGE_EXTRACTED_DIR='texinfo-7.3'

GDB_PACKAGE_URL='https://ftpmirror.gnu.org/gdb/gdb-17.2.tar.gz'
GDB_PACKAGE_SHA256SUM='cb891b9a9f554cac972eea5368176b240640ae90b681aae84bf873a9501f0063'
GDB_PACKAGE_NAME='gdb-17.2.tar.gz'
GDB_PACKAGE_EXTRACTED_DIR='gdb-17.2'

NEOVIM_PACKAGE_URL="https://github.com/neovim/neovim/releases/download/v0.12.4/nvim-linux-${ARCH/aarch64/arm64}.tar.gz"
if [[ "${ARCH}" == 'x86_64' ]]; then
	NEOVIM_PACKAGE_SHA256SUM='012bf3fcac5ade43914df3f174668bf64d05e049a4f032a388c027b1ebd78628'
else
	NEOVIM_PACKAGE_SHA256SUM='ceb7e88c6b681f0515d135dcdfad54f5eb4373b25ce6172197cd9a69c758063f'
fi
NEOVIM_PACKAGE_NAME="nvim-linux-${ARCH/aarch64/arm64}.tar.gz"

ZSTD_PACKAGE_URL='https://github.com/facebook/zstd/releases/download/v1.5.7/zstd-1.5.7.tar.gz'
ZSTD_PACKAGE_SHA256SUM='eb33e51f49a15e023950cd7825ca74a4a2b43db8354825ac24fc1b7ee09e6fa3'
ZSTD_PACKAGE_NAME='zstd-1.5.7.tar.gz'
ZSTD_PACKAGE_EXTRACTED_DIR='zstd-1.5.7'

CMAKE_PACKAGE_URL="https://github.com/Kitware/CMake/releases/download/v4.4.0/cmake-4.4.0-linux-${ARCH}.tar.gz"
if [[ "${ARCH}" == 'x86_64' ]]; then
	CMAKE_PACKAGE_SHA256SUM='3864eb649b4466ae126a64bbde1657adad78efbbaa068bf38201de5cf1b5349f'
elif [[ "${ARCH}" == 'aarch64' ]]; then
	CMAKE_PACKAGE_SHA256SUM='e98bb53e0b00a8f672424517d34c05bb9b94fd1c888c89e0b81bc8df51d1a94b'
fi
CMAKE_PACKAGE_NAME="cmake-4.4.0-linux-${ARCH}.tar.gz"
CMAKE_PACKAGE_EXTRACTED_DIR="cmake-4.4.0-linux-${ARCH}"

XXHASH_PACKAGE_URL='https://github.com/Cyan4973/xxHash/archive/refs/tags/v0.8.3.tar.gz'
XXHASH_PACKAGE_SHA256SUM='aae608dfe8213dfd05d909a57718ef82f30722c392344583d3f39050c7f29a80'
XXHASH_PACKAGE_NAME='xxHash-0.8.3.tar.gz'
XXHASH_PACKAGE_EXTRACTED_DIR='xxHash-0.8.3'

CCACHE_PACKAGE_URL='https://github.com/ccache/ccache/releases/download/v4.13.6/ccache-4.13.6.tar.gz'
CCACHE_PACKAGE_SHA256SUM='d42ace95dec14583fb8af19ed117919995bd910376f52d9b6f546046b792dfb7'
CCACHE_PACKAGE_NAME='ccache-4.13.6.tar.gz'
CCACHE_PACKAGE_EXTRACTED_DIR='ccache-4.13.6'

LIBXML2_PACKAGE_URL='https://github.com/GNOME/libxml2/archive/refs/tags/v2.15.3.tar.gz'
LIBXML2_PACKAGE_SHA256SUM='5c6060277173270356c3f1c321a640ab629bdabc5e5ba9095b99e00759ba0c39'
LIBXML2_PACKAGE_NAME='libxml2-2.15.3.tar.gz'
LIBXML2_PACKAGE_EXTRACTED_DIR='libxml2-2.15.3'

SWIG_PACKAGE_URL='https://downloads.sourceforge.net/project/swig/swig/swig-4.4.1/swig-4.4.1.tar.gz'
SWIG_PACKAGE_SHA256SUM='40162a706c56f7592d08fd52ef5511cb7ac191f3593cf07306a0a554c6281fcf'
SWIG_PACKAGE_NAME='swig-4.4.1.tar.gz'
SWIG_PACKAGE_EXTRACTED_DIR='swig-4.4.1'

LIBEDIT_PACKAGE_URL='https://www.thrysoee.dk/editline/libedit-20260512-3.1.tar.gz'
LIBEDIT_PACKAGE_SHA256SUM='432d5e7ea8b0116dd39f2eca7bc11d0eed77faa6b77ea526ace89907c23ea4a0'
LIBEDIT_PACKAGE_NAME='libedit-20260512-3.1.tar.gz'
LIBEDIT_PACKAGE_EXTRACTED_DIR='libedit-20260512-3.1'

LLVM_PACKAGE_URL='https://github.com/llvm/llvm-project/releases/download/llvmorg-22.1.8/llvm-project-22.1.8.src.tar.xz'
LLVM_PACKAGE_SHA256SUM='922f1817a0df7b1489272d18134ee0087a8b068828f87ac63b9861b1a9965888'
LLVM_PACKAGE_NAME='llvm-project-22.1.8.src.tar.xz'
LLVM_PACKAGE_EXTRACTED_DIR='llvm-project-22.1.8.src'

ZSH_PACKAGE_URL='https://downloads.sourceforge.net/project/zsh/zsh/5.9.2/zsh-5.9.2.tar.xz'
ZSH_PACKAGE_SHA256SUM='36fa734374b44783582cec09bcd67822e2f992c779ec1624ab5596df078d2f81'
ZSH_PACKAGE_NAME='zsh-5.9.2.tar.xz'
ZSH_PACKAGE_EXTRACTED_DIR='zsh-5.9.2'
