#!/bin/bash
# shellcheck disable=2034

if [[ -z "${ARCH}" ]]; then
	ARCH="$(uname -m)"
	if [[ "${ARCH}" == 'arm64' ]]; then
		ARCH='aarch64'
	fi
fi

RUST_PACKAGE_URL="https://static.rust-lang.org/dist/rust-1.96.0-${ARCH}-unknown-linux-gnu.tar.xz"
if [[ "${ARCH}" == 'x86_64' ]]; then
	RUST_PACKAGE_SHA256SUM='c295047583a56238ea06b43f849f4b877fa12bfd4c7103f8d9a74c94c9c4e108'
elif [[ "${ARCH}" == 'aarch64' ]]; then
	RUST_PACKAGE_SHA256SUM='371eadcca97062219cbd8593628eb5d2802bc370515d085fedce1b56b2baed57'
fi
RUST_PACKAGE_NAME="rust-1.96.0-${ARCH}-unknown-linux-gnu.tar.xz"
RUST_PACKAGE_EXTRACTED_DIR="rust-1.96.0-${ARCH}-unknown-linux-gnu"

TZDB_PACKAGE_URL='https://github.com/eggert/tz/archive/refs/tags/2026b.tar.gz'
TZDB_PACKAGE_SHA256SUM='bba53da7f6e4fd7739f464ca3356dd9dbe9730c0b098337049f1bbc956b87159'
TZDB_PACKAGE_NAME='tz-2026b.tar.gz'
TZDB_PACKAGE_EXTRACTED_DIR='tz-2026b'

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

PATCHELF_PACKAGE_URL="https://github.com/NixOS/patchelf/releases/download/0.15.5/patchelf-0.15.5-${ARCH}.tar.gz"
if [[ "${ARCH}" == 'x86_64' ]]; then
	PATCHELF_PACKAGE_SHA256SUM='ed3b12af4b61733ee65e18d58c52855469ff7d879d91e1ba4239d3b73af8c295'
elif [[ "${ARCH}" == 'aarch64' ]]; then
	PATCHELF_PACKAGE_SHA256SUM='6b4c8206c6c1c2f1da76a283fb564df3b339ce844096e0488654001621177435'
fi
PATCHELF_PACKAGE_NAME="patchelf-0.15.5-${ARCH}.tar.gz"

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

CURL_PACKAGE_URL='https://curl.se/download/curl-8.20.0.tar.gz'
CURL_PACKAGE_SHA256SUM='fc5819cad3f9f5482669adcdc49a782c15f36d2a0715b395b06d9173593d2dc0'
CURL_PACKAGE_NAME='curl-8.20.0.tar.gz'
CURL_PACKAGE_EXTRACTED_DIR='curl-8.20.0'

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

SQLITE_PACKAGE_URL='https://sqlite.org/2026/sqlite-autoconf-3530200.tar.gz'
SQLITE_PACKAGE_SHA256SUM='588ad51949419a56ebe81fe56193d510c559eb94c9a57748387860b5d3069316'
SQLITE_PACKAGE_NAME='sqlite-autoconf-3530200.tar.gz'
SQLITE_PACKAGE_EXTRACTED_DIR='sqlite-autoconf-3530200'

PYTHON_PACKAGE_URL='https://github.com/python/cpython/archive/refs/tags/v3.14.6.tar.gz'
PYTHON_PACKAGE_SHA256SUM='7f77ccf3613ddadc74dfb8d6f8082581a8835115a25e1307d189f03aa750893e'
PYTHON_PACKAGE_NAME='cpython-3.14.6.tar.gz'
PYTHON_PACKAGE_EXTRACTED_DIR='cpython-3.14.6'

EXPAT_PACKAGE_URL='https://github.com/libexpat/libexpat/releases/download/R_2_8_1/expat-2.8.1.tar.gz'
EXPRT_PACKAGE_SHA256SUM='a52eb72108be160e190b5cafa5bba8663f1313f2013e26060d1c18e26e31067b'
EXPAT_PACKAGE_NAME='expat-2.8.1.tar.gz'
EXPAT_PACKAGE_EXTRACTED_DIR='expat-2.8.1'

