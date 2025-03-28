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

M4_PACKAGE_URL='https://ftpmirror.gnu.org/m4/m4-1.4.19.tar.xz'
M4_PACKAGE_SHA256SUM='63aede5c6d33b6d9b13511cd0be2cac046f2e70fd0a07aa9573a04a82783af96'
M4_PACKAGE_NAME='m4-1.4.19.tar.xz'
M4_PACKAGE_EXTRACTED_DIR='m4-1.4.19'

AUTOCONF_PACKAGE_URL='https://ftpmirror.gnu.org/autoconf/autoconf-2.72.tar.gz'
AUTOCONF_PACKAGE_SHA256SUM='afb181a76e1ee72832f6581c0eddf8df032b83e2e0239ef79ebedc4467d92d6e'
AUTOCONF_PACKAGE_NAME='autoconf-2.72.tar.gz'
AUTOCONF_PACKAGE_EXTRACTED_DIR='autoconf-2.72'

AUTOMAKE_PACKAGE_URL='https://ftpmirror.gnu.org/automake/automake-1.17.tar.gz'
AUTOMAKE_PACKAGE_SHA256SUM='397767d4db3018dd4440825b60c64258b636eaf6bf99ac8b0897f06c89310acd'
AUTOMAKE_PACKAGE_NAME='automake-1.17.tar.gz'
AUTOMAKE_PACKAGE_EXTRACTED_DIR='automake-1.17'

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

NINJA_PACKAGE_URL='https://github.com/ninja-build/ninja/archive/refs/tags/v1.12.1.tar.gz'
NINJA_PACKAGE_SHA256SUM='821bdff48a3f683bc4bb3b6f0b5fe7b2d647cf65d52aeb63328c91a6c6df285a'
NINJA_PACKAGE_NAME='ninja-1.12.1.tar.gz'
NINJA_PACKAGE_EXTRACTED_DIR='ninja-1.12.1'

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

LIBFFI_PACKAGE_URL='https://github.com/libffi/libffi/releases/download/v3.4.7/libffi-3.4.7.tar.gz'
LIBFFI_PACKAGE_SHA256SUM='138607dee268bdecf374adf9144c00e839e38541f75f24a1fcf18b78fda48b2d'
LIBFFI_PACKAGE_NAME='libffi-3.4.7.tar.gz'
LIBFFI_PACKAGE_EXTRACTED_DIR='libffi-3.4.7'

ZLIB_PACKAGE_URL='https://github.com/madler/zlib/releases/download/v1.3.1/zlib-1.3.1.tar.gz'
ZLIB_PACKAGE_SHA256SUM='9a93b2b7dfdac77ceba5a558a580e74667dd6fede4585b91eefb60f03b72df23'
ZLIB_PACKAGE_NAME='zlib-1.3.1.tar.gz'
ZLIB_PACKAGE_EXTRACTED_DIR='zlib-1.3.1'

PERL_PACKAGE_URL='https://www.cpan.org/src/5.0/perl-5.40.1.tar.gz'
PERL_PACKAGE_SHA256SUM='02f8c45bb379ed0c3de7514fad48c714fd46be8f0b536bfd5320050165a1ee26'
PERL_PACKAGE_NAME='perl-5.40.1.tar.gz'
PERL_PACKAGE_EXTRACTED_DIR='perl-5.40.1'

OPENSSL_PACKAGE_URL='https://github.com/openssl/openssl/releases/download/openssl-3.4.1/openssl-3.4.1.tar.gz'
OPENSSL_PACKAGE_SHA256SUM='002a2d6b30b58bf4bea46c43bdd96365aaf8daa6c428782aa4feee06da197df3'
OPENSSL_PACKAGE_NAME='openssl-3.4.1.tar.gz'
OPENSSL_PACKAGE_EXTRACTED_DIR='openssl-3.4.1'

CURL_PACKAGE_URL='https://curl.se/download/curl-8.12.1.tar.gz'
CURL_PACKAGE_SHA256SUM='7b40ea64947e0b440716a4d7f0b7aa56230a5341c8377d7b609649d4aea8dbcf'
CURL_PACKAGE_NAME='curl-8.12.1.tar.gz'
CURL_PACKAGE_EXTRACTED_DIR='curl-8.12.1'

WGET_PACKAGE_URL='https://ftpmirror.gnu.org/wget/wget2-2.2.0.tar.gz'
WGET_PACKAGE_SHA256SUM='2b3b9c85b7fb26d33ca5f41f1f8daca71838d869a19b406063aa5c655294d357'
WGET_PACKAGE_NAME='wget2-2.2.0.tar.gz'
WGET_PACKAGE_EXTRACTED_DIR='wget2-2.2.0'

