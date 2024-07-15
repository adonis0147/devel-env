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

AUTOMAKE_PACKAGE_URL='https://ftpmirror.gnu.org/automake/automake-1.17.tar.gz'
AUTOMAKE_PACKAGE_SHA256SUM='397767d4db3018dd4440825b60c64258b636eaf6bf99ac8b0897f06c89310acd'
AUTOMAKE_PACKAGE_NAME='automake-1.17.tar.gz'
AUTOMAKE_PACKAGE_EXTRACTED_DIR='automake-1.17'

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

PERL_PACKAGE_URL='https://www.cpan.org/src/5.0/perl-5.40.0.tar.gz'
PERL_PACKAGE_SHA256SUM='c740348f357396327a9795d3e8323bafd0fe8a5c7835fc1cbaba0cc8dfe7161f'
PERL_PACKAGE_NAME='perl-5.40.0.tar.gz'
PERL_PACKAGE_EXTRACTED_DIR='perl-5.40.0'

OPENSSL_PACKAGE_URL='https://www.openssl.org/source/openssl-3.0.14.tar.gz'
OPENSSL_PACKAGE_SHA256SUM='eeca035d4dd4e84fc25846d952da6297484afa0650a6f84c682e39df3a4123ca'
OPENSSL_PACKAGE_NAME='openssl-3.0.14.tar.gz'
OPENSSL_PACKAGE_EXTRACTED_DIR='openssl-3.0.14'

CURL_PACKAGE_URL='https://curl.se/download/curl-8.8.0.tar.gz'
CURL_PACKAGE_SHA256SUM='77c0e1cd35ab5b45b659645a93b46d660224d0024f1185e8a95cdb27ae3d787d'
CURL_PACKAGE_NAME='curl-8.8.0.tar.gz'
CURL_PACKAGE_EXTRACTED_DIR='curl-8.8.0'

WGET_PACKAGE_URL='https://ftpmirror.gnu.org/wget/wget2-2.1.0.tar.gz'
WGET_PACKAGE_SHA256SUM='a05dc5191c6bad9313fd6db2777a78f5527ba4774f665d5d69f5a7461b49e2e7'
WGET_PACKAGE_NAME='wget2-2.1.0.tar.gz'
WGET_PACKAGE_EXTRACTED_DIR='wget2-2.1.0'

BZIP2_PACKAGE_URL='https://sourceware.org/pub/bzip2/bzip2-1.0.8.tar.gz'
BZIP2_PACKAGE_SHA256SUM='ab5a03176ee106d3f0fa90e381da478ddae405918153cca248e682cd0c4a2269'
BZIP2_PACKAGE_NAME='bzip2-1.0.8.tar.gz'
BZIP2_PACKAGE_EXTRACTED_DIR='bzip2-1.0.8'

XZ_PACKAGE_URL='https://downloads.sourceforge.net/project/lzmautils/xz-5.4.6.tar.gz'
XZ_PACKAGE_SHA256SUM='aeba3e03bf8140ddedf62a0a367158340520f6b384f75ca6045ccc6c0d43fd5c'
XZ_PACKAGE_NAME='xz-5.4.6.tar.gz'
XZ_PACKAGE_EXTRACTED_DIR='xz-5.4.6'

SQLITE_PACKAGE_URL='https://sqlite.org/2024/sqlite-autoconf-3460000.tar.gz'
SQLITE_PACKAGE_SHA256SUM='6f8e6a7b335273748816f9b3b62bbdc372a889de8782d7f048c653a447417a7d'
SQLITE_PACKAGE_NAME='sqlite-autoconf-3460000.tar.gz'
SQLITE_PACKAGE_EXTRACTED_DIR='sqlite-autoconf-3460000'

PYTHON_PACKAGE_URL='https://www.python.org/ftp/python/3.12.4/Python-3.12.4.tgz'
PYTHON_PACKAGE_SHA256SUM='01b3c1c082196f3b33168d344a9c85fb07bfe0e7ecfe77fee4443420d1ce2ad9'
PYTHON_PACKAGE_NAME='Python-3.12.4.tgz'
PYTHON_PACKAGE_EXTRACTED_DIR='Python-3.12.4'

EXPAT_PACKAGE_URL='https://github.com/libexpat/libexpat/releases/download/R_2_6_2/expat-2.6.2.tar.gz'
EXPRT_PACKAGE_SHA256SUM='d4cf38d26e21a56654ffe4acd9cd5481164619626802328506a2869afab29ab3'
EXPAT_PACKAGE_NAME='expat-2.6.2.tar.gz'
EXPAT_PACKAGE_EXTRACTED_DIR='expat-2.6.2'

GIT_PACKAGE_URL='https://mirrors.edge.kernel.org/pub/software/scm/git/git-2.45.2.tar.gz'
GIT_PACKAGE_SHA256SUM='98b26090ed667099a3691b93698d1e213e1ded73d36a2fde7e9125fce28ba234'
GIT_PACKAGE_NAME='git-2.45.2.tar.gz'
GIT_PACKAGE_EXTRACTED_DIR='git-2.45.2'

GMP_PACKAGE_URL='https://ftpmirror.gnu.org/gmp/gmp-6.3.0.tar.xz'
GMP_PACKAGE_SHA256SUM='a3c2b80201b89e68616f4ad30bc66aee4927c3ce50e33929ca819d5c43538898'
GMP_PACKAGE_NAME='gmp-6.3.0.tar.xz'
GMP_PACKAGE_EXTRACTED_DIR='gmp-6.3.0'

