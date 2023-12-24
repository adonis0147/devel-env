#!/bin/bash
# shellcheck disable=2034

ARCH="$(uname -m)"
if [[ "${ARCH}" == 'arm64' ]]; then
	ARCH='aarch64'
fi

M4_PACKAGE_URL='https://ftpmirror.gnu.org/m4/m4-1.4.19.tar.xz'
M4_PACKAGE_SHA256SUM='63aede5c6d33b6d9b13511cd0be2cac046f2e70fd0a07aa9573a04a82783af96'
M4_PACKAGE_NAME='m4-1.4.19.tar.xz'
M4_PACKAGE_EXTRACTED_DIR='m4-1.4.19'

AUTOCONF_PACKAGE_URL='https://ftpmirror.gnu.org/autoconf/autoconf-2.72.tar.gz'
AUTOCONF_PACKAGE_SHA256SUM='afb181a76e1ee72832f6581c0eddf8df032b83e2e0239ef79ebedc4467d92d6e'
AUTOCONF_PACKAGE_NAME='autoconf-2.72.tar.gz'
AUTOCONF_PACKAGE_EXTRACTED_DIR='autoconf-2.72'

AUTOMAKE_PACKAGE_URL='https://ftpmirror.gnu.org/automake/automake-1.16.5.tar.gz'
AUTOMAKE_PACKAGE_SHA256SUM='07bd24ad08a64bc17250ce09ec56e921d6343903943e99ccf63bbf0705e34605'
AUTOMAKE_PACKAGE_NAME='automake-1.16.5.tar.gz'
AUTOMAKE_PACKAGE_EXTRACTED_DIR='automake-1.16.5'

LIBTOOL_PACKAGE_URL='https://ftpmirror.gnu.org/libtool/libtool-2.4.7.tar.gz'
LIBTOOL_PACKAGE_SHA256SUM='04e96c2404ea70c590c546eba4202a4e12722c640016c12b9b2f1ce3d481e9a8'
LIBTOOL_PACKAGE_NAME='libtool-2.4.7.tar.gz'
LIBTOOL_PACKAGE_EXTRACTED_DIR='libtool-2.4.7'

MAKE_PACKAGE_URL='https://ftpmirror.gnu.org/make/make-4.4.1.tar.gz'
MAKE_PACKAGE_SHA256SUM='dd16fb1d67bfab79a72f5e8390735c49e3e8e70b4945a15ab1f81ddb78658fb3'
MAKE_PACKAGE_NAME='make-4.4.1.tar.gz'
MAKE_PACKAGE_EXTRACTED_DIR='make-4.4.1'

PKG_CONFIG_PACKAGE_URL='https://pkgconfig.freedesktop.org/releases/pkg-config-0.29.2.tar.gz'
PKG_CONFIG_PACKAGE_SHA256SUM='6fc69c01688c9458a57eb9a1664c9aba372ccda420a02bf4429fe610e7e7d591'
PKG_CONFIG_PACKAGE_NAME='pkg-config-0.29.2.tar.gz'
PKG_CONFIG_PACKAGE_EXTRACTED_DIR='pkg-config-0.29.2'

NINJA_PACKAGE_URL='https://github.com/ninja-build/ninja/archive/refs/tags/v1.11.1.tar.gz'
NINJA_PACKAGE_SHA256SUM='31747ae633213f1eda3842686f83c2aa1412e0f5691d1c14dbbcc67fe7400cea'
NINJA_PACKAGE_NAME='ninja-1.11.1.tar.gz'
NINJA_PACKAGE_EXTRACTED_DIR='ninja-1.11.1'

PATCHELF_PACKAGE_URL="https://github.com/NixOS/patchelf/releases/download/0.16.1/patchelf-0.16.1-${ARCH}.tar.gz"
if [[ "${ARCH}" == 'x86_64' ]]; then
	PATCHELF_PACKAGE_SHA256SUM='4dc40fdd3b6bc108b7b9b9641e54cc3782bdea4199a7c79d9106fd6192a3e926'
elif [[ "${ARCH}" == 'aarch64' ]]; then
	PATCHELF_PACKAGE_SHA256SUM='743aa832459e5c95734106950c4826e7c637ecf24e9e426444d9ceeacf76f96b'
