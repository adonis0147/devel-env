#!/bin/bash
# shellcheck disable=2034

ARCH="$(uname -m)"
if [[ "${ARCH}" == 'arm64' ]]; then
	ARCH='aarch64'
fi

TZDB_PACKAGE_URL='https://github.com/eggert/tz/archive/refs/tags/2024b.tar.gz'
TZDB_PACKAGE_SHA256SUM='557c41d8eb5c29387a9d496db87c4aeb4f2ac8a2b6d5f60e869a8cade26e679c'
TZDB_PACKAGE_NAME='tz-2024b.tar.gz'
TZDB_PACKAGE_EXTRACTED_DIR='tz-2024b'

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

LIBTOOL_PACKAGE_URL='https://ftpmirror.gnu.org/libtool/libtool-2.5.3.tar.gz'
LIBTOOL_PACKAGE_SHA256SUM='9322bd8f6bc848fda3e385899dd1934957169652acef716d19d19d24053abb95'
LIBTOOL_PACKAGE_NAME='libtool-2.5.3.tar.gz'
LIBTOOL_PACKAGE_EXTRACTED_DIR='libtool-2.5.3'

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

OPENSSL_PACKAGE_URL='https://github.com/openssl/openssl/releases/download/openssl-3.4.0/openssl-3.4.0.tar.gz'
OPENSSL_PACKAGE_SHA256SUM='e15dda82fe2fe8139dc2ac21a36d4ca01d5313c75f99f46c4e8a27709b7294bf'
OPENSSL_PACKAGE_NAME='openssl-3.4.0.tar.gz'
OPENSSL_PACKAGE_EXTRACTED_DIR='openssl-3.4.0'

CURL_PACKAGE_URL='https://curl.se/download/curl-8.10.1.tar.gz'
CURL_PACKAGE_SHA256SUM='d15ebab765d793e2e96db090f0e172d127859d78ca6f6391d7eafecfd894bbc0'
CURL_PACKAGE_NAME='curl-8.10.1.tar.gz'
CURL_PACKAGE_EXTRACTED_DIR='curl-8.10.1'

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

SQLITE_PACKAGE_URL='https://sqlite.org/2024/sqlite-autoconf-3470000.tar.gz'
SQLITE_PACKAGE_SHA256SUM='83eb21a6f6a649f506df8bd3aab85a08f7556ceed5dbd8dea743ea003fc3a957'
SQLITE_PACKAGE_NAME='sqlite-autoconf-3470000.tar.gz'
SQLITE_PACKAGE_EXTRACTED_DIR='sqlite-autoconf-3470000'

PYTHON_PACKAGE_URL='https://github.com/python/cpython/archive/refs/tags/v3.13.0.tar.gz'
PYTHON_PACKAGE_SHA256SUM='d2c5dbd73111a80ee654489eb0f52b663b38ef9ce9e9323312515d941d0dfaa2'
PYTHON_PACKAGE_NAME='cpython-3.13.0.tar.gz'
PYTHON_PACKAGE_EXTRACTED_DIR='cpython-3.13.0'

EXPAT_PACKAGE_URL='https://github.com/libexpat/libexpat/releases/download/R_2_6_3/expat-2.6.3.tar.gz'
EXPRT_PACKAGE_SHA256SUM='17aa6cfc5c4c219c09287abfc10bc13f0c06f30bb654b28bfe6f567ca646eb79'
EXPAT_PACKAGE_NAME='expat-2.6.3.tar.gz'
EXPAT_PACKAGE_EXTRACTED_DIR='expat-2.6.3'

GETTEXT_PACKAGE_URL='https://ftpmirror.gnu.org/gettext/gettext-0.22.5.tar.xz'
GETTEXT_PACKAGE_SHA256SUM='fe10c37353213d78a5b83d48af231e005c4da84db5ce88037d88355938259640'
GETTEXT_PACKAGE_NAME='gettext-0.22.5.tar.xz'
GETTEXT_PACKAGE_EXTRACTED_DIR='gettext-0.22.5'

GIT_PACKAGE_URL='https://mirrors.edge.kernel.org/pub/software/scm/git/git-2.47.0.tar.gz'
GIT_PACKAGE_SHA256SUM='a84a7917e0ab608312834413f01fc01edc7844f9f9002ba69f3b4f4bcb8d937a'
GIT_PACKAGE_NAME='git-2.47.0.tar.gz'
GIT_PACKAGE_EXTRACTED_DIR='git-2.47.0'

GMP_PACKAGE_URL='https://ftpmirror.gnu.org/gmp/gmp-6.3.0.tar.xz'
GMP_PACKAGE_SHA256SUM='a3c2b80201b89e68616f4ad30bc66aee4927c3ce50e33929ca819d5c43538898'
GMP_PACKAGE_NAME='gmp-6.3.0.tar.xz'
GMP_PACKAGE_EXTRACTED_DIR='gmp-6.3.0'

MPFR_PACKAGE_URL='https://ftpmirror.gnu.org/mpfr/mpfr-4.2.1.tar.xz'
MPFR_PACKAGE_SHA256SUM='277807353a6726978996945af13e52829e3abd7a9a5b7fb2793894e18f1fcbb2'
MPFR_PACKAGE_NAME='mpfr-4.2.1.tar.xz'
MPFR_PACKAGE_EXTRACTED_DIR='mpfr-4.2.1'

TEXINFO_PACKAGE_URL='https://ftpmirror.gnu.org/texinfo/texinfo-7.1.1.tar.xz'
TEXINFO_PACKAGE_SHA256SUM='31ae37e46283529432b61bee1ce01ed0090d599e606fc6a29dca1f77c76a6c82'
TEXINFO_PACKAGE_NAME='texinfo-7.1.1.tar.xz'
TEXINFO_PACKAGE_EXTRACTED_DIR='texinfo-7.1.1'

