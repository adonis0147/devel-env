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

LIBFFI_PACKAGE_URL='https://github.com/libffi/libffi/releases/download/v3.4.6/libffi-3.4.6.tar.gz'
LIBFFI_PACKAGE_SHA256SUM='b0dea9df23c863a7a50e825440f3ebffabd65df1497108e5d437747843895a4e'
LIBFFI_PACKAGE_NAME='libffi-3.4.6.tar.gz'
LIBFFI_PACKAGE_EXTRACTED_DIR='libffi-3.4.6'

ZLIB_PACKAGE_URL='https://github.com/madler/zlib/releases/download/v1.3.1/zlib-1.3.1.tar.gz'
ZLIB_PACKAGE_SHA256SUM='9a93b2b7dfdac77ceba5a558a580e74667dd6fede4585b91eefb60f03b72df23'
ZLIB_PACKAGE_NAME='zlib-1.3.1.tar.gz'
ZLIB_PACKAGE_EXTRACTED_DIR='zlib-1.3.1'

BERKELEY_DB_PACKAGE_URL='https://download.oracle.com/berkeley-db/db-18.1.40.tar.gz'
BERKELEY_DB_PACKAGE_SHA256SUM='0cecb2ef0c67b166de93732769abdeba0555086d51de1090df325e18ee8da9c8'
BERKELEY_DB_PACKAGE_NAME='db-18.1.40.tar.gz'
BERKELEY_DB_PACKAGE_EXTRACTED_DIR='db-18.1.40'

PERL_PACKAGE_URL='https://www.cpan.org/src/5.0/perl-5.38.2.tar.gz'
PERL_PACKAGE_SHA256SUM='a0a31534451eb7b83c7d6594a497543a54d488bc90ca00f5e34762577f40655e'
PERL_PACKAGE_NAME='perl-5.38.2.tar.gz'
PERL_PACKAGE_EXTRACTED_DIR='perl-5.38.2'

OPENSSL_PACKAGE_URL='https://www.openssl.org/source/openssl-3.0.13.tar.gz'
OPENSSL_PACKAGE_SHA256SUM='88525753f79d3bec27d2fa7c66aa0b92b3aa9498dafd93d7cfa4b3780cdae313'
OPENSSL_PACKAGE_NAME='openssl-3.0.13.tar.gz'
OPENSSL_PACKAGE_EXTRACTED_DIR='openssl-3.0.13'

CURL_PACKAGE_URL='https://curl.se/download/curl-8.6.0.tar.gz'
CURL_PACKAGE_SHA256SUM='9c6db808160015f30f3c656c0dec125feb9dc00753596bf858a272b5dd8dc398'
CURL_PACKAGE_NAME='curl-8.6.0.tar.gz'
CURL_PACKAGE_EXTRACTED_DIR='curl-8.6.0'

WGET_PACKAGE_URL='https://ftpmirror.gnu.org/wget/wget2-2.1.0.tar.gz'
WGET_PACKAGE_SHA256SUM='a05dc5191c6bad9313fd6db2777a78f5527ba4774f665d5d69f5a7461b49e2e7'
WGET_PACKAGE_NAME='wget2-2.1.0.tar.gz'
WGET_PACKAGE_EXTRACTED_DIR='wget2-2.1.0'

BZIP2_PACKAGE_URL='https://sourceware.org/pub/bzip2/bzip2-1.0.8.tar.gz'
BZIP2_PACKAGE_SHA256SUM='ab5a03176ee106d3f0fa90e381da478ddae405918153cca248e682cd0c4a2269'
BZIP2_PACKAGE_NAME='bzip2-1.0.8.tar.gz'
BZIP2_PACKAGE_EXTRACTED_DIR='bzip2-1.0.8'

XZ_PACKAGE_URL='https://github.com/tukaani-project/xz/releases/download/v5.6.0/xz-5.6.0.tar.gz'
XZ_PACKAGE_SHA256SUM='0f5c81f14171b74fcc9777d302304d964e63ffc2d7b634ef023a7249d9b5d875'
XZ_PACKAGE_NAME='xz-5.6.0.tar.gz'
XZ_PACKAGE_EXTRACTED_DIR='xz-5.6.0'

SQLITE_PACKAGE_URL='https://sqlite.org/2024/sqlite-autoconf-3450100.tar.gz'
SQLITE_PACKAGE_SHA256SUM='cd9c27841b7a5932c9897651e20b86c701dd740556989b01ca596fcfa3d49a0a'
SQLITE_PACKAGE_NAME='sqlite-autoconf-3450100.tar.gz'
SQLITE_PACKAGE_EXTRACTED_DIR='sqlite-autoconf-3450100'

PYTHON_PACKAGE_URL='https://www.python.org/ftp/python/3.12.2/Python-3.12.2.tgz'
PYTHON_PACKAGE_SHA256SUM='a7c4f6a9dc423d8c328003254ab0c9338b83037bd787d680826a5bf84308116e'
PYTHON_PACKAGE_NAME='Python-3.12.2.tgz'
PYTHON_PACKAGE_EXTRACTED_DIR='Python-3.12.2'

