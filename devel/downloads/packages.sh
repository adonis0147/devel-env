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

AUTOCONF_PACKAGE_URL='https://ftpmirror.gnu.org/autoconf/autoconf-2.71.tar.gz'
AUTOCONF_PACKAGE_SHA256SUM='431075ad0bf529ef13cb41e9042c542381103e80015686222b8a9d4abef42a1c'
AUTOCONF_PACKAGE_NAME='autoconf-2.71.tar.gz'
AUTOCONF_PACKAGE_EXTRACTED_DIR='autoconf-2.71'

AUTOMAKE_PACKAGE_URL='https://ftpmirror.gnu.org/automake/automake-1.16.5.tar.gz'
AUTOMAKE_PACKAGE_SHA256SUM='07bd24ad08a64bc17250ce09ec56e921d6343903943e99ccf63bbf0705e34605'
AUTOMAKE_PACKAGE_NAME='automake-1.16.5.tar.gz'
AUTOMAKE_PACKAGE_EXTRACTED_DIR='automake-1.16.5'

LIBTOOL_PACKAGE_URL='https://ftpmirror.gnu.org/libtool/libtool-2.4.7.tar.gz'
LIBTOOL_PACKAGE_SHA256SUM='04e96c2404ea70c590c546eba4202a4e12722c640016c12b9b2f1ce3d481e9a8'
LIBTOOL_PACKAGE_NAME='libtool-2.4.7.tar.gz'
LIBTOOL_PACKAGE_EXTRACTED_DIR='libtool-2.4.7'

MAKE_PACKAGE_URL='https://ftpmirror.gnu.org/make/make-4.4.tar.gz'
MAKE_PACKAGE_SHA256SUM='581f4d4e872da74b3941c874215898a7d35802f03732bdccee1d4a7979105d18'
MAKE_PACKAGE_NAME='make-4.4.tar.gz'
MAKE_PACKAGE_EXTRACTED_DIR='make-4.4'

PKG_CONFIG_PACKAGE_URL='https://pkgconfig.freedesktop.org/releases/pkg-config-0.29.2.tar.gz'
PKG_CONFIG_PACKAGE_SHA256SUM='6fc69c01688c9458a57eb9a1664c9aba372ccda420a02bf4429fe610e7e7d591'
PKG_CONFIG_PACKAGE_NAME='pkg-config-0.29.2.tar.gz'
PKG_CONFIG_PACKAGE_EXTRACTED_DIR='pkg-config-0.29.2'

PATCHELF_PACKAGE_URL="https://github.com/NixOS/patchelf/releases/download/0.17.0/patchelf-0.17.0-${ARCH}.tar.gz"
if [[ "${ARCH}" == 'x86_64' ]]; then
	PATCHELF_PACKAGE_SHA256SUM='f569b8d5868a5968012d7ff80eb5ca496d6308c481089e6b103855f162080164'
elif [[ "${ARCH}" == 'aarch64' ]]; then
	PATCHELF_PACKAGE_SHA256SUM='78bcba9452d4f9cd8162ea0acdffd67073c3ded331fc8ca81196a88017cfd214'
fi
PATCHELF_PACKAGE_NAME="patchelf-0.17.0-${ARCH}.tar.gz"

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

ZLIB_PACKAGE_URL='https://github.com/madler/zlib/releases/download/v1.2.13/zlib-1.2.13.tar.gz'
ZLIB_PACKAGE_SHA256SUM='b3a24de97a8fdbc835b9833169501030b8977031bcb54b3b3ac13740f846ab30'
ZLIB_PACKAGE_NAME='zlib-1.2.13.tar.gz'
ZLIB_PACKAGE_EXTRACTED_DIR='zlib-1.2.13'

BERKELEY_DB_PACKAGE_URL='https://download.oracle.com/berkeley-db/db-18.1.40.tar.gz'
BERKELEY_DB_PACKAGE_SHA256SUM='0cecb2ef0c67b166de93732769abdeba0555086d51de1090df325e18ee8da9c8'
BERKELEY_DB_PACKAGE_NAME='db-18.1.40.tar.gz'
BERKELEY_DB_PACKAGE_EXTRACTED_DIR='db-18.1.40'

PERL_PACKAGE_URL='https://www.cpan.org/src/5.0/perl-5.36.0.tar.gz'
PERL_PACKAGE_SHA256SUM='e26085af8ac396f62add8a533c3a0ea8c8497d836f0689347ac5abd7b7a4e00a'
PERL_PACKAGE_NAME='perl-5.36.0.tar.gz'
PERL_PACKAGE_EXTRACTED_DIR='perl-5.36.0'

OPENSSL_PACKAGE_URL='https://www.openssl.org/source/openssl-3.0.7.tar.gz'
OPENSSL_PACKAGE_SHA256SUM='83049d042a260e696f62406ac5c08bf706fd84383f945cf21bd61e9ed95c396e'
OPENSSL_PACKAGE_NAME='openssl-3.0.7.tar.gz'
OPENSSL_PACKAGE_EXTRACTED_DIR='openssl-3.0.7'

CURL_PACKAGE_URL='https://curl.se/download/curl-7.87.0.tar.gz'
CURL_PACKAGE_SHA256SUM='8a063d664d1c23d35526b87a2bf15514962ffdd8ef7fd40519191b3c23e39548'
CURL_PACKAGE_NAME='curl-7.87.0.tar.gz'
CURL_PACKAGE_EXTRACTED_DIR='curl-7.87.0'