fi
PATCHELF_PACKAGE_NAME="patchelf-0.16.1-${ARCH}.tar.gz"

NCURSES_PACKAGE_URL='https://ftpmirror.gnu.org/ncurses/ncurses-6.4.tar.gz'
NCURSES_PACKAGE_SHA256SUM='6931283d9ac87c5073f30b6290c4c75f21632bb4fc3603ac8100812bed248159'
NCURSES_PACKAGE_NAME='ncurses-6.4.tar.gz'
NCURSES_PACKAGE_EXTRACTED_DIR='ncurses-6.4'

READLINE_PACKAGE_URL='https://ftpmirror.gnu.org/readline/readline-8.2.tar.gz'
READLINE_PACKAGE_SHA256SUM='3feb7171f16a84ee82ca18a36d7b9be109a52c04f492a053331d7d1095007c35'
READLINE_PACKAGE_NAME='readline-8.2.tar.gz'
READLINE_PACKAGE_EXTRACTED_DIR='readline-8.2'

LIBFFI_PACKAGE_URL='https://github.com/libffi/libffi/releases/download/v3.4.4/libffi-3.4.4.tar.gz'
LIBFFI_PACKAGE_SHA256SUM='d66c56ad259a82cf2a9dfc408b32bf5da52371500b84745f7fb8b645712df676'
LIBFFI_PACKAGE_NAME='libffi-3.4.4.tar.gz'
LIBFFI_PACKAGE_EXTRACTED_DIR='libffi-3.4.4'

ZLIB_PACKAGE_URL='https://github.com/madler/zlib/releases/download/v1.3/zlib-1.3.tar.gz'
ZLIB_PACKAGE_SHA256SUM='ff0ba4c292013dbc27530b3a81e1f9a813cd39de01ca5e0f8bf355702efa593e'
ZLIB_PACKAGE_NAME='zlib-1.3.tar.gz'
ZLIB_PACKAGE_EXTRACTED_DIR='zlib-1.3'

BERKELEY_DB_PACKAGE_URL='https://download.oracle.com/berkeley-db/db-18.1.40.tar.gz'
BERKELEY_DB_PACKAGE_SHA256SUM='0cecb2ef0c67b166de93732769abdeba0555086d51de1090df325e18ee8da9c8'
BERKELEY_DB_PACKAGE_NAME='db-18.1.40.tar.gz'
BERKELEY_DB_PACKAGE_EXTRACTED_DIR='db-18.1.40'

PERL_PACKAGE_URL='https://www.cpan.org/src/5.0/perl-5.38.0.tar.gz'
PERL_PACKAGE_SHA256SUM='213ef58089d2f2c972ea353517dc60ec3656f050dcc027666e118b508423e517'
PERL_PACKAGE_NAME='perl-5.38.0.tar.gz'
PERL_PACKAGE_EXTRACTED_DIR='perl-5.38.0'

OPENSSL_PACKAGE_URL='https://www.openssl.org/source/openssl-3.0.12.tar.gz'
OPENSSL_PACKAGE_SHA256SUM='f93c9e8edde5e9166119de31755fc87b4aa34863662f67ddfcba14d0b6b69b61'
OPENSSL_PACKAGE_NAME='openssl-3.0.12.tar.gz'
OPENSSL_PACKAGE_EXTRACTED_DIR='openssl-3.0.12'

CURL_PACKAGE_URL='https://curl.se/download/curl-8.5.0.tar.gz'
CURL_PACKAGE_SHA256SUM='05fc17ff25b793a437a0906e0484b82172a9f4de02be5ed447e0cab8c3475add'
CURL_PACKAGE_NAME='curl-8.5.0.tar.gz'
CURL_PACKAGE_EXTRACTED_DIR='curl-8.5.0'

WGET_PACKAGE_URL='https://ftpmirror.gnu.org/wget/wget2-2.1.0.tar.gz'
WGET_PACKAGE_SHA256SUM='a05dc5191c6bad9313fd6db2777a78f5527ba4774f665d5d69f5a7461b49e2e7'
WGET_PACKAGE_NAME='wget2-2.1.0.tar.gz'
WGET_PACKAGE_EXTRACTED_DIR='wget2-2.1.0'

