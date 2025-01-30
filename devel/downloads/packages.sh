#!/bin/bash
# shellcheck disable=2034

ARCH="$(uname -m)"
if [[ "${ARCH}" == 'arm64' ]]; then
	ARCH='aarch64'
fi

TZDB_PACKAGE_URL='https://github.com/eggert/tz/archive/refs/tags/2025a.tar.gz'
TZDB_PACKAGE_SHA256SUM='d0f35d0a3b5ca1bb25539b159c1338135a4f59b0d423381ecafa31d0449caea5'
TZDB_PACKAGE_NAME='tz-2025a.tar.gz'
TZDB_PACKAGE_EXTRACTED_DIR='tz-2025a'

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

LIBFFI_PACKAGE_URL='https://github.com/libffi/libffi/releases/download/v3.4.6/libffi-3.4.6.tar.gz'
LIBFFI_PACKAGE_SHA256SUM='b0dea9df23c863a7a50e825440f3ebffabd65df1497108e5d437747843895a4e'
LIBFFI_PACKAGE_NAME='libffi-3.4.6.tar.gz'
LIBFFI_PACKAGE_EXTRACTED_DIR='libffi-3.4.6'

ZLIB_PACKAGE_URL='https://github.com/madler/zlib/releases/download/v1.3.1/zlib-1.3.1.tar.gz'
ZLIB_PACKAGE_SHA256SUM='9a93b2b7dfdac77ceba5a558a580e74667dd6fede4585b91eefb60f03b72df23'
ZLIB_PACKAGE_NAME='zlib-1.3.1.tar.gz'
ZLIB_PACKAGE_EXTRACTED_DIR='zlib-1.3.1'

PERL_PACKAGE_URL='https://www.cpan.org/src/5.0/perl-5.40.1.tar.gz'
PERL_PACKAGE_SHA256SUM='02f8c45bb379ed0c3de7514fad48c714fd46be8f0b536bfd5320050165a1ee26'
PERL_PACKAGE_NAME='perl-5.40.1.tar.gz'
PERL_PACKAGE_EXTRACTED_DIR='perl-5.40.1'

OPENSSL_PACKAGE_URL='https://github.com/openssl/openssl/releases/download/openssl-3.4.0/openssl-3.4.0.tar.gz'
OPENSSL_PACKAGE_SHA256SUM='e15dda82fe2fe8139dc2ac21a36d4ca01d5313c75f99f46c4e8a27709b7294bf'
OPENSSL_PACKAGE_NAME='openssl-3.4.0.tar.gz'
OPENSSL_PACKAGE_EXTRACTED_DIR='openssl-3.4.0'

CURL_PACKAGE_URL='https://curl.se/download/curl-8.11.1.tar.gz'
CURL_PACKAGE_SHA256SUM='a889ac9dbba3644271bd9d1302b5c22a088893719b72be3487bc3d401e5c4e80'
CURL_PACKAGE_NAME='curl-8.11.1.tar.gz'
CURL_PACKAGE_EXTRACTED_DIR='curl-8.11.1'

WGET_PACKAGE_URL='https://ftpmirror.gnu.org/wget/wget2-2.2.0.tar.gz'
WGET_PACKAGE_SHA256SUM='2b3b9c85b7fb26d33ca5f41f1f8daca71838d869a19b406063aa5c655294d357'
WGET_PACKAGE_NAME='wget2-2.2.0.tar.gz'
WGET_PACKAGE_EXTRACTED_DIR='wget2-2.2.0'

BZIP2_PACKAGE_URL='https://sourceware.org/pub/bzip2/bzip2-1.0.8.tar.gz'
BZIP2_PACKAGE_SHA256SUM='ab5a03176ee106d3f0fa90e381da478ddae405918153cca248e682cd0c4a2269'
BZIP2_PACKAGE_NAME='bzip2-1.0.8.tar.gz'
BZIP2_PACKAGE_EXTRACTED_DIR='bzip2-1.0.8'

XZ_PACKAGE_URL='https://downloads.sourceforge.net/project/lzmautils/xz-5.4.6.tar.gz'
XZ_PACKAGE_SHA256SUM='aeba3e03bf8140ddedf62a0a367158340520f6b384f75ca6045ccc6c0d43fd5c'
XZ_PACKAGE_NAME='xz-5.4.6.tar.gz'
XZ_PACKAGE_EXTRACTED_DIR='xz-5.4.6'

SQLITE_PACKAGE_URL='https://sqlite.org/2025/sqlite-autoconf-3480000.tar.gz'
SQLITE_PACKAGE_SHA256SUM='ac992f7fca3989de7ed1fe99c16363f848794c8c32a158dafd4eb927a2e02fd5'
SQLITE_PACKAGE_NAME='sqlite-autoconf-3480000.tar.gz'
SQLITE_PACKAGE_EXTRACTED_DIR='sqlite-autoconf-3480000'

