#!/bin/bash
# shellcheck disable=2034

ARCH="$(uname -m)"
if [[ "${ARCH}" == 'arm64' ]]; then
	ARCH='aarch64'
fi

TZDB_PACKAGE_URL='https://github.com/eggert/tz/archive/refs/tags/2025b.tar.gz'
TZDB_PACKAGE_SHA256SUM='7e281b316b85e20c9a67289805aa2a2ee041b5a41ccf5d096af3386ba76cf9d5'
TZDB_PACKAGE_NAME='tz-2025b.tar.gz'
TZDB_PACKAGE_EXTRACTED_DIR='tz-2025b'

M4_PACKAGE_URL='https://ftpmirror.gnu.org/m4/m4-1.4.20.tar.xz'
M4_PACKAGE_SHA256SUM='e236ea3a1ccf5f6c270b1c4bb60726f371fa49459a8eaaebc90b216b328daf2b'
M4_PACKAGE_NAME='m4-1.4.20.tar.xz'
M4_PACKAGE_EXTRACTED_DIR='m4-1.4.20'

AUTOCONF_PACKAGE_URL='https://ftpmirror.gnu.org/autoconf/autoconf-2.72.tar.gz'
AUTOCONF_PACKAGE_SHA256SUM='afb181a76e1ee72832f6581c0eddf8df032b83e2e0239ef79ebedc4467d92d6e'
AUTOCONF_PACKAGE_NAME='autoconf-2.72.tar.gz'
AUTOCONF_PACKAGE_EXTRACTED_DIR='autoconf-2.72'

AUTOMAKE_PACKAGE_URL='https://ftpmirror.gnu.org/automake/automake-1.18.1.tar.gz'
AUTOMAKE_PACKAGE_SHA256SUM='63e585246d0fc8772dffdee0724f2f988146d1a3f1c756a3dc5cfbefa3c01915'
AUTOMAKE_PACKAGE_NAME='automake-1.18.1.tar.gz'
AUTOMAKE_PACKAGE_EXTRACTED_DIR='automake-1.18.1'

LIBTOOL_PACKAGE_URL='https://ftpmirror.gnu.org/libtool/libtool-2.5.4.tar.gz'
LIBTOOL_PACKAGE_SHA256SUM='da8ebb2ce4dcf46b90098daf962cffa68f4b4f62ea60f798d0ef12929ede6adf'
LIBTOOL_PACKAGE_NAME='libtool-2.5.4.tar.gz'
LIBTOOL_PACKAGE_EXTRACTED_DIR='libtool-2.5.4'

MAKE_PACKAGE_URL='https://ftpmirror.gnu.org/make/make-4.4.1.tar.gz'
MAKE_PACKAGE_SHA256SUM='dd16fb1d67bfab79a72f5e8390735c49e3e8e70b4945a15ab1f81ddb78658fb3'
MAKE_PACKAGE_NAME='make-4.4.1.tar.gz'
MAKE_PACKAGE_EXTRACTED_DIR='make-4.4.1'

PKG_CONFIG_PACKAGE_URL='https://pkgconfig.freedesktop.org/releases/pkg-config-0.29.2.tar.gz'
PKG_CONFIG_PACKAGE_SHA256SUM='6fc69c01688c9458a57eb9a1664c9aba372ccda420a02bf4429fe610e7e7d591'
PKG_CONFIG_PACKAGE_NAME='pkg-config-0.29.2.tar.gz'
PKG_CONFIG_PACKAGE_EXTRACTED_DIR='pkg-config-0.29.2'

NINJA_PACKAGE_URL='https://github.com/ninja-build/ninja/archive/refs/tags/v1.13.1.tar.gz'
NINJA_PACKAGE_SHA256SUM='f0055ad0369bf2e372955ba55128d000cfcc21777057806015b45e4accbebf23'
NINJA_PACKAGE_NAME='ninja-1.13.1.tar.gz'
NINJA_PACKAGE_EXTRACTED_DIR='ninja-1.13.1'

PATCHELF_PACKAGE_URL="https://github.com/NixOS/patchelf/releases/download/0.16.1/patchelf-0.16.1-${ARCH}.tar.gz"
if [[ "${ARCH}" == 'x86_64' ]]; then
	PATCHELF_PACKAGE_SHA256SUM='4dc40fdd3b6bc108b7b9b9641e54cc3782bdea4199a7c79d9106fd6192a3e926'
elif [[ "${ARCH}" == 'aarch64' ]]; then
	PATCHELF_PACKAGE_SHA256SUM='743aa832459e5c95734106950c4826e7c637ecf24e9e426444d9ceeacf76f96b'
fi
PATCHELF_PACKAGE_NAME="patchelf-0.16.1-${ARCH}.tar.gz"

