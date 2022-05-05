#!/bin/bash
# shellcheck disable=2034

AUTOCONF_PACKAGE_URL='https://ftp.gnu.org/gnu/autoconf/autoconf-2.71.tar.gz'
AUTOCONF_PACKAGE_SHA256SUM='431075ad0bf529ef13cb41e9042c542381103e80015686222b8a9d4abef42a1c'
AUTOCONF_PACKAGE_NAME='autoconf-2.71.tar.gz'
AUTOCONF_PACKAGE_EXTRACTED_DIR='autoconf-2.71'

AUTOMAKE_PACKAGE_URL='https://ftp.gnu.org/gnu/automake/automake-1.16.5.tar.gz'
AUTOMAKE_PACKAGE_SHA256SUM='07bd24ad08a64bc17250ce09ec56e921d6343903943e99ccf63bbf0705e34605'
AUTOMAKE_PACKAGE_NAME='automake-1.16.5.tar.gz'
AUTOMAKE_PACKAGE_EXTRACTED_DIR='automake-1.16.5'

LIBTOOL_PACKAGE_URL='https://ftp.gnu.org/gnu/libtool/libtool-2.4.7.tar.gz'
LIBTOOL_PACKAGE_SHA256SUM='04e96c2404ea70c590c546eba4202a4e12722c640016c12b9b2f1ce3d481e9a8'
LIBTOOL_PACKAGE_NAME='libtool-2.4.7.tar.gz'
LIBTOOL_PACKAGE_EXTRACTED_DIR='libtool-2.4.7'

MAKE_PACKAGE_URL='https://ftp.gnu.org/gnu/make/make-4.3.tar.gz'
MAKE_PACKAGE_SHA256SUM='e05fdde47c5f7ca45cb697e973894ff4f5d79e13b750ed57d7b66d8defc78e19'
MAKE_PACKAGE_NAME='make-4.3.tar.gz'
MAKE_PACKAGE_EXTRACTED_DIR='make-4.3'

PKG_CONFIG_PACKAGE_URL='https://pkgconfig.freedesktop.org/releases/pkg-config-0.29.2.tar.gz'
PKG_CONFIG_PACKAGE_SHA256SUM='6fc69c01688c9458a57eb9a1664c9aba372ccda420a02bf4429fe610e7e7d591'
PKG_CONFIG_PACKAGE_NAME='pkg-config-0.29.2.tar.gz'
PKG_CONFIG_PACKAGE_EXTRACTED_DIR='pkg-config-0.29.2'

PATCHELF_PACKAGE_URL='https://github.com/NixOS/patchelf/releases/download/0.14.5/patchelf-0.14.5-x86_64.tar.gz'
PATCHELF_PACKAGE_SHA256SUM='514bb05d8f0e41ea0a6cb999041acb6aa386662e9ccdbdfbbfca469fb22d44fa'
PATCHELF_PACKAGE_NAME='patchelf-0.14.5-x86_64.tar.gz'

NCURSES_PACKAGE_URL='https://ftp.gnu.org/gnu/ncurses/ncurses-6.3.tar.gz'
NCURSES_PACKAGE_SHA256SUM='97fc51ac2b085d4cde31ef4d2c3122c21abc217e9090a43a30fc5ec21684e059'
NCURSES_PACKAGE_NAME='ncurses-6.3.tar.gz'
NCURSES_PACKAGE_EXTRACTED_DIR='ncurses-6.3'

READLINE_PACKAGE_URL='https://ftp.gnu.org/gnu/readline/readline-8.1.2.tar.gz'
READLINE_PACKAGE_SHA256SUM='7589a2381a8419e68654a47623ce7dfcb756815c8fee726b98f90bf668af7bc6'
READLINE_PACKAGE_NAME='readline-8.1.2.tar.gz'
READLINE_PACKAGE_EXTRACTED_DIR='readline-8.1.2'

LIBFFI_PACKAGE_URL='https://github.com/libffi/libffi/releases/download/v3.4.2/libffi-3.4.2.tar.gz'
LIBFFI_PACKAGE_SHA256SUM='540fb721619a6aba3bdeef7d940d8e9e0e6d2c193595bc243241b77ff9e93620'
LIBFFI_PACKAGE_NAME='libffi-3.4.2.tar.gz'
LIBFFI_PACKAGE_EXTRACTED_DIR='libffi-3.4.2'

ZLIB_PACKAGE_URL='https://github.com/madler/zlib/archive/refs/tags/v1.2.12.tar.gz'
ZLIB_PACKAGE_SHA256SUM='d8688496ea40fb61787500e863cc63c9afcbc524468cedeb478068924eb54932'
ZLIB_PACKAGE_NAME='zlib-1.2.12.tar.gz'
ZLIB_PACKAGE_EXTRACTED_DIR='zlib-1.2.12'