GETTEXT_PACKAGE_URL='https://ftpmirror.gnu.org/gettext/gettext-1.0.tar.xz'
GETTEXT_PACKAGE_SHA256SUM='71132a3fb71e68245b8f2ac4e9e97137d3e5c02f415636eb508ae607bc01add7'
GETTEXT_PACKAGE_NAME='gettext-1.0.tar.xz'
GETTEXT_PACKAGE_EXTRACTED_DIR='gettext-1.0'

GIT_PACKAGE_URL='https://github.com/git/git/archive/refs/tags/v2.54.0.tar.gz'
GIT_PACKAGE_SHA256SUM='7b01a23c44c9ccfca2e3ad9daf8cbdd4d4caaaa6b5181e77e16e60c6ae5f772a'
GIT_PACKAGE_NAME='git-2.54.0.tar.gz'
GIT_PACKAGE_EXTRACTED_DIR='git-2.54.0'

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

NEOVIM_PACKAGE_URL="https://github.com/neovim/neovim/releases/download/v0.12.3/nvim-linux-${ARCH/aarch64/arm64}.tar.gz"
if [[ "${ARCH}" == 'x86_64' ]]; then
	NEOVIM_PACKAGE_SHA256SUM='c441b547142860bf01bcce39e36cbed185c41112813e15443b16e5237750724d'
else
	NEOVIM_PACKAGE_SHA256SUM='e055af73fa9c72b37456da8d204fa5c09850bc07e80e9176fe3b87d4afb7a3fc'
fi
NEOVIM_PACKAGE_NAME="nvim-linux-${ARCH/aarch64/arm64}.tar.gz"

ZSTD_PACKAGE_URL='https://github.com/facebook/zstd/releases/download/v1.5.7/zstd-1.5.7.tar.gz'
ZSTD_PACKAGE_SHA256SUM='eb33e51f49a15e023950cd7825ca74a4a2b43db8354825ac24fc1b7ee09e6fa3'
ZSTD_PACKAGE_NAME='zstd-1.5.7.tar.gz'
ZSTD_PACKAGE_EXTRACTED_DIR='zstd-1.5.7'

CMAKE_PACKAGE_URL="https://github.com/Kitware/CMake/releases/download/v4.3.3/cmake-4.3.3-linux-${ARCH}.tar.gz"
if [[ "${ARCH}" == 'x86_64' ]]; then
	CMAKE_PACKAGE_SHA256SUM='927b2368a946c37269c3a66225ab00544e756459cdd0b5d0da438694fb9ff802'
elif [[ "${ARCH}" == 'aarch64' ]]; then
	CMAKE_PACKAGE_SHA256SUM='9ea38356dbd3e32e51029a3e09a0f2f8e117ef4fbcaad7a21ffb36409bbd5cb4'
fi
CMAKE_PACKAGE_NAME="cmake-4.3.3-linux-${ARCH}.tar.gz"
CMAKE_PACKAGE_EXTRACTED_DIR="cmake-4.3.3-linux-${ARCH}"

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

LLVM_PACKAGE_URL='https://github.com/llvm/llvm-project/releases/download/llvmorg-22.1.7/llvm-project-22.1.7.src.tar.xz'
LLVM_PACKAGE_SHA256SUM='5cc4a3f12bba50b6bdfb4b61bdc852117a0ff2517807c3902fc13267fb93562e'
LLVM_PACKAGE_NAME='llvm-project-22.1.7.src.tar.xz'
LLVM_PACKAGE_EXTRACTED_DIR='llvm-project-22.1.7.src'

ZSH_PACKAGE_URL='https://downloads.sourceforge.net/project/zsh/zsh/5.9.1/zsh-5.9.1.tar.xz'
ZSH_PACKAGE_SHA256SUM='5d20bec03f981dc4e9a09ec245e7415388ff641f79c5c5c416b5042e58d8280d'
ZSH_PACKAGE_NAME='zsh-5.9.1.tar.xz'
ZSH_PACKAGE_EXTRACTED_DIR='zsh-5.9.1'