BZIP2_PACKAGE_URL='https://sourceware.org/pub/bzip2/bzip2-1.0.8.tar.gz'
BZIP2_PACKAGE_SHA256SUM='ab5a03176ee106d3f0fa90e381da478ddae405918153cca248e682cd0c4a2269'
BZIP2_PACKAGE_NAME='bzip2-1.0.8.tar.gz'
BZIP2_PACKAGE_EXTRACTED_DIR='bzip2-1.0.8'

XZ_PACKAGE_URL='https://github.com/tukaani-project/xz/releases/download/v5.8.0/xz-5.8.0.tar.gz'
XZ_PACKAGE_SHA256SUM='b523c5e47d1490338c5121bdf2a6ecca2bcf0dce05a83ad40a830029cbe6679b'
XZ_PACKAGE_NAME='xz-5.8.0.tar.gz'
XZ_PACKAGE_EXTRACTED_DIR='xz-5.8.0'

SQLITE_PACKAGE_URL='https://sqlite.org/2025/sqlite-autoconf-3490100.tar.gz'
SQLITE_PACKAGE_SHA256SUM='106642d8ccb36c5f7323b64e4152e9b719f7c0215acf5bfeac3d5e7f97b59254'
SQLITE_PACKAGE_NAME='sqlite-autoconf-3490100.tar.gz'
SQLITE_PACKAGE_EXTRACTED_DIR='sqlite-autoconf-3490100'

PYTHON_PACKAGE_URL='https://github.com/python/cpython/archive/refs/tags/v3.13.2.tar.gz'
PYTHON_PACKAGE_SHA256SUM='a0e0b542861672d44b8cb596aea4c03ef91f59f0f717710f654f1abba9516996'
PYTHON_PACKAGE_NAME='cpython-3.13.2.tar.gz'
PYTHON_PACKAGE_EXTRACTED_DIR='cpython-3.13.2'

EXPAT_PACKAGE_URL='https://github.com/libexpat/libexpat/releases/download/R_2_7_1/expat-2.7.1.tar.gz'
EXPRT_PACKAGE_SHA256SUM='0cce2e6e69b327fc607b8ff264f4b66bdf71ead55a87ffd5f3143f535f15cfa2'
EXPAT_PACKAGE_NAME='expat-2.7.1.tar.gz'
EXPAT_PACKAGE_EXTRACTED_DIR='expat-2.7.1'

GETTEXT_PACKAGE_URL='https://ftpmirror.gnu.org/gettext/gettext-0.24.tar.xz'
GETTEXT_PACKAGE_SHA256SUM='e1620d518b26d7d3b16ac570e5018206e8b0d725fb65c02d048397718b5cf318'
GETTEXT_PACKAGE_NAME='gettext-0.24.tar.xz'
GETTEXT_PACKAGE_EXTRACTED_DIR='gettext-0.24'

GIT_PACKAGE_URL='https://mirrors.edge.kernel.org/pub/software/scm/git/git-2.49.0.tar.gz'
GIT_PACKAGE_SHA256SUM='f8047f572f665bebeb637fd5f14678f31b3ca5d2ff9a18f20bd925bd48f75d3c'
GIT_PACKAGE_NAME='git-2.49.0.tar.gz'
GIT_PACKAGE_EXTRACTED_DIR='git-2.49.0'

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

GDB_PACKAGE_URL='https://ftpmirror.gnu.org/gdb/gdb-16.2.tar.gz'
GDB_PACKAGE_SHA256SUM='bdc1da4a033280ac752e7d34b0418efaa45bed093235cb88e62ea961752a37f8'
GDB_PACKAGE_NAME='gdb-16.2.tar.gz'
GDB_PACKAGE_EXTRACTED_DIR='gdb-16.2'

NEOVIM_PACKAGE_URL="https://github.com/neovim/neovim/releases/download/v0.11.0/nvim-linux-${ARCH/aarch64/arm64}.tar.gz"
if [[ "${ARCH}" == 'x86_64' ]]; then
	NEOVIM_PACKAGE_SHA256SUM='fe0a5bc79e64c5e4d9f844cd96157ebd3919ef1343b329e9ebc3f455924cc7d6'
else
	NEOVIM_PACKAGE_SHA256SUM='6959583f45042da20e0a082dc65108725629a4739ab91246c678fd084ecaf50e'
fi
NEOVIM_PACKAGE_NAME="nvim-linux-${ARCH/aarch64/arm64}.tar.gz"