PYTHON_PACKAGE_URL='https://github.com/python/cpython/archive/refs/tags/v3.13.1.tar.gz'
PYTHON_PACKAGE_SHA256SUM='4626cf3c6b8ab7763f4b99aeaf260b25ffb0045777d52dc85aaec4a3175deee0'
PYTHON_PACKAGE_NAME='cpython-3.13.1.tar.gz'
PYTHON_PACKAGE_EXTRACTED_DIR='cpython-3.13.1'

EXPAT_PACKAGE_URL='https://github.com/libexpat/libexpat/releases/download/R_2_6_4/expat-2.6.4.tar.gz'
EXPRT_PACKAGE_SHA256SUM='fd03b7172b3bd7427a3e7a812063f74754f24542429b634e0db6511b53fb2278'
EXPAT_PACKAGE_NAME='expat-2.6.4.tar.gz'
EXPAT_PACKAGE_EXTRACTED_DIR='expat-2.6.4'

GETTEXT_PACKAGE_URL='https://ftpmirror.gnu.org/gettext/gettext-0.23.1.tar.xz'
GETTEXT_PACKAGE_SHA256SUM='c1f97a72a7385b7e71dd07b5fea6cdaf12c9b88b564976b23bd8c11857af2970'
GETTEXT_PACKAGE_NAME='gettext-0.23.1.tar.xz'
GETTEXT_PACKAGE_EXTRACTED_DIR='gettext-0.23.1'

GIT_PACKAGE_URL='https://mirrors.edge.kernel.org/pub/software/scm/git/git-2.48.1.tar.gz'
GIT_PACKAGE_SHA256SUM='51b4d03b1e311ba673591210f94f24a4c5781453e1eb188822e3d9cdc04c2212'
GIT_PACKAGE_NAME='git-2.48.1.tar.gz'
GIT_PACKAGE_EXTRACTED_DIR='git-2.48.1'

GMP_PACKAGE_URL='https://ftpmirror.gnu.org/gmp/gmp-6.3.0.tar.xz'
GMP_PACKAGE_SHA256SUM='a3c2b80201b89e68616f4ad30bc66aee4927c3ce50e33929ca819d5c43538898'
GMP_PACKAGE_NAME='gmp-6.3.0.tar.xz'
GMP_PACKAGE_EXTRACTED_DIR='gmp-6.3.0'

MPFR_PACKAGE_URL='https://ftpmirror.gnu.org/mpfr/mpfr-4.2.1.tar.xz'
MPFR_PACKAGE_SHA256SUM='277807353a6726978996945af13e52829e3abd7a9a5b7fb2793894e18f1fcbb2'
MPFR_PACKAGE_NAME='mpfr-4.2.1.tar.xz'
MPFR_PACKAGE_EXTRACTED_DIR='mpfr-4.2.1'

TEXINFO_PACKAGE_URL='https://ftpmirror.gnu.org/texinfo/texinfo-7.2.tar.xz'
TEXINFO_PACKAGE_SHA256SUM='0329d7788fbef113fa82cb80889ca197a344ce0df7646fe000974c5d714363a6'
TEXINFO_PACKAGE_NAME='texinfo-7.2.tar.xz'
TEXINFO_PACKAGE_EXTRACTED_DIR='texinfo-7.2'

GDB_PACKAGE_URL='https://ftpmirror.gnu.org/gdb/gdb-16.1.tar.gz'
GDB_PACKAGE_SHA256SUM='ff2cfff60546a3851561ddac7c012a7c184bb95b66286ae332d16880f77247c9'
GDB_PACKAGE_NAME='gdb-16.1.tar.gz'
GDB_PACKAGE_EXTRACTED_DIR='gdb-16.1'

NEOVIM_PACKAGE_URL="https://github.com/neovim/neovim/releases/download/v0.10.4/nvim-linux-${ARCH/aarch64/arm64}.tar.gz"
if [[ "${ARCH}" == 'x86_64' ]]; then
	NEOVIM_PACKAGE_SHA256SUM='95aaa8e89473f5421114f2787c13ae0ec6e11ebbd1a13a1bd6fcf63420f8073f'
else
	NEOVIM_PACKAGE_SHA256SUM='c819bf47a9878013ba35ceae87125dd170ede4a72844d049fb35f781045872eb'
fi
NEOVIM_PACKAGE_NAME="nvim-linux-${ARCH/aarch64/arm64}.tar.gz"