GDB_PACKAGE_URL='https://ftpmirror.gnu.org/gdb/gdb-15.2.tar.gz'
GDB_PACKAGE_SHA256SUM='9d16bc2539a2a20dc3ef99b48b8414d51c51305c8577eb7a1da00996f6dea223'
GDB_PACKAGE_NAME='gdb-15.2.tar.gz'
GDB_PACKAGE_EXTRACTED_DIR='gdb-15.2'

NEOVIM_PACKAGE_URL='https://github.com/neovim/neovim/releases/download/v0.10.2/nvim.appimage'
NEOVIM_PACKAGE_SHA256SUM='970113b5279718126b82adddf3fbed1741db7afabf8a4134635a0d75c9f2c5d8'
NEOVIM_PACKAGE_NAME='nvim.appimage'

ZSTD_PACKAGE_URL='https://github.com/facebook/zstd/releases/download/v1.5.6/zstd-1.5.6.tar.gz'
ZSTD_PACKAGE_SHA256SUM='8c29e06cf42aacc1eafc4077ae2ec6c6fcb96a626157e0593d5e82a34fd403c1'
ZSTD_PACKAGE_NAME='zstd-1.5.6.tar.gz'
ZSTD_PACKAGE_EXTRACTED_DIR='zstd-1.5.6'

CMAKE_PACKAGE_URL="https://github.com/Kitware/CMake/releases/download/v3.30.5/cmake-3.30.5-linux-${ARCH}.tar.gz"
if [[ "${ARCH}" == 'x86_64' ]]; then
	CMAKE_PACKAGE_SHA256SUM='f747d9b23e1a252a8beafb4ed2bc2ddf78cff7f04a8e4de19f4ff88e9b51dc9d'
elif [[ "${ARCH}" == 'aarch64' ]]; then
	CMAKE_PACKAGE_SHA256SUM='da7dead2c92c1747b40d506d7f7d68590f5bab175316d2e7af73e48a2e417e48'
fi
CMAKE_PACKAGE_NAME="cmake-3.30.5-linux-${ARCH}.tar.gz"

XXHASH_PACKAGE_URL='https://github.com/Cyan4973/xxHash/archive/refs/tags/v0.8.2.tar.gz'
XXHASH_PACKAGE_SHA256SUM='baee0c6afd4f03165de7a4e67988d16f0f2b257b51d0e3cb91909302a26a79c4'
XXHASH_PACKAGE_NAME='xxHash-0.8.2.tar.gz'
XXHASH_PACKAGE_EXTRACTED_DIR='xxHash-0.8.2'

CCACHE_PACKAGE_URL='https://github.com/ccache/ccache/releases/download/v4.10.2/ccache-4.10.2.tar.gz'
CCACHE_PACKAGE_SHA256SUM='108100960bb7e64573ea925af2ee7611701241abb36ce0aae3354528403a7d87'
CCACHE_PACKAGE_NAME='ccache-4.10.2.tar.gz'
CCACHE_PACKAGE_EXTRACTED_DIR='ccache-4.10.2'

LIBXML2_PACKAGE_URL='https://github.com/GNOME/libxml2/archive/refs/tags/v2.13.4.tar.gz'
LIBXML2_PACKAGE_SHA256SUM='a8e3bb394654d5001b3afdec1666b656940c514088def4bcc6804c598c7fe0d0'
LIBXML2_PACKAGE_NAME='libxml2-2.13.4.tar.gz'
LIBXML2_PACKAGE_EXTRACTED_DIR='libxml2-2.13.4'

SWIG_PACKAGE_URL='https://downloads.sourceforge.net/project/swig/swig/swig-4.3.0/swig-4.3.0.tar.gz'
SWIG_PACKAGE_SHA256SUM='f7203ef796f61af986c70c05816236cbd0d31b7aa9631e5ab53020ab7804aa9e'
SWIG_PACKAGE_NAME='swig-4.3.0.tar.gz'
SWIG_PACKAGE_EXTRACTED_DIR='swig-4.3.0'

LIBEDIT_PACKAGE_URL='https://www.thrysoee.dk/editline/libedit-20240808-3.1.tar.gz'
LIBEDIT_PACKAGE_SHA256SUM='5f0573349d77c4a48967191cdd6634dd7aa5f6398c6a57fe037cc02696d6099f'
LIBEDIT_PACKAGE_NAME='libedit-20240808-3.1.tar.gz'
LIBEDIT_PACKAGE_EXTRACTED_DIR='libedit-20240808-3.1'

LLVM_PACKAGE_URL='https://github.com/llvm/llvm-project/releases/download/llvmorg-19.1.3/llvm-project-19.1.3.src.tar.xz'
LLVM_PACKAGE_SHA256SUM='324d483ff0b714c8ce7819a1b679dd9e4706cf91c6caf7336dc4ac0c1d3bf636'
LLVM_PACKAGE_NAME='llvm-project-19.1.3.src.tar.xz'
LLVM_PACKAGE_EXTRACTED_DIR='llvm-project-19.1.3.src'

ZSH_PACKAGE_URL='https://downloads.sourceforge.net/project/zsh/zsh/5.9/zsh-5.9.tar.xz'
ZSH_PACKAGE_SHA256SUM='9b8d1ecedd5b5e81fbf1918e876752a7dd948e05c1a0dba10ab863842d45acd5'
ZSH_PACKAGE_NAME='zsh-5.9.tar.xz'
ZSH_PACKAGE_EXTRACTED_DIR='zsh-5.9'