BZIP2_PACKAGE_URL='https://sourceware.org/pub/bzip2/bzip2-1.0.8.tar.gz'
BZIP2_PACKAGE_SHA256SUM='ab5a03176ee106d3f0fa90e381da478ddae405918153cca248e682cd0c4a2269'
BZIP2_PACKAGE_NAME='bzip2-1.0.8.tar.gz'
BZIP2_PACKAGE_EXTRACTED_DIR='bzip2-1.0.8'

XZ_PACKAGE_URL='https://tukaani.org/xz/xz-5.4.5.tar.gz'
XZ_PACKAGE_SHA256SUM='135c90b934aee8fbc0d467de87a05cb70d627da36abe518c357a873709e5b7d6'
XZ_PACKAGE_NAME='xz-5.4.5.tar.gz'
XZ_PACKAGE_EXTRACTED_DIR='xz-5.4.5'

SQLITE_PACKAGE_URL='https://sqlite.org/2023/sqlite-autoconf-3440200.tar.gz'
SQLITE_PACKAGE_SHA256SUM='1c6719a148bc41cf0f2bbbe3926d7ce3f5ca09d878f1246fcc20767b175bb407'
SQLITE_PACKAGE_NAME='sqlite-autoconf-3440200.tar.gz'
SQLITE_PACKAGE_EXTRACTED_DIR='sqlite-autoconf-3440200'

PYTHON_PACKAGE_URL='https://www.python.org/ftp/python/3.12.1/Python-3.12.1.tgz'
PYTHON_PACKAGE_SHA256SUM='d01ec6a33bc10009b09c17da95cc2759af5a580a7316b3a446eb4190e13f97b2'
PYTHON_PACKAGE_NAME='Python-3.12.1.tgz'
PYTHON_PACKAGE_EXTRACTED_DIR='Python-3.12.1'

EXPAT_PACKAGE_URL='https://github.com/libexpat/libexpat/releases/download/R_2_5_0/expat-2.5.0.tar.gz'
EXPRT_PACKAGE_SHA256SUM='6b902ab103843592be5e99504f846ec109c1abb692e85347587f237a4ffa1033'
EXPAT_PACKAGE_NAME='expat-2.5.0.tar.gz'
EXPAT_PACKAGE_EXTRACTED_DIR='expat-2.5.0'

GIT_PACKAGE_URL='https://mirrors.edge.kernel.org/pub/software/scm/git/git-2.43.0.tar.gz'
GIT_PACKAGE_SHA256SUM='ed238f5c72a014f238cc49fe7df4c6883732a3881111b381c105e2c5be77302f'
GIT_PACKAGE_NAME='git-2.43.0.tar.gz'
GIT_PACKAGE_EXTRACTED_DIR='git-2.43.0'

GMP_PACKAGE_URL='https://ftpmirror.gnu.org/gmp/gmp-6.3.0.tar.xz'
GMP_PACKAGE_SHA256SUM='a3c2b80201b89e68616f4ad30bc66aee4927c3ce50e33929ca819d5c43538898'
GMP_PACKAGE_NAME='gmp-6.3.0.tar.xz'
GMP_PACKAGE_EXTRACTED_DIR='gmp-6.3.0'

MPFR_PACKAGE_URL='https://ftpmirror.gnu.org/mpfr/mpfr-4.2.1.tar.xz'
MPFR_PACKAGE_SHA256SUM='277807353a6726978996945af13e52829e3abd7a9a5b7fb2793894e18f1fcbb2'
MPFR_PACKAGE_NAME='mpfr-4.2.1.tar.xz'
MPFR_PACKAGE_EXTRACTED_DIR='mpfr-4.2.1'

GDB_PACKAGE_URL='https://ftpmirror.gnu.org/gdb/gdb-14.1.tar.gz'
GDB_PACKAGE_SHA256SUM='683e63182fb72bd5d8db32ab388143796370a8e3e71c26bc264effb487db7927'
GDB_PACKAGE_NAME='gdb-14.1.tar.gz'
GDB_PACKAGE_EXTRACTED_DIR='gdb-14.1'

NEOVIM_PACKAGE_URL='https://github.com/neovim/neovim/releases/download/v0.9.4/nvim.appimage'
NEOVIM_PACKAGE_SHA256SUM='028cfaaf551d64cbb2f39d15363ed78edb01e2673579b48cb694e3604207d656'
NEOVIM_PACKAGE_NAME='nvim.appimage'