ZSTD_PACKAGE_URL='https://github.com/facebook/zstd/releases/download/v1.5.6/zstd-1.5.6.tar.gz'
ZSTD_PACKAGE_SHA256SUM='8c29e06cf42aacc1eafc4077ae2ec6c6fcb96a626157e0593d5e82a34fd403c1'
ZSTD_PACKAGE_NAME='zstd-1.5.6.tar.gz'
ZSTD_PACKAGE_EXTRACTED_DIR='zstd-1.5.6'

CMAKE_PACKAGE_URL="https://github.com/Kitware/CMake/releases/download/v3.31.5/cmake-3.31.5-linux-${ARCH}.tar.gz"
if [[ "${ARCH}" == 'x86_64' ]]; then
	CMAKE_PACKAGE_SHA256SUM='2984e70515ff60c5e4a41922b5d715a8168a696a89721e3b114e36f453244f72'
elif [[ "${ARCH}" == 'aarch64' ]]; then
	CMAKE_PACKAGE_SHA256SUM='eb92af175ea91e3706ff62484088c3a3774ef3e1a8c399111785dd5f47010164'
fi
CMAKE_PACKAGE_NAME="cmake-3.31.5-linux-${ARCH}.tar.gz"

XXHASH_PACKAGE_URL='https://github.com/Cyan4973/xxHash/archive/refs/tags/v0.8.3.tar.gz'
XXHASH_PACKAGE_SHA256SUM='aae608dfe8213dfd05d909a57718ef82f30722c392344583d3f39050c7f29a80'
XXHASH_PACKAGE_NAME='xxHash-0.8.3.tar.gz'
XXHASH_PACKAGE_EXTRACTED_DIR='xxHash-0.8.3'

CCACHE_PACKAGE_URL='https://github.com/ccache/ccache/releases/download/v4.10.2/ccache-4.10.2.tar.gz'
CCACHE_PACKAGE_SHA256SUM='108100960bb7e64573ea925af2ee7611701241abb36ce0aae3354528403a7d87'
CCACHE_PACKAGE_NAME='ccache-4.10.2.tar.gz'
CCACHE_PACKAGE_EXTRACTED_DIR='ccache-4.10.2'

LIBXML2_PACKAGE_URL='https://github.com/GNOME/libxml2/archive/refs/tags/v2.13.5.tar.gz'
LIBXML2_PACKAGE_SHA256SUM='87d681718760ba42e749a61482d71b34d1d566843e9ade39a73fea92caf8293b'
LIBXML2_PACKAGE_NAME='libxml2-2.13.5.tar.gz'
LIBXML2_PACKAGE_EXTRACTED_DIR='libxml2-2.13.5'

SWIG_PACKAGE_URL='https://downloads.sourceforge.net/project/swig/swig/swig-4.3.0/swig-4.3.0.tar.gz'
SWIG_PACKAGE_SHA256SUM='f7203ef796f61af986c70c05816236cbd0d31b7aa9631e5ab53020ab7804aa9e'
SWIG_PACKAGE_NAME='swig-4.3.0.tar.gz'
SWIG_PACKAGE_EXTRACTED_DIR='swig-4.3.0'

LIBEDIT_PACKAGE_URL='https://www.thrysoee.dk/editline/libedit-20240808-3.1.tar.gz'
LIBEDIT_PACKAGE_SHA256SUM='5f0573349d77c4a48967191cdd6634dd7aa5f6398c6a57fe037cc02696d6099f'
LIBEDIT_PACKAGE_NAME='libedit-20240808-3.1.tar.gz'
LIBEDIT_PACKAGE_EXTRACTED_DIR='libedit-20240808-3.1'

LLVM_PACKAGE_URL='https://github.com/llvm/llvm-project/releases/download/llvmorg-19.1.7/llvm-project-19.1.7.src.tar.xz'
LLVM_PACKAGE_SHA256SUM='82401fea7b79d0078043f7598b835284d6650a75b93e64b6f761ea7b63097501'
LLVM_PACKAGE_NAME='llvm-project-19.1.7.src.tar.xz'
LLVM_PACKAGE_EXTRACTED_DIR='llvm-project-19.1.7.src'

ZSH_PACKAGE_URL='https://downloads.sourceforge.net/project/zsh/zsh/5.9/zsh-5.9.tar.xz'
ZSH_PACKAGE_SHA256SUM='9b8d1ecedd5b5e81fbf1918e876752a7dd948e05c1a0dba10ab863842d45acd5'
ZSH_PACKAGE_NAME='zsh-5.9.tar.xz'
ZSH_PACKAGE_EXTRACTED_DIR='zsh-5.9'