OPENSSL_PACKAGE_URL='https://www.openssl.org/source/openssl-1.1.1n.tar.gz'
OPENSSL_PACKAGE_SHA256SUM='40dceb51a4f6a5275bde0e6bf20ef4b91bfc32ed57c0552e2e8e15463372b17a'
OPENSSL_PACKAGE_NAME='openssl-1.1.1n.tar.gz'
OPENSSL_PACKAGE_EXTRACTED_DIR='openssl-1.1.1n'

CURL_PACKAGE_URL='https://curl.se/download/curl-7.83.0.tar.gz'
CURL_PACKAGE_SHA256SUM='c0e64302a33d2fb79e0fc4e674260a22941e92ee2f11b894bf94d32b8f5531af'
CURL_PACKAGE_NAME='curl-7.83.0.tar.gz'
CURL_PACKAGE_EXTRACTED_DIR='curl-7.83.0'

WGET_PACKAGE_URL='https://ftp.gnu.org/gnu/wget/wget-1.21.3.tar.gz'
WGET_PACKAGE_SHA256SUM='5726bb8bc5ca0f6dc7110f6416e4bb7019e2d2ff5bf93d1ca2ffcc6656f220e5'
WGET_PACKAGE_NAME='wget-1.21.3.tar.gz'
WGET_PACKAGE_EXTRACTED_DIR='wget-1.21.3'

BZIP2_PACKAGE_URL='https://sourceware.org/pub/bzip2/bzip2-1.0.8.tar.gz'
BZIP2_PACKAGE_SHA256SUM='ab5a03176ee106d3f0fa90e381da478ddae405918153cca248e682cd0c4a2269'
BZIP2_PACKAGE_NAME='bzip2-1.0.8.tar.gz'
BZIP2_PACKAGE_EXTRACTED_DIR='bzip2-1.0.8'

PYTHON_PACKAGE_URL='https://www.python.org/ftp/python/3.10.4/Python-3.10.4.tgz'
PYTHON_PACKAGE_SHA256SUM='f3bcc65b1d5f1dc78675c746c98fcee823c038168fc629c5935b044d0911ad28'
PYTHON_PACKAGE_NAME='Python-3.10.4.tgz'
PYTHON_PACKAGE_EXTRACTED_DIR='Python-3.10.4'

EXPAT_PACKAGE_URL='https://github.com/libexpat/libexpat/releases/download/R_2_4_8/expat-2.4.8.tar.gz'
EXPRT_PACKAGE_SHA256SUM='398f6d95bf808d3108e27547b372cb4ac8dc2298a3c4251eb7aa3d4c6d4bb3e2'
EXPAT_PACKAGE_NAME='expat-2.4.8.tar.gz'
EXPAT_PACKAGE_EXTRACTED_DIR='expat-2.4.8'

GIT_PACKAGE_URL='https://www.kernel.org/pub/software/scm/git/git-2.36.0.tar.gz'
GIT_PACKAGE_SHA256SUM='9785f8c99daea037b8443d2f7397ac6aafbf8d5ff21fbfe2e5c0d443d126e211'
GIT_PACKAGE_NAME='git-2.36.0.tar.gz'
GIT_PACKAGE_EXTRACTED_DIR='git-2.36.0'

GMP_PACKAGE_URL='https://ftp.gnu.org/gnu/gmp/gmp-6.2.1.tar.xz'
GMP_PACKAGE_SHA256SUM='fd4829912cddd12f84181c3451cc752be224643e87fac497b69edddadc49b4f2'
GMP_PACKAGE_NAME='gmp-6.2.1.tar.xz'
GMP_PACKAGE_EXTRACTED_DIR='gmp-6.2.1'

GDB_PACKAGE_URL='https://ftp.gnu.org/gnu/gdb/gdb-12.1.tar.gz'
GDB_PACKAGE_SHA256SUM='87296a3a9727356b56712c793704082d5df0ff36a34ca9ec9734fc9a8bdfdaab'
GDB_PACKAGE_NAME='gdb-12.1.tar.gz'
GDB_PACKAGE_EXTRACTED_DIR='gdb-12.1'

NEOVIM_PACKAGE_URL='https://github.com/neovim/neovim/releases/download/v0.7.0/nvim-linux64.tar.gz'
NEOVIM_PACKAGE_SHA256SUM='5b3fced3f185ae1e1497cb5f949597c4065585fc26e7cd25a31f5f791dbd9b59'
NEOVIM_PACKAGE_NAME='nvim-linux64.tar.gz'