NCURSES_PACKAGE_URL='https://ftpmirror.gnu.org/ncurses/ncurses-6.5.tar.gz'
NCURSES_PACKAGE_SHA256SUM='136d91bc269a9a5785e5f9e980bc76ab57428f604ce3e5a5a90cebc767971cc6'
NCURSES_PACKAGE_NAME='ncurses-6.5.tar.gz'
NCURSES_PACKAGE_EXTRACTED_DIR='ncurses-6.5'

READLINE_PACKAGE_URL='https://ftpmirror.gnu.org/readline/readline-8.3.tar.gz'
READLINE_PACKAGE_SHA256SUM='fe5383204467828cd495ee8d1d3c037a7eba1389c22bc6a041f627976f9061cc'
READLINE_PACKAGE_NAME='readline-8.3.tar.gz'
READLINE_PACKAGE_EXTRACTED_DIR='readline-8.3'

LIBFFI_PACKAGE_URL='https://github.com/libffi/libffi/releases/download/v3.5.2/libffi-3.5.2.tar.gz'
LIBFFI_PACKAGE_SHA256SUM='f3a3082a23b37c293a4fcd1053147b371f2ff91fa7ea1b2a52e335676bac82dc'
LIBFFI_PACKAGE_NAME='libffi-3.5.2.tar.gz'
LIBFFI_PACKAGE_EXTRACTED_DIR='libffi-3.5.2'

ZLIB_PACKAGE_URL='https://github.com/madler/zlib/releases/download/v1.3.1/zlib-1.3.1.tar.gz'
ZLIB_PACKAGE_SHA256SUM='9a93b2b7dfdac77ceba5a558a580e74667dd6fede4585b91eefb60f03b72df23'
ZLIB_PACKAGE_NAME='zlib-1.3.1.tar.gz'
ZLIB_PACKAGE_EXTRACTED_DIR='zlib-1.3.1'

PERL_PACKAGE_URL='https://www.cpan.org/src/5.0/perl-5.42.0.tar.gz'
PERL_PACKAGE_SHA256SUM='e093ef184d7f9a1b9797e2465296f55510adb6dab8842b0c3ed53329663096dc'
PERL_PACKAGE_NAME='perl-5.42.0.tar.gz'
PERL_PACKAGE_EXTRACTED_DIR='perl-5.42.0'

OPENSSL_PACKAGE_URL='https://github.com/openssl/openssl/releases/download/openssl-3.6.0/openssl-3.6.0.tar.gz'
OPENSSL_PACKAGE_SHA256SUM='b6a5f44b7eb69e3fa35dbf15524405b44837a481d43d81daddde3ff21fcbb8e9'
OPENSSL_PACKAGE_NAME='openssl-3.6.0.tar.gz'
OPENSSL_PACKAGE_EXTRACTED_DIR='openssl-3.6.0'

CURL_PACKAGE_URL='https://curl.se/download/curl-8.16.0.tar.gz'
CURL_PACKAGE_SHA256SUM='a21e20476e39eca5a4fc5cfb00acf84bbc1f5d8443ec3853ad14c26b3c85b970'
CURL_PACKAGE_NAME='curl-8.16.0.tar.gz'
CURL_PACKAGE_EXTRACTED_DIR='curl-8.16.0'

WGET_PACKAGE_URL='https://ftpmirror.gnu.org/wget/wget2-2.2.0.tar.gz'
WGET_PACKAGE_SHA256SUM='2b3b9c85b7fb26d33ca5f41f1f8daca71838d869a19b406063aa5c655294d357'
WGET_PACKAGE_NAME='wget2-2.2.0.tar.gz'
WGET_PACKAGE_EXTRACTED_DIR='wget2-2.2.0'

BZIP2_PACKAGE_URL='https://sourceware.org/pub/bzip2/bzip2-1.0.8.tar.gz'
BZIP2_PACKAGE_SHA256SUM='ab5a03176ee106d3f0fa90e381da478ddae405918153cca248e682cd0c4a2269'
BZIP2_PACKAGE_NAME='bzip2-1.0.8.tar.gz'
BZIP2_PACKAGE_EXTRACTED_DIR='bzip2-1.0.8'

XZ_PACKAGE_URL='https://github.com/tukaani-project/xz/releases/download/v5.8.1/xz-5.8.1.tar.gz'
XZ_PACKAGE_SHA256SUM='507825b599356c10dca1cd720c9d0d0c9d5400b9de300af00e4d1ea150795543'
XZ_PACKAGE_NAME='xz-5.8.1.tar.gz'
XZ_PACKAGE_EXTRACTED_DIR='xz-5.8.1'

