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

READLINE_PACKAGE_URL='https://ftpmirror.gnu.org/readline/readline-8.2.13.tar.gz'
READLINE_PACKAGE_SHA256SUM='0e5be4d2937e8bd9b7cd60d46721ce79f88a33415dd68c2d738fb5924638f656'
READLINE_PACKAGE_NAME='readline-8.2.13.tar.gz'
READLINE_PACKAGE_EXTRACTED_DIR='readline-8.2.13'

LIBFFI_PACKAGE_URL='https://github.com/libffi/libffi/releases/download/v3.5.1/libffi-3.5.1.tar.gz'
LIBFFI_PACKAGE_SHA256SUM='f99eb68a67c7d54866b7706af245e87ba060d419a062474b456d3bc8d4abdbd1'
LIBFFI_PACKAGE_NAME='libffi-3.5.1.tar.gz'
LIBFFI_PACKAGE_EXTRACTED_DIR='libffi-3.5.1'

ZLIB_PACKAGE_URL='https://github.com/madler/zlib/releases/download/v1.3.1/zlib-1.3.1.tar.gz'
ZLIB_PACKAGE_SHA256SUM='9a93b2b7dfdac77ceba5a558a580e74667dd6fede4585b91eefb60f03b72df23'
ZLIB_PACKAGE_NAME='zlib-1.3.1.tar.gz'
ZLIB_PACKAGE_EXTRACTED_DIR='zlib-1.3.1'

PERL_PACKAGE_URL='https://www.cpan.org/src/5.0/perl-5.40.2.tar.gz'
PERL_PACKAGE_SHA256SUM='10d4647cfbb543a7f9ae3e5f6851ec49305232ea7621aed24c7cfbb0bef4b70d'
PERL_PACKAGE_NAME='perl-5.40.2.tar.gz'
PERL_PACKAGE_EXTRACTED_DIR='perl-5.40.2'

OPENSSL_PACKAGE_URL='https://github.com/openssl/openssl/releases/download/openssl-3.5.1/openssl-3.5.1.tar.gz'
OPENSSL_PACKAGE_SHA256SUM='529043b15cffa5f36077a4d0af83f3de399807181d607441d734196d889b641f'
OPENSSL_PACKAGE_NAME='openssl-3.5.1.tar.gz'
OPENSSL_PACKAGE_EXTRACTED_DIR='openssl-3.5.1'

CURL_PACKAGE_URL='https://curl.se/download/curl-8.14.1.tar.gz'
CURL_PACKAGE_SHA256SUM='6766ada7101d292b42b8b15681120acd68effa4a9660935853cf6d61f0d984d4'
CURL_PACKAGE_NAME='curl-8.14.1.tar.gz'
CURL_PACKAGE_EXTRACTED_DIR='curl-8.14.1'

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

SQLITE_PACKAGE_URL='https://sqlite.org/2025/sqlite-autoconf-3500100.tar.gz'
SQLITE_PACKAGE_SHA256SUM='00a65114d697cfaa8fe0630281d76fd1b77afcd95cd5e40ec6a02cbbadbfea71'
SQLITE_PACKAGE_NAME='sqlite-autoconf-3500100.tar.gz'
SQLITE_PACKAGE_EXTRACTED_DIR='sqlite-autoconf-3500100'

PYTHON_PACKAGE_URL='https://github.com/python/cpython/archive/refs/tags/v3.13.5.tar.gz'
PYTHON_PACKAGE_SHA256SUM='f313a2f32818c35d95814455311cc3f1e1e09c81b7d00a814f325048404c02eb'
PYTHON_PACKAGE_NAME='cpython-3.13.5.tar.gz'
PYTHON_PACKAGE_EXTRACTED_DIR='cpython-3.13.5'

EXPAT_PACKAGE_URL='https://github.com/libexpat/libexpat/releases/download/R_2_7_1/expat-2.7.1.tar.gz'
EXPRT_PACKAGE_SHA256SUM='0cce2e6e69b327fc607b8ff264f4b66bdf71ead55a87ffd5f3143f535f15cfa2'
EXPAT_PACKAGE_NAME='expat-2.7.1.tar.gz'
EXPAT_PACKAGE_EXTRACTED_DIR='expat-2.7.1'

GETTEXT_PACKAGE_URL='https://ftpmirror.gnu.org/gettext/gettext-0.25.1.tar.xz'
GETTEXT_PACKAGE_SHA256SUM='2c8294be238f03fb3fa65b8051057e5b68167f3e21f08008070cf40a7051ba22'
GETTEXT_PACKAGE_NAME='gettext-0.25.1.tar.xz'
GETTEXT_PACKAGE_EXTRACTED_DIR='gettext-0.25.1'

GIT_PACKAGE_URL='https://mirrors.edge.kernel.org/pub/software/scm/git/git-2.50.0.tar.gz'
GIT_PACKAGE_SHA256SUM='920f8ca563d16a7d4fdecb44349cbffbc5cb814a8b36c96028463478197050da'
GIT_PACKAGE_NAME='git-2.50.0.tar.gz'
GIT_PACKAGE_EXTRACTED_DIR='git-2.50.0'

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