EXPAT_PACKAGE_URL='https://github.com/libexpat/libexpat/releases/download/R_2_6_1/expat-2.6.1.tar.gz'
EXPRT_PACKAGE_SHA256SUM='86943cd33f952077f4a50aaa540333d61c49d980c435f551c63640833e2229d1'
EXPAT_PACKAGE_NAME='expat-2.6.1.tar.gz'
EXPAT_PACKAGE_EXTRACTED_DIR='expat-2.6.1'

GIT_PACKAGE_URL='https://mirrors.edge.kernel.org/pub/software/scm/git/git-2.44.0.tar.gz'
GIT_PACKAGE_SHA256SUM='f9e36f085458fe9688fbbe7846b8c4770b13d161fcd8953655f36b2b85f06b76'
GIT_PACKAGE_NAME='git-2.44.0.tar.gz'
GIT_PACKAGE_EXTRACTED_DIR='git-2.44.0'

GMP_PACKAGE_URL='https://ftpmirror.gnu.org/gmp/gmp-6.3.0.tar.xz'
GMP_PACKAGE_SHA256SUM='a3c2b80201b89e68616f4ad30bc66aee4927c3ce50e33929ca819d5c43538898'
GMP_PACKAGE_NAME='gmp-6.3.0.tar.xz'
GMP_PACKAGE_EXTRACTED_DIR='gmp-6.3.0'

MPFR_PACKAGE_URL='https://ftpmirror.gnu.org/mpfr/mpfr-4.2.1.tar.xz'
MPFR_PACKAGE_SHA256SUM='277807353a6726978996945af13e52829e3abd7a9a5b7fb2793894e18f1fcbb2'
MPFR_PACKAGE_NAME='mpfr-4.2.1.tar.xz'
MPFR_PACKAGE_EXTRACTED_DIR='mpfr-4.2.1'

GDB_PACKAGE_URL='https://ftpmirror.gnu.org/gdb/gdb-14.2.tar.gz'
GDB_PACKAGE_SHA256SUM='2de5174762e959a5e529e20c20d88a04735469d8fffd98f61664e70b341dc47c'
GDB_PACKAGE_NAME='gdb-14.2.tar.gz'
GDB_PACKAGE_EXTRACTED_DIR='gdb-14.2'

NEOVIM_PACKAGE_URL='https://github.com/neovim/neovim/releases/download/v0.9.5/nvim.appimage'
NEOVIM_PACKAGE_SHA256SUM='0c82e5702af7a11fbb916a11b4a82e98928abf8266c74b2030ea740340437bf9'
NEOVIM_PACKAGE_NAME='nvim.appimage'

ZSTD_PACKAGE_URL='https://github.com/facebook/zstd/releases/download/v1.5.5/zstd-1.5.5.tar.gz'
ZSTD_PACKAGE_SHA256SUM='9c4396cc829cfae319a6e2615202e82aad41372073482fce286fac78646d3ee4'
ZSTD_PACKAGE_NAME='zstd-1.5.5.tar.gz'
ZSTD_PACKAGE_EXTRACTED_DIR='zstd-1.5.5'

CMAKE_PACKAGE_URL="https://github.com/Kitware/CMake/releases/download/v3.28.3/cmake-3.28.3-linux-${ARCH}.tar.gz"
if [[ "${ARCH}" == 'x86_64' ]]; then
	CMAKE_PACKAGE_SHA256SUM='804d231460ab3c8b556a42d2660af4ac7a0e21c98a7f8ee3318a74b4a9a187a6'
elif [[ "${ARCH}" == 'aarch64' ]]; then
	CMAKE_PACKAGE_SHA256SUM='bbf023139f944cefe731d944f2864d8ea3ea0c4f9310b46ac72b3cb4e314b023'
fi
CMAKE_PACKAGE_NAME="cmake-3.28.3-linux-${ARCH}.tar.gz"

CCACHE_PACKAGE_URL='https://github.com/ccache/ccache/releases/download/v4.9.1/ccache-4.9.1.tar.gz'
CCACHE_PACKAGE_SHA256SUM='12834ecaaaf2db069dda1d1d991f91c19e3274cc04a471af5b64195def17e90f'
CCACHE_PACKAGE_NAME='ccache-4.9.1.tar.gz'
CCACHE_PACKAGE_EXTRACTED_DIR='ccache-4.9.1'

LIBXML2_PACKAGE_URL='https://github.com/GNOME/libxml2/archive/refs/tags/v2.12.5.tar.gz'
LIBXML2_PACKAGE_SHA256SUM='042c7b161e58ca59d816eee69fc36774dcc8ab7b88a2b9a6e3d4f5e454a9474a'
LIBXML2_PACKAGE_NAME='libxml2-2.12.5.tar.gz'
LIBXML2_PACKAGE_EXTRACTED_DIR='libxml2-2.12.5'

SWIG_PACKAGE_URL='https://downloads.sourceforge.net/project/swig/swig/swig-4.2.1/swig-4.2.1.tar.gz'
SWIG_PACKAGE_SHA256SUM='fa045354e2d048b2cddc69579e4256245d4676894858fcf0bab2290ecf59b7d8'
SWIG_PACKAGE_NAME='swig-4.2.1.tar.gz'
SWIG_PACKAGE_EXTRACTED_DIR='swig-4.2.1'

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