SQLITE_PACKAGE_URL='https://sqlite.org/2025/sqlite-autoconf-3500400.tar.gz'
SQLITE_PACKAGE_SHA256SUM='a3db587a1b92ee5ddac2f66b3edb41b26f9c867275782d46c3a088977d6a5b18'
SQLITE_PACKAGE_NAME='sqlite-autoconf-3500400.tar.gz'
SQLITE_PACKAGE_EXTRACTED_DIR='sqlite-autoconf-3500400'

PYTHON_PACKAGE_URL='https://github.com/python/cpython/archive/refs/tags/v3.14.0.tar.gz'
PYTHON_PACKAGE_SHA256SUM='703f51b3c79eeb0c31c044de10c0bdf3e45db86c495e13f735cd3afa01f650ab'
PYTHON_PACKAGE_NAME='cpython-3.14.0.tar.gz'
PYTHON_PACKAGE_EXTRACTED_DIR='cpython-3.14.0'

EXPAT_PACKAGE_URL='https://github.com/libexpat/libexpat/releases/download/R_2_7_3/expat-2.7.3.tar.gz'
EXPRT_PACKAGE_SHA256SUM='821ac9710d2c073eaf13e1b1895a9c9aa66c1157a99635c639fbff65cdbdd732'
EXPAT_PACKAGE_NAME='expat-2.7.3.tar.gz'
EXPAT_PACKAGE_EXTRACTED_DIR='expat-2.7.3'

GETTEXT_PACKAGE_URL='https://ftpmirror.gnu.org/gettext/gettext-0.26.tar.xz'
GETTEXT_PACKAGE_SHA256SUM='d1fb86e260cfe7da6031f94d2e44c0da55903dbae0a2fa0fae78c91ae1b56f00'
GETTEXT_PACKAGE_NAME='gettext-0.26.tar.xz'
GETTEXT_PACKAGE_EXTRACTED_DIR='gettext-0.26'

GIT_PACKAGE_URL='https://github.com/git/git/archive/refs/tags/v2.51.1.tar.gz'
GIT_PACKAGE_SHA256SUM='586fc2c8ba466c1f2122d44047e5fb575a5c0a7620840d3ab5f6943fc281c8c4'
GIT_PACKAGE_NAME='git-2.51.1.tar.gz'
GIT_PACKAGE_EXTRACTED_DIR='git-2.51.1'

GMP_PACKAGE_URL='https://ftpmirror.gnu.org/gmp/gmp-6.3.0.tar.xz'
GMP_PACKAGE_SHA256SUM='a3c2b80201b89e68616f4ad30bc66aee4927c3ce50e33929ca819d5c43538898'
GMP_PACKAGE_NAME='gmp-6.3.0.tar.xz'
GMP_PACKAGE_EXTRACTED_DIR='gmp-6.3.0'

MPFR_PACKAGE_URL='https://ftpmirror.gnu.org/mpfr/mpfr-4.2.2.tar.xz'
MPFR_PACKAGE_SHA256SUM='b67ba0383ef7e8a8563734e2e889ef5ec3c3b898a01d00fa0a6869ad81c6ce01'
MPFR_PACKAGE_NAME='mpfr-4.2.2.tar.xz'
MPFR_PACKAGE_EXTRACTED_DIR='mpfr-4.2.2'

TEXINFO_PACKAGE_URL='https://ftpmirror.gnu.org/texinfo/texinfo-7.2.tar.xz'
TEXINFO_PACKAGE_SHA256SUM='0329d7788fbef113fa82cb80889ca197a344ce0df7646fe000974c5d714363a6'
TEXINFO_PACKAGE_NAME='texinfo-7.2.tar.xz'
TEXINFO_PACKAGE_EXTRACTED_DIR='texinfo-7.2'

GDB_PACKAGE_URL='https://ftpmirror.gnu.org/gdb/gdb-16.3.tar.gz'
GDB_PACKAGE_SHA256SUM='86015081217dc82c5485db9ce864dcc0b703759d2bdbe4441b095c5f900a6a37'
GDB_PACKAGE_NAME='gdb-16.3.tar.gz'
GDB_PACKAGE_EXTRACTED_DIR='gdb-16.3'

NEOVIM_PACKAGE_URL="https://github.com/neovim/neovim/releases/download/v0.11.4/nvim-linux-${ARCH/aarch64/arm64}.tar.gz"
if [[ "${ARCH}" == 'x86_64' ]]; then
	NEOVIM_PACKAGE_SHA256SUM='a74740047e73b2b380d63a474282814063d10650cd6cc95efa16d1713c7e616c'
else
	NEOVIM_PACKAGE_SHA256SUM='684e4262d2296e469cb43f0d05edbbb52b960b7f117bed6b22936fc768993cd9'
fi
NEOVIM_PACKAGE_NAME="nvim-linux-${ARCH/aarch64/arm64}.tar.gz"