MPFR_PACKAGE_URL='https://ftpmirror.gnu.org/mpfr/mpfr-4.2.1.tar.xz'
MPFR_PACKAGE_SHA256SUM='277807353a6726978996945af13e52829e3abd7a9a5b7fb2793894e18f1fcbb2'
MPFR_PACKAGE_NAME='mpfr-4.2.1.tar.xz'
MPFR_PACKAGE_EXTRACTED_DIR='mpfr-4.2.1'

GDB_PACKAGE_URL='https://ftpmirror.gnu.org/gdb/gdb-15.1.tar.gz'
GDB_PACKAGE_SHA256SUM='8b61b0c2bdd9d9c83b113c9167866bdb474651d291fedcaa5eb7cde49bd47036'
GDB_PACKAGE_NAME='gdb-15.1.tar.gz'
GDB_PACKAGE_EXTRACTED_DIR='gdb-15.1'

NEOVIM_PACKAGE_URL='https://github.com/neovim/neovim/releases/download/v0.10.0/nvim.appimage'
NEOVIM_PACKAGE_SHA256SUM='6a021e9465fe3d3375e28c3e94c1c2c4f7d1a5a67e4a78cf52d18d77b1471390'
NEOVIM_PACKAGE_NAME='nvim.appimage'

ZSTD_PACKAGE_URL='https://github.com/facebook/zstd/releases/download/v1.5.6/zstd-1.5.6.tar.gz'
ZSTD_PACKAGE_SHA256SUM='8c29e06cf42aacc1eafc4077ae2ec6c6fcb96a626157e0593d5e82a34fd403c1'
ZSTD_PACKAGE_NAME='zstd-1.5.6.tar.gz'
ZSTD_PACKAGE_EXTRACTED_DIR='zstd-1.5.6'

CMAKE_PACKAGE_URL="https://github.com/Kitware/CMake/releases/download/v3.30.0/cmake-3.30.0-linux-${ARCH}.tar.gz"
if [[ "${ARCH}" == 'x86_64' ]]; then
	CMAKE_PACKAGE_SHA256SUM='09846a3858583f38189b59177586adf125a08c15f3cddcaf7d7d7081ac86969f'
elif [[ "${ARCH}" == 'aarch64' ]]; then
	CMAKE_PACKAGE_SHA256SUM='3db7f12dadc91be9b30f0e5a71038c51d7f5b7cc03e32625621a052e9996bef0'
fi
CMAKE_PACKAGE_NAME="cmake-3.30.0-linux-${ARCH}.tar.gz"

CCACHE_PACKAGE_URL='https://github.com/ccache/ccache/releases/download/v4.10.1/ccache-4.10.1.tar.gz'
CCACHE_PACKAGE_SHA256SUM='8f8ad60d9363857812aa8af3fa7fb72be5ea5cf193f824d16d237a8a79256be4'
CCACHE_PACKAGE_NAME='ccache-4.10.1.tar.gz'
CCACHE_PACKAGE_EXTRACTED_DIR='ccache-4.10.1'

LIBXML2_PACKAGE_URL='https://github.com/GNOME/libxml2/archive/refs/tags/v2.13.2.tar.gz'
LIBXML2_PACKAGE_SHA256SUM='4a59282c8cf1914857496f959103acbd6b4eccb7131fa8643a4a58eb679d14a1'
LIBXML2_PACKAGE_NAME='libxml2-2.13.2.tar.gz'
LIBXML2_PACKAGE_EXTRACTED_DIR='libxml2-2.13.2'

SWIG_PACKAGE_URL='https://downloads.sourceforge.net/project/swig/swig/swig-4.2.1/swig-4.2.1.tar.gz'
SWIG_PACKAGE_SHA256SUM='fa045354e2d048b2cddc69579e4256245d4676894858fcf0bab2290ecf59b7d8'
SWIG_PACKAGE_NAME='swig-4.2.1.tar.gz'
SWIG_PACKAGE_EXTRACTED_DIR='swig-4.2.1'

LIBEDIT_PACKAGE_URL='https://www.thrysoee.dk/editline/libedit-20240517-3.1.tar.gz'
LIBEDIT_PACKAGE_SHA256SUM='3a489097bb4115495f3bd85ae782852b7097c556d9500088d74b6fa38dbd12ff'
LIBEDIT_PACKAGE_NAME='libedit-20240517-3.1.tar.gz'
LIBEDIT_PACKAGE_EXTRACTED_DIR='libedit-20240517-3.1'

LLVM_PACKAGE_URL='https://github.com/llvm/llvm-project/releases/download/llvmorg-18.1.8/llvm-project-18.1.8.src.tar.xz'
LLVM_PACKAGE_SHA256SUM='0b58557a6d32ceee97c8d533a59b9212d87e0fc4d2833924eb6c611247db2f2a'
LLVM_PACKAGE_NAME='llvm-project-18.1.8.src.tar.xz'
LLVM_PACKAGE_EXTRACTED_DIR='llvm-project-18.1.8.src'

ZSH_PACKAGE_URL='https://downloads.sourceforge.net/project/zsh/zsh/5.9/zsh-5.9.tar.xz'
ZSH_PACKAGE_SHA256SUM='9b8d1ecedd5b5e81fbf1918e876752a7dd948e05c1a0dba10ab863842d45acd5'
ZSH_PACKAGE_NAME='zsh-5.9.tar.xz'
ZSH_PACKAGE_EXTRACTED_DIR='zsh-5.9'