ZSTD_PACKAGE_URL='https://github.com/facebook/zstd/releases/download/v1.5.5/zstd-1.5.5.tar.gz'
ZSTD_PACKAGE_SHA256SUM='9c4396cc829cfae319a6e2615202e82aad41372073482fce286fac78646d3ee4'
ZSTD_PACKAGE_NAME='zstd-1.5.5.tar.gz'
ZSTD_PACKAGE_EXTRACTED_DIR='zstd-1.5.5'

CMAKE_PACKAGE_URL="https://github.com/Kitware/CMake/releases/download/v3.28.1/cmake-3.28.1-linux-${ARCH}.tar.gz"
if [[ "${ARCH}" == 'x86_64' ]]; then
	CMAKE_PACKAGE_SHA256SUM='f76398c24362ad87bad1a3d6f1e8f4377632b5b1c360c4ba1fd7cd205fd9d8d4'
elif [[ "${ARCH}" == 'aarch64' ]]; then
	CMAKE_PACKAGE_SHA256SUM='e84d88e46ed8c85fbe259bcd4ca07df7a928df87e84013e0da34d91b01a25d71'
fi
CMAKE_PACKAGE_NAME="cmake-3.28.1-linux-${ARCH}.tar.gz"

CCACHE_PACKAGE_URL='https://github.com/ccache/ccache/releases/download/v4.8.3/ccache-4.8.3.tar.gz'
CCACHE_PACKAGE_SHA256SUM='d59dd569ad2bbc826c0bc335c8ebd73e78ed0f2f40ba6b30069347e63585d9ef'
CCACHE_PACKAGE_NAME='ccache-4.8.3.tar.gz'
CCACHE_PACKAGE_EXTRACTED_DIR='ccache-4.8.3'

LIBXML2_PACKAGE_URL='https://github.com/GNOME/libxml2/archive/refs/tags/v2.12.3.tar.gz'
LIBXML2_PACKAGE_SHA256SUM='ffad925bc27ca1266db8daa16b833f0afa6745df3cfcc0b8bbbc08bf52265676'
LIBXML2_PACKAGE_NAME='libxml2-2.12.3.tar.gz'
LIBXML2_PACKAGE_EXTRACTED_DIR='libxml2-2.12.3'

SWIG_PACKAGE_URL='https://downloads.sourceforge.net/project/swig/swig/swig-4.1.1/swig-4.1.1.tar.gz'
SWIG_PACKAGE_SHA256SUM='2af08aced8fcd65cdb5cc62426768914bedc735b1c250325203716f78e39ac9b'
SWIG_PACKAGE_NAME='swig-4.1.1.tar.gz'
SWIG_PACKAGE_EXTRACTED_DIR='swig-4.1.1'

LIBEDIT_PACKAGE_URL='https://www.thrysoee.dk/editline/libedit-20230828-3.1.tar.gz'
LIBEDIT_PACKAGE_SHA256SUM='4ee8182b6e569290e7d1f44f0f78dac8716b35f656b76528f699c69c98814dad'
LIBEDIT_PACKAGE_NAME='libedit-20230828-3.1.tar.gz'
LIBEDIT_PACKAGE_EXTRACTED_DIR='libedit-20230828-3.1'

LLVM_PACKAGE_URL='https://github.com/llvm/llvm-project/releases/download/llvmorg-17.0.6/llvm-project-17.0.6.src.tar.xz'
LLVM_PACKAGE_SHA256SUM='58a8818c60e6627064f312dbf46c02d9949956558340938b71cf731ad8bc0813'
LLVM_PACKAGE_NAME='llvm-project-17.0.6.src.tar.xz'
LLVM_PACKAGE_EXTRACTED_DIR='llvm-project-17.0.6.src'

ZSH_PACKAGE_URL='https://downloads.sourceforge.net/project/zsh/zsh/5.9/zsh-5.9.tar.xz'
ZSH_PACKAGE_SHA256SUM='9b8d1ecedd5b5e81fbf1918e876752a7dd948e05c1a0dba10ab863842d45acd5'
ZSH_PACKAGE_NAME='zsh-5.9.tar.xz'
ZSH_PACKAGE_EXTRACTED_DIR='zsh-5.9'
