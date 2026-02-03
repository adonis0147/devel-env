#!/bin/bash
# shellcheck disable=2034

ARCH="$(uname -m)"
if [[ "${ARCH}" == 'arm64' ]]; then
	ARCH='aarch64'
fi

TZDB_PACKAGE_URL='https://github.com/eggert/tz/archive/refs/tags/2025c.tar.gz'
TZDB_PACKAGE_SHA256SUM='d970fb6753529583226fb1bb9df6237e5e968ea7d70a8bd0df2f3394c86f7ac4'
TZDB_PACKAGE_NAME='tz-2025c.tar.gz'
TZDB_PACKAGE_EXTRACTED_DIR='tz-2025c'

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

NINJA_PACKAGE_URL='https://github.com/ninja-build/ninja/archive/refs/tags/v1.13.2.tar.gz'
NINJA_PACKAGE_SHA256SUM='974d6b2f4eeefa25625d34da3cb36bdcebe7fbce40f4c16ac0835fd1c0cbae17'
NINJA_PACKAGE_NAME='ninja-1.13.2.tar.gz'
NINJA_PACKAGE_EXTRACTED_DIR='ninja-1.13.2'

PATCHELF_PACKAGE_URL="https://github.com/NixOS/patchelf/releases/download/0.16.1/patchelf-0.16.1-${ARCH}.tar.gz"
if [[ "${ARCH}" == 'x86_64' ]]; then
	PATCHELF_PACKAGE_SHA256SUM='4dc40fdd3b6bc108b7b9b9641e54cc3782bdea4199a7c79d9106fd6192a3e926'
elif [[ "${ARCH}" == 'aarch64' ]]; then
	PATCHELF_PACKAGE_SHA256SUM='743aa832459e5c95734106950c4826e7c637ecf24e9e426444d9ceeacf76f96b'
fi
PATCHELF_PACKAGE_NAME="patchelf-0.16.1-${ARCH}.tar.gz"

NCURSES_PACKAGE_URL='https://ftpmirror.gnu.org/ncurses/ncurses-6.6.tar.gz'
NCURSES_PACKAGE_SHA256SUM='355b4cbbed880b0381a04c46617b7656e362585d52e9cf84a67e2009b749ff11'
NCURSES_PACKAGE_NAME='ncurses-6.6.tar.gz'
NCURSES_PACKAGE_EXTRACTED_DIR='ncurses-6.6'

READLINE_PACKAGE_URL='https://ftpmirror.gnu.org/readline/readline-8.3.tar.gz'
READLINE_PACKAGE_SHA256SUM='fe5383204467828cd495ee8d1d3c037a7eba1389c22bc6a041f627976f9061cc'
READLINE_PACKAGE_NAME='readline-8.3.tar.gz'
READLINE_PACKAGE_EXTRACTED_DIR='readline-8.3'

LIBFFI_PACKAGE_URL='https://github.com/libffi/libffi/releases/download/v3.5.2/libffi-3.5.2.tar.gz'
LIBFFI_PACKAGE_SHA256SUM='f3a3082a23b37c293a4fcd1053147b371f2ff91fa7ea1b2a52e335676bac82dc'
LIBFFI_PACKAGE_NAME='libffi-3.5.2.tar.gz'
LIBFFI_PACKAGE_EXTRACTED_DIR='libffi-3.5.2'

ZLIB_PACKAGE_URL='https://github.com/madler/zlib/archive/refs/tags/v1.3.1.2.tar.gz'
ZLIB_PACKAGE_SHA256SUM='fbf1c8476136693e6c3f1fa26e6d8c4f2c8b5a5c44340c04df349dad02eed09e'
ZLIB_PACKAGE_NAME='zlib-1.3.1.2.tar.gz'
ZLIB_PACKAGE_EXTRACTED_DIR='zlib-1.3.1.2'

PERL_PACKAGE_URL='https://www.cpan.org/src/5.0/perl-5.42.0.tar.gz'
PERL_PACKAGE_SHA256SUM='e093ef184d7f9a1b9797e2465296f55510adb6dab8842b0c3ed53329663096dc'
PERL_PACKAGE_NAME='perl-5.42.0.tar.gz'
PERL_PACKAGE_EXTRACTED_DIR='perl-5.42.0'

OPENSSL_PACKAGE_URL='https://github.com/openssl/openssl/releases/download/openssl-3.6.1/openssl-3.6.1.tar.gz'
OPENSSL_PACKAGE_SHA256SUM='b1bfedcd5b289ff22aee87c9d600f515767ebf45f77168cb6d64f231f518a82e'
OPENSSL_PACKAGE_NAME='openssl-3.6.1.tar.gz'
OPENSSL_PACKAGE_EXTRACTED_DIR='openssl-3.6.1'