ZSTD_PACKAGE_URL='https://github.com/facebook/zstd/releases/download/v1.5.7/zstd-1.5.7.tar.gz'
ZSTD_PACKAGE_SHA256SUM='eb33e51f49a15e023950cd7825ca74a4a2b43db8354825ac24fc1b7ee09e6fa3'
ZSTD_PACKAGE_NAME='zstd-1.5.7.tar.gz'
ZSTD_PACKAGE_EXTRACTED_DIR='zstd-1.5.7'

CMAKE_PACKAGE_URL="https://github.com/Kitware/CMake/releases/download/v4.1.2/cmake-4.1.2-linux-${ARCH}.tar.gz"
if [[ "${ARCH}" == 'x86_64' ]]; then
	CMAKE_PACKAGE_SHA256SUM='773cc679c3a7395413bd096523f8e5d6c39f8718af4e12eb4e4195f72f35e4ab'
elif [[ "${ARCH}" == 'aarch64' ]]; then
	CMAKE_PACKAGE_SHA256SUM='0634996f918b3bab11f45522899c81c987b09c9a64d15f6a0d2bb51c42099534'
fi
CMAKE_PACKAGE_NAME="cmake-4.1.2-linux-${ARCH}.tar.gz"

XXHASH_PACKAGE_URL='https://github.com/Cyan4973/xxHash/archive/refs/tags/v0.8.3.tar.gz'
XXHASH_PACKAGE_SHA256SUM='aae608dfe8213dfd05d909a57718ef82f30722c392344583d3f39050c7f29a80'
XXHASH_PACKAGE_NAME='xxHash-0.8.3.tar.gz'
XXHASH_PACKAGE_EXTRACTED_DIR='xxHash-0.8.3'

CCACHE_PACKAGE_URL='https://github.com/ccache/ccache/releases/download/v4.12.1/ccache-4.12.1.tar.gz'
CCACHE_PACKAGE_SHA256SUM='a3da50ab0fb0d42f60c17d1450312e6ace9b681f6221cb77c8a09a845f9d760c'
CCACHE_PACKAGE_NAME='ccache-4.12.1.tar.gz'
CCACHE_PACKAGE_EXTRACTED_DIR='ccache-4.12.1'

LIBXML2_PACKAGE_URL='https://github.com/GNOME/libxml2/archive/refs/tags/v2.15.1.tar.gz'
LIBXML2_PACKAGE_SHA256SUM='23b1ebd74cc562cd592cd2618c2bd88dc06fa0dfdbcd56e03cb26d6ff6b7e373'
LIBXML2_PACKAGE_NAME='libxml2-2.15.1.tar.gz'
LIBXML2_PACKAGE_EXTRACTED_DIR='libxml2-2.15.1'

SWIG_PACKAGE_URL='https://downloads.sourceforge.net/project/swig/swig/swig-4.4.0/swig-4.4.0.tar.gz'
SWIG_PACKAGE_SHA256SUM='c3f8e5dcd68c18aa19847b33b0a1bb92f07e904c53ae9cf5ae4ff8727a72927e'
SWIG_PACKAGE_NAME='swig-4.4.0.tar.gz'
SWIG_PACKAGE_EXTRACTED_DIR='swig-4.4.0'

LIBEDIT_PACKAGE_URL='https://www.thrysoee.dk/editline/libedit-20250104-3.1.tar.gz'
LIBEDIT_PACKAGE_SHA256SUM='23792701694550a53720630cd1cd6167101b5773adddcb4104f7345b73a568ac'
LIBEDIT_PACKAGE_NAME='libedit-20250104-3.1.tar.gz'
LIBEDIT_PACKAGE_EXTRACTED_DIR='libedit-20250104-3.1'

LLVM_PACKAGE_URL='https://github.com/llvm/llvm-project/releases/download/llvmorg-21.1.4/llvm-project-21.1.4.src.tar.xz'
LLVM_PACKAGE_SHA256SUM='a01ad7e5167780c945871d75c0413081d12067607a6de5cf71dc3e8d1a82112c'
LLVM_PACKAGE_NAME='llvm-project-21.1.4.src.tar.xz'
LLVM_PACKAGE_EXTRACTED_DIR='llvm-project-21.1.4.src'

ZSH_PACKAGE_URL='https://downloads.sourceforge.net/project/zsh/zsh/5.9/zsh-5.9.tar.xz'
ZSH_PACKAGE_SHA256SUM='9b8d1ecedd5b5e81fbf1918e876752a7dd948e05c1a0dba10ab863842d45acd5'
ZSH_PACKAGE_NAME='zsh-5.9.tar.xz'
ZSH_PACKAGE_EXTRACTED_DIR='zsh-5.9'