NEOVIM_PACKAGE_URL="https://github.com/neovim/neovim/releases/download/v0.11.2/nvim-linux-${ARCH/aarch64/arm64}.tar.gz"
if [[ "${ARCH}" == 'x86_64' ]]; then
	NEOVIM_PACKAGE_SHA256SUM='a9b24157672eb218ff3e33ef3f8c08db26f8931c5c04bdb0e471371dd1dfe63e'
else
	NEOVIM_PACKAGE_SHA256SUM='8a832289ba2a17918b7a893160fcc4b24ba87141a5a07cdbb7304d53834c0c40'
fi
NEOVIM_PACKAGE_NAME="nvim-linux-${ARCH/aarch64/arm64}.tar.gz"

ZSTD_PACKAGE_URL='https://github.com/facebook/zstd/releases/download/v1.5.7/zstd-1.5.7.tar.gz'
ZSTD_PACKAGE_SHA256SUM='eb33e51f49a15e023950cd7825ca74a4a2b43db8354825ac24fc1b7ee09e6fa3'
ZSTD_PACKAGE_NAME='zstd-1.5.7.tar.gz'
ZSTD_PACKAGE_EXTRACTED_DIR='zstd-1.5.7'

CMAKE_PACKAGE_URL="https://github.com/Kitware/CMake/releases/download/v4.0.3/cmake-4.0.3-linux-${ARCH}.tar.gz"
if [[ "${ARCH}" == 'x86_64' ]]; then
	CMAKE_PACKAGE_SHA256SUM='585ae9e013107bc8e7c7c9ce872cbdcbdff569e675b07ef57aacfb88c886faac'
elif [[ "${ARCH}" == 'aarch64' ]]; then
	CMAKE_PACKAGE_SHA256SUM='391da1544ef50ac31300841caaf11db4de3976cdc4468643272e44b3f4644713'
fi
CMAKE_PACKAGE_NAME="cmake-4.0.3-linux-${ARCH}.tar.gz"

XXHASH_PACKAGE_URL='https://github.com/Cyan4973/xxHash/archive/refs/tags/v0.8.3.tar.gz'
XXHASH_PACKAGE_SHA256SUM='aae608dfe8213dfd05d909a57718ef82f30722c392344583d3f39050c7f29a80'
XXHASH_PACKAGE_NAME='xxHash-0.8.3.tar.gz'
XXHASH_PACKAGE_EXTRACTED_DIR='xxHash-0.8.3'

CCACHE_PACKAGE_URL='https://github.com/ccache/ccache/releases/download/v4.11.3/ccache-4.11.3.tar.gz'
CCACHE_PACKAGE_SHA256SUM='28a407314f03a7bd7a008038dbaffa83448bc670e2fc119609b1d99fb33bb600'
CCACHE_PACKAGE_NAME='ccache-4.11.3.tar.gz'
CCACHE_PACKAGE_EXTRACTED_DIR='ccache-4.11.3'

LIBXML2_PACKAGE_URL='https://github.com/GNOME/libxml2/archive/refs/tags/v2.14.4.tar.gz'
LIBXML2_PACKAGE_SHA256SUM='fe59cb94cf6f2ca18d57f3a99e9509d2dd555bbd930e00f637eb3b8ba886c468'
LIBXML2_PACKAGE_NAME='libxml2-2.14.4.tar.gz'
LIBXML2_PACKAGE_EXTRACTED_DIR='libxml2-2.14.4'

SWIG_PACKAGE_URL='https://downloads.sourceforge.net/project/swig/swig/swig-4.3.1/swig-4.3.1.tar.gz'
SWIG_PACKAGE_SHA256SUM='44fc829f70f1e17d635a2b4d69acab38896699ecc24aa023e516e0eabbec61b8'
SWIG_PACKAGE_NAME='swig-4.3.1.tar.gz'
SWIG_PACKAGE_EXTRACTED_DIR='swig-4.3.1'

LIBEDIT_PACKAGE_URL='https://www.thrysoee.dk/editline/libedit-20250104-3.1.tar.gz'
LIBEDIT_PACKAGE_SHA256SUM='23792701694550a53720630cd1cd6167101b5773adddcb4104f7345b73a568ac'
LIBEDIT_PACKAGE_NAME='libedit-20250104-3.1.tar.gz'
LIBEDIT_PACKAGE_EXTRACTED_DIR='libedit-20250104-3.1'

LLVM_PACKAGE_URL='https://github.com/llvm/llvm-project/releases/download/llvmorg-20.1.7/llvm-project-20.1.7.src.tar.xz'
LLVM_PACKAGE_SHA256SUM='cd8fd55d97ad3e360b1d5aaf98388d1f70dfffb7df36beee478be3b839ff9008'
LLVM_PACKAGE_NAME='llvm-project-20.1.7.src.tar.xz'
LLVM_PACKAGE_EXTRACTED_DIR='llvm-project-20.1.7.src'

ZSH_PACKAGE_URL='https://downloads.sourceforge.net/project/zsh/zsh/5.9/zsh-5.9.tar.xz'
ZSH_PACKAGE_SHA256SUM='9b8d1ecedd5b5e81fbf1918e876752a7dd948e05c1a0dba10ab863842d45acd5'
ZSH_PACKAGE_NAME='zsh-5.9.tar.xz'
ZSH_PACKAGE_EXTRACTED_DIR='zsh-5.9'