CURL_PACKAGE_URL='https://curl.se/download/curl-8.18.0.tar.gz'
CURL_PACKAGE_SHA256SUM='e9274a5f8ab5271c0e0e6762d2fce194d5f98acc568e4ce816845b2dcc0cf88f'
CURL_PACKAGE_NAME='curl-8.18.0.tar.gz'
CURL_PACKAGE_EXTRACTED_DIR='curl-8.18.0'

WGET_PACKAGE_URL='https://ftpmirror.gnu.org/wget/wget2-2.2.1.tar.gz'
WGET_PACKAGE_SHA256SUM='d7544b13e37f18e601244fce5f5f40688ac1d6ab9541e0fbb01a32ee1fb447b4'
WGET_PACKAGE_NAME='wget2-2.2.1.tar.gz'
WGET_PACKAGE_EXTRACTED_DIR='wget2-2.2.1'

BZIP2_PACKAGE_URL='https://sourceware.org/pub/bzip2/bzip2-1.0.8.tar.gz'
BZIP2_PACKAGE_SHA256SUM='ab5a03176ee106d3f0fa90e381da478ddae405918153cca248e682cd0c4a2269'
BZIP2_PACKAGE_NAME='bzip2-1.0.8.tar.gz'
BZIP2_PACKAGE_EXTRACTED_DIR='bzip2-1.0.8'

XZ_PACKAGE_URL='https://github.com/tukaani-project/xz/releases/download/v5.8.2/xz-5.8.2.tar.gz'
XZ_PACKAGE_SHA256SUM='ce09c50a5962786b83e5da389c90dd2c15ecd0980a258dd01f70f9e7ce58a8f1'
XZ_PACKAGE_NAME='xz-5.8.2.tar.gz'
XZ_PACKAGE_EXTRACTED_DIR='xz-5.8.2'

SQLITE_PACKAGE_URL='https://sqlite.org/2026/sqlite-autoconf-3510200.tar.gz'
SQLITE_PACKAGE_SHA256SUM='fbd89f866b1403bb66a143065440089dd76100f2238314d92274a082d4f2b7bb'
SQLITE_PACKAGE_NAME='sqlite-autoconf-3510200.tar.gz'
SQLITE_PACKAGE_EXTRACTED_DIR='sqlite-autoconf-3510200'

PYTHON_PACKAGE_URL='https://github.com/python/cpython/archive/refs/tags/v3.14.2.tar.gz'
PYTHON_PACKAGE_SHA256SUM='452d758a660bf1faa31b0b5e39999721b6034421b1cb0a3a26223a344c4fa949'
PYTHON_PACKAGE_NAME='cpython-3.14.2.tar.gz'
PYTHON_PACKAGE_EXTRACTED_DIR='cpython-3.14.2'

EXPAT_PACKAGE_URL='https://github.com/libexpat/libexpat/releases/download/R_2_7_4/expat-2.7.4.tar.gz'
EXPRT_PACKAGE_SHA256SUM='461ecc8aa98ab1a68c2db788175665d1a4db640dc05bf0e289b6ea17122144ec'
EXPAT_PACKAGE_NAME='expat-2.7.4.tar.gz'
EXPAT_PACKAGE_EXTRACTED_DIR='expat-2.7.4'

GETTEXT_PACKAGE_URL='https://ftpmirror.gnu.org/gettext/gettext-1.0.tar.xz'
GETTEXT_PACKAGE_SHA256SUM='71132a3fb71e68245b8f2ac4e9e97137d3e5c02f415636eb508ae607bc01add7'
GETTEXT_PACKAGE_NAME='gettext-1.0.tar.xz'
GETTEXT_PACKAGE_EXTRACTED_DIR='gettext-1.0'

GIT_PACKAGE_URL='https://github.com/git/git/archive/refs/tags/v2.53.0.tar.gz'
GIT_PACKAGE_SHA256SUM='0492bcd8a9fc99bedca75dbec7c8c15b24dd1501c82d4518294ee0850f91f219'
GIT_PACKAGE_NAME='git-2.53.0.tar.gz'
GIT_PACKAGE_EXTRACTED_DIR='git-2.53.0'

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

GDB_PACKAGE_URL='https://ftpmirror.gnu.org/gdb/gdb-17.1.tar.gz'
GDB_PACKAGE_SHA256SUM='2b93c4c9726a4b8cfe771036e155377405dfa41c483d90945481319c5663c120'
GDB_PACKAGE_NAME='gdb-17.1.tar.gz'
GDB_PACKAGE_EXTRACTED_DIR='gdb-17.1'

NEOVIM_PACKAGE_URL="https://github.com/neovim/neovim/releases/download/v0.11.6/nvim-linux-${ARCH/aarch64/arm64}.tar.gz"
if [[ "${ARCH}" == 'x86_64' ]]; then
	NEOVIM_PACKAGE_SHA256SUM='2fc90b962327f73a78afbfb8203fd19db8db9cdf4ee5e2bef84704339add89cc'