ZSTD_PACKAGE_URL='https://github.com/facebook/zstd/releases/download/v1.5.7/zstd-1.5.7.tar.gz'
ZSTD_PACKAGE_SHA256SUM='eb33e51f49a15e023950cd7825ca74a4a2b43db8354825ac24fc1b7ee09e6fa3'
ZSTD_PACKAGE_NAME='zstd-1.5.7.tar.gz'
ZSTD_PACKAGE_EXTRACTED_DIR='zstd-1.5.7'

CMAKE_PACKAGE_URL="https://github.com/Kitware/CMake/releases/download/v4.0.0/cmake-4.0.0-linux-${ARCH}.tar.gz"
if [[ "${ARCH}" == 'x86_64' ]]; then
	CMAKE_PACKAGE_SHA256SUM='a06e6e32da747e569162bc0442a3fd400fadd9db7d4f185c9e4464ab299a294b'
elif [[ "${ARCH}" == 'aarch64' ]]; then
	CMAKE_PACKAGE_SHA256SUM='3727d7a6ca900331447a55c08404cc11248b2e8d2709a6b3ed85b01189bb16af'
fi
CMAKE_PACKAGE_NAME="cmake-4.0.0-linux-${ARCH}.tar.gz"

XXHASH_PACKAGE_URL='https://github.com/Cyan4973/xxHash/archive/refs/tags/v0.8.3.tar.gz'
XXHASH_PACKAGE_SHA256SUM='aae608dfe8213dfd05d909a57718ef82f30722c392344583d3f39050c7f29a80'
XXHASH_PACKAGE_NAME='xxHash-0.8.3.tar.gz'
XXHASH_PACKAGE_EXTRACTED_DIR='xxHash-0.8.3'

CCACHE_PACKAGE_URL='https://github.com/ccache/ccache/releases/download/v4.11.2/ccache-4.11.2.tar.gz'
CCACHE_PACKAGE_SHA256SUM='d51b82bb8c3932649323fd4cb8e5a0a9f7fe7f672c71a6d6839bee13b4ded4c5'
CCACHE_PACKAGE_NAME='ccache-4.11.2.tar.gz'
CCACHE_PACKAGE_EXTRACTED_DIR='ccache-4.11.2'

LIBXML2_PACKAGE_URL='https://github.com/GNOME/libxml2/archive/refs/tags/v2.14.0.tar.gz'
LIBXML2_PACKAGE_SHA256SUM='5ef0c82e17b26c90ecd06f0feaeb60892bf1f9a8beef89dce20f3425bec337de'
LIBXML2_PACKAGE_NAME='libxml2-2.14.0.tar.gz'
LIBXML2_PACKAGE_EXTRACTED_DIR='libxml2-2.14.0'

SWIG_PACKAGE_URL='https://downloads.sourceforge.net/project/swig/swig/swig-4.3.0/swig-4.3.0.tar.gz'
SWIG_PACKAGE_SHA256SUM='f7203ef796f61af986c70c05816236cbd0d31b7aa9631e5ab53020ab7804aa9e'
SWIG_PACKAGE_NAME='swig-4.3.0.tar.gz'
SWIG_PACKAGE_EXTRACTED_DIR='swig-4.3.0'

LIBEDIT_PACKAGE_URL='https://www.thrysoee.dk/editline/libedit-20250104-3.1.tar.gz'
LIBEDIT_PACKAGE_SHA256SUM='23792701694550a53720630cd1cd6167101b5773adddcb4104f7345b73a568ac'
LIBEDIT_PACKAGE_NAME='libedit-20250104-3.1.tar.gz'
LIBEDIT_PACKAGE_EXTRACTED_DIR='libedit-20250104-3.1'

LLVM_PACKAGE_URL='https://github.com/llvm/llvm-project/releases/download/llvmorg-20.1.1/llvm-project-20.1.1.src.tar.xz'
LLVM_PACKAGE_SHA256SUM='4d5ebbd40ce1e984a650818a4bb5ae86fc70644dec2e6d54e78b4176db3332e0'
LLVM_PACKAGE_NAME='llvm-project-20.1.1.src.tar.xz'
LLVM_PACKAGE_EXTRACTED_DIR='llvm-project-20.1.1.src'

ZSH_PACKAGE_URL='https://downloads.sourceforge.net/project/zsh/zsh/5.9/zsh-5.9.tar.xz'
ZSH_PACKAGE_SHA256SUM='9b8d1ecedd5b5e81fbf1918e876752a7dd948e05c1a0dba10ab863842d45acd5'
ZSH_PACKAGE_NAME='zsh-5.9.tar.xz'
ZSH_PACKAGE_EXTRACTED_DIR='zsh-5.9'