WGET_PACKAGE_URL='https://ftpmirror.gnu.org/wget/wget2-2.0.1.tar.gz'
WGET_PACKAGE_SHA256SUM='0bb7fa03697bb5b8d05e1b5e15b863440826eb845874c4ffb5e32330f9845db1'
WGET_PACKAGE_NAME='wget2-2.0.1.tar.gz'
WGET_PACKAGE_EXTRACTED_DIR='wget2-2.0.1'

BZIP2_PACKAGE_URL='https://sourceware.org/pub/bzip2/bzip2-1.0.8.tar.gz'
BZIP2_PACKAGE_SHA256SUM='ab5a03176ee106d3f0fa90e381da478ddae405918153cca248e682cd0c4a2269'
BZIP2_PACKAGE_NAME='bzip2-1.0.8.tar.gz'
BZIP2_PACKAGE_EXTRACTED_DIR='bzip2-1.0.8'

SQLITE_PACKAGE_URL='https://sqlite.org/2022/sqlite-autoconf-3400100.tar.gz'
SQLITE_PACKAGE_SHA256SUM='2c5dea207fa508d765af1ef620b637dcb06572afa6f01f0815bd5bbf864b33d9'
SQLITE_PACKAGE_NAME='sqlite-autoconf-3400100.tar.gz'
SQLITE_PACKAGE_EXTRACTED_DIR='sqlite-autoconf-3400100'

PYTHON_PACKAGE_URL='https://www.python.org/ftp/python/3.11.1/Python-3.11.1.tgz'
PYTHON_PACKAGE_SHA256SUM='baed518e26b337d4d8105679caf68c5c32630d702614fc174e98cb95c46bdfa4'
PYTHON_PACKAGE_NAME='Python-3.11.1.tgz'
PYTHON_PACKAGE_EXTRACTED_DIR='Python-3.11.1'

EXPAT_PACKAGE_URL='https://github.com/libexpat/libexpat/releases/download/R_2_5_0/expat-2.5.0.tar.gz'
EXPRT_PACKAGE_SHA256SUM='6b902ab103843592be5e99504f846ec109c1abb692e85347587f237a4ffa1033'
EXPAT_PACKAGE_NAME='expat-2.5.0.tar.gz'
EXPAT_PACKAGE_EXTRACTED_DIR='expat-2.5.0'

GIT_PACKAGE_URL='https://mirrors.edge.kernel.org/pub/software/scm/git/git-2.39.0.tar.gz'
GIT_PACKAGE_SHA256SUM='d929fe67cef7ac3ca709d2b56a9920f17112d5a524bf8112af37ec045a7a5109'
GIT_PACKAGE_NAME='git-2.39.0.tar.gz'
GIT_PACKAGE_EXTRACTED_DIR='git-2.39.0'

GMP_PACKAGE_URL='https://ftpmirror.gnu.org/gmp/gmp-6.2.1.tar.xz'
GMP_PACKAGE_SHA256SUM='fd4829912cddd12f84181c3451cc752be224643e87fac497b69edddadc49b4f2'
GMP_PACKAGE_NAME='gmp-6.2.1.tar.xz'
GMP_PACKAGE_EXTRACTED_DIR='gmp-6.2.1'

GDB_PACKAGE_URL='https://ftpmirror.gnu.org/gdb/gdb-12.1.tar.gz'
GDB_PACKAGE_SHA256SUM='87296a3a9727356b56712c793704082d5df0ff36a34ca9ec9734fc9a8bdfdaab'
GDB_PACKAGE_NAME='gdb-12.1.tar.gz'
GDB_PACKAGE_EXTRACTED_DIR='gdb-12.1'

NEOVIM_PACKAGE_URL='https://github.com/neovim/neovim/releases/download/v0.8.3/nvim-linux64.tar.gz'
NEOVIM_PACKAGE_SHA256SUM='58ac03b345e8675e13322f8c7135906ce26a1ca7a87d041344d64b207be7bedf'
NEOVIM_PACKAGE_NAME='nvim-linux64.tar.gz'

ZSTD_PACKAGE_URL='https://github.com/facebook/zstd/releases/download/v1.5.2/zstd-1.5.2.tar.gz'
ZSTD_PACKAGE_SHA256SUM='7c42d56fac126929a6a85dbc73ff1db2411d04f104fae9bdea51305663a83fd0'
ZSTD_PACKAGE_NAME='zstd-1.5.2.tar.gz'
ZSTD_PACKAGE_EXTRACTED_DIR='zstd-1.5.2'

CMAKE_PACKAGE_URL="https://github.com/Kitware/CMake/releases/download/v3.25.2/cmake-3.25.2-linux-${ARCH}.tar.gz"
if [[ "${ARCH}" == 'x86_64' ]]; then
	CMAKE_PACKAGE_SHA256SUM='783da74f132fd1fea91b8236d267efa4df5b91c5eec1dea0a87f0cf233748d99'
elif [[ "${ARCH}" == 'aarch64' ]]; then
	CMAKE_PACKAGE_SHA256SUM='9216ecf0449ade700e66e0def11eeaebf9fa7d4428c02f49cb59f11418d3f8a5'
fi
CMAKE_PACKAGE_NAME="cmake-3.25.2-linux-${ARCH}.tar.gz"

CCACHE_PACKAGE_URL='https://github.com/ccache/ccache/releases/download/v4.7.4/ccache-4.7.4.tar.gz'
CCACHE_PACKAGE_SHA256SUM='dc283906b73bd7c461178ca472a459e9d86b5523405035921bd8204e77620264'
CCACHE_PACKAGE_NAME='ccache-4.7.4.tar.gz'
CCACHE_PACKAGE_EXTRACTED_DIR='ccache-4.7.4'