else
	NEOVIM_PACKAGE_SHA256SUM='8ddc0c101846145e830b17bbca50782ca9307eee4fab539d9e2ddaf8793c06f1'
fi
NEOVIM_PACKAGE_NAME="nvim-linux-${ARCH/aarch64/arm64}.tar.gz"

ZSTD_PACKAGE_URL='https://github.com/facebook/zstd/releases/download/v1.5.7/zstd-1.5.7.tar.gz'
ZSTD_PACKAGE_SHA256SUM='eb33e51f49a15e023950cd7825ca74a4a2b43db8354825ac24fc1b7ee09e6fa3'
ZSTD_PACKAGE_NAME='zstd-1.5.7.tar.gz'
ZSTD_PACKAGE_EXTRACTED_DIR='zstd-1.5.7'

CMAKE_PACKAGE_URL="https://github.com/Kitware/CMake/releases/download/v4.2.3/cmake-4.2.3-linux-${ARCH}.tar.gz"
if [[ "${ARCH}" == 'x86_64' ]]; then
	CMAKE_PACKAGE_SHA256SUM='5bb505d5e0cca0480a330f7f27ccf52c2b8b5214c5bba97df08899f5ef650c23'
elif [[ "${ARCH}" == 'aarch64' ]]; then
	CMAKE_PACKAGE_SHA256SUM='e529c75f18f27ba27c52b329efe7b1f98dc32ccc0c6d193c7ab343f888962672'
fi
CMAKE_PACKAGE_NAME="cmake-4.2.3-linux-${ARCH}.tar.gz"

XXHASH_PACKAGE_URL='https://github.com/Cyan4973/xxHash/archive/refs/tags/v0.8.3.tar.gz'
XXHASH_PACKAGE_SHA256SUM='aae608dfe8213dfd05d909a57718ef82f30722c392344583d3f39050c7f29a80'
XXHASH_PACKAGE_NAME='xxHash-0.8.3.tar.gz'
XXHASH_PACKAGE_EXTRACTED_DIR='xxHash-0.8.3'

CCACHE_PACKAGE_URL='https://github.com/ccache/ccache/releases/download/v4.12.2/ccache-4.12.2.tar.gz'
CCACHE_PACKAGE_SHA256SUM='2a087efb66b62d4c66d4eb276748bbfa797ff3bde20adf44c53e5a8b9f3679af'
CCACHE_PACKAGE_NAME='ccache-4.12.2.tar.gz'
CCACHE_PACKAGE_EXTRACTED_DIR='ccache-4.12.2'

LIBXML2_PACKAGE_URL='https://github.com/GNOME/libxml2/archive/refs/tags/v2.15.1.tar.gz'
LIBXML2_PACKAGE_SHA256SUM='23b1ebd74cc562cd592cd2618c2bd88dc06fa0dfdbcd56e03cb26d6ff6b7e373'
LIBXML2_PACKAGE_NAME='libxml2-2.15.1.tar.gz'
LIBXML2_PACKAGE_EXTRACTED_DIR='libxml2-2.15.1'

SWIG_PACKAGE_URL='https://downloads.sourceforge.net/project/swig/swig/swig-4.4.1/swig-4.4.1.tar.gz'
SWIG_PACKAGE_SHA256SUM='40162a706c56f7592d08fd52ef5511cb7ac191f3593cf07306a0a554c6281fcf'
SWIG_PACKAGE_NAME='swig-4.4.1.tar.gz'
SWIG_PACKAGE_EXTRACTED_DIR='swig-4.4.1'

LIBEDIT_PACKAGE_URL='https://www.thrysoee.dk/editline/libedit-20250104-3.1.tar.gz'
LIBEDIT_PACKAGE_SHA256SUM='23792701694550a53720630cd1cd6167101b5773adddcb4104f7345b73a568ac'
LIBEDIT_PACKAGE_NAME='libedit-20250104-3.1.tar.gz'
LIBEDIT_PACKAGE_EXTRACTED_DIR='libedit-20250104-3.1'

LLVM_PACKAGE_URL='https://github.com/llvm/llvm-project/releases/download/llvmorg-21.1.8/llvm-project-21.1.8.src.tar.xz'
LLVM_PACKAGE_SHA256SUM='4633a23617fa31a3ea51242586ea7fb1da7140e426bd62fc164261fe036aa142'
LLVM_PACKAGE_NAME='llvm-project-21.1.8.src.tar.xz'
LLVM_PACKAGE_EXTRACTED_DIR='llvm-project-21.1.8.src'

ZSH_PACKAGE_URL='https://downloads.sourceforge.net/project/zsh/zsh/5.9/zsh-5.9.tar.xz'
ZSH_PACKAGE_SHA256SUM='9b8d1ecedd5b5e81fbf1918e876752a7dd948e05c1a0dba10ab863842d45acd5'
ZSH_PACKAGE_NAME='zsh-5.9.tar.xz'
ZSH_PACKAGE_EXTRACTED_DIR='zsh-5.9'
