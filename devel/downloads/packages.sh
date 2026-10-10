#!/bin/bash
# shellcheck disable=2034

if [[ -z "${ARCH}" ]]; then
	ARCH="$(uname -m)"
	if [[ "${ARCH}" == 'arm64' ]]; then
		ARCH='aarch64'
	fi
fi

RUST_PACKAGE_URL="https://static.rust-lang.org/dist/rust-1.99.0-${ARCH}-unknown-linux-gnu.tar.xz"
if [[ "${ARCH}" == 'x86_64' ]]; then
	RUST_PACKAGE_SHA256SUM='891c6366d7100feda0bca4c03ce63f3c9ac827cbebbc283e7433061d42c6a376'
elif [[ "${ARCH}" == 'aarch64' ]]; then
	RUST_PACKAGE_SHA256SUM='5a30ce742be0835d9b23fc862db5cbbbc71464e1c9b1fca22917e10e4ba32a92'
fi
RUST_PACKAGE_NAME="rust-1.99.0-${ARCH}-unknown-linux-gnu.tar.xz"
RUST_PACKAGE_EXTRACTED_DIR="rust-1.99.0-${ARCH}-unknown-linux-gnu"

TZDB_PACKAGE_URL='https://github.com/eggert/tz/archive/refs/tags/2026e.tar.gz'
TZDB_PACKAGE_SHA256SUM='5b62258a9a868813f00b070983b9b3e7279634575571a0fcc732be6a1f7047c1'
TZDB_PACKAGE_NAME='tz-2026e.tar.gz'
TZDB_PACKAGE_EXTRACTED_DIR='tz-2026e'

M4_PACKAGE_URL='https://ftpmirror.gnu.org/m4/m4-1.4.21.tar.xz'
M4_PACKAGE_SHA256SUM='f25c6ab51548a73a75558742fb031e0625d6485fe5f9155949d6486a2408ab66'
M4_PACKAGE_NAME='m4-1.4.21.tar.xz'
M4_PACKAGE_EXTRACTED_DIR='m4-1.4.21'

AUTOCONF_PACKAGE_URL='https://ftpmirror.gnu.org/autoconf/autoconf-2.73.tar.gz'
AUTOCONF_PACKAGE_SHA256SUM='259ddfa3bddc799cfb81489cc0f17dfdf1bd6d1505dda53c0f45ff60d6a4f9a7'
AUTOCONF_PACKAGE_NAME='autoconf-2.73.tar.gz'
AUTOCONF_PACKAGE_EXTRACTED_DIR='autoconf-2.73'

AUTOMAKE_PACKAGE_URL='https://ftpmirror.gnu.org/automake/automake-1.19.tar.gz'
AUTOMAKE_PACKAGE_SHA256SUM='79e8b1f7a967e87ce8a9ded76bee7f793d0ce1886ab2002feb1b0510f578b75a'
AUTOMAKE_PACKAGE_NAME='automake-1.19.tar.gz'
AUTOMAKE_PACKAGE_EXTRACTED_DIR='automake-1.19'

LIBTOOL_PACKAGE_URL='https://ftpmirror.gnu.org/libtool/libtool-2.6.2.tar.gz'
LIBTOOL_PACKAGE_SHA256SUM='24adb3aa9ae035c70faba344af57d73215eb89281045af6c7ccd307751f8b0bf'
LIBTOOL_PACKAGE_NAME='libtool-2.6.2.tar.gz'
LIBTOOL_PACKAGE_EXTRACTED_DIR='libtool-2.6.2'

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

POLYFILL_GLIBC_PACKAGE_URL='https://github.com/corsix/polyfill-glibc/archive/e8107d6b05aab7dfe1f52ff3d362c15909cb03ff.tar.gz'
POLYFILL_GLIBC_PACKAGE_SHA256SUM='ff6bd3be3f2fd919143150b49a9ab98d9370f0e37b110482a934e8bb79308e3c'
POLYFILL_GLIBC_PACKAGE_NAME='polyfill-glibc-e8107d6b05aab7dfe1f52ff3d362c15909cb03ff.tar.gz'
POLYFILL_GLIBC_PACKAGE_EXTRACTED_DIR='polyfill-glibc-e8107d6b05aab7dfe1f52ff3d362c15909cb03ff'

PATCHELF_PACKAGE_URL="https://github.com/NixOS/patchelf/releases/download/0.19.2/patchelf-0.19.2-${ARCH}.tar.gz"
if [[ "${ARCH}" == 'x86_64' ]]; then
	PATCHELF_PACKAGE_SHA256SUM='2abdc34fbe949c995a1baa4ec310896a085588a45a99cd0d726851bdfac2a4bb'
elif [[ "${ARCH}" == 'aarch64' ]]; then
	PATCHELF_PACKAGE_SHA256SUM='ba6850c1a6f4cbdb050e1cc22fa5239159ad31c43606846e49c408d335f594ff'
fi
PATCHELF_PACKAGE_NAME="patchelf-0.19.2-${ARCH}.tar.gz"

NCURSES_PACKAGE_URL='https://ftpmirror.gnu.org/ncurses/ncurses-6.6.tar.gz'
NCURSES_PACKAGE_SHA256SUM='355b4cbbed880b0381a04c46617b7656e362585d52e9cf84a67e2009b749ff11'
NCURSES_PACKAGE_NAME='ncurses-6.6.tar.gz'
NCURSES_PACKAGE_EXTRACTED_DIR='ncurses-6.6'

READLINE_PACKAGE_URL='https://ftpmirror.gnu.org/readline/readline-8.3.tar.gz'
READLINE_PACKAGE_SHA256SUM='fe5383204467828cd495ee8d1d3c037a7eba1389c22bc6a041f627976f9061cc'
READLINE_PACKAGE_NAME='readline-8.3.tar.gz'
READLINE_PACKAGE_EXTRACTED_DIR='readline-8.3'

LIBFFI_PACKAGE_URL='https://github.com/libffi/libffi/releases/download/v3.8.0/libffi-3.8.0.tar.gz'
LIBFFI_PACKAGE_SHA256SUM='7da3e2d9a171eb0a038f592ecad3ff2bb2550f3496d87b3b29ad0cf4430c0db4'
LIBFFI_PACKAGE_NAME='libffi-3.8.0.tar.gz'
LIBFFI_PACKAGE_EXTRACTED_DIR='libffi-3.8.0'

ZLIB_PACKAGE_URL='https://github.com/madler/zlib/archive/refs/tags/v1.3.2.tar.gz'
ZLIB_PACKAGE_SHA256SUM='b99a0b86c0ba9360ec7e78c4f1e43b1cbdf1e6936c8fa0f6835c0cd694a495a1'
ZLIB_PACKAGE_NAME='zlib-1.3.2.tar.gz'
ZLIB_PACKAGE_EXTRACTED_DIR='zlib-1.3.2'

PERL_PACKAGE_URL='https://www.cpan.org/src/5.0/perl-5.44.0.tar.gz'
PERL_PACKAGE_SHA256SUM='3b855066b92491cb40e86affb1ca57d1a388aa43e51b91c7806a32c2f65f96c3'
PERL_PACKAGE_NAME='perl-5.44.0.tar.gz'
PERL_PACKAGE_EXTRACTED_DIR='perl-5.44.0'

OPENSSL_PACKAGE_URL='https://github.com/openssl/openssl/releases/download/openssl-4.0.3/openssl-4.0.3.tar.gz'
OPENSSL_PACKAGE_SHA256SUM='325b5c806167c13b40b1ffeadfe0248197c00eccc4cf123ec1e28d2d2fd216d9'
OPENSSL_PACKAGE_NAME='openssl-4.0.3.tar.gz'
OPENSSL_PACKAGE_EXTRACTED_DIR='openssl-4.0.3'

CURL_PACKAGE_URL='https://curl.se/download/curl-8.22.0.tar.gz'
CURL_PACKAGE_SHA256SUM='d54dd598bf05927a726deb38df31c6a255ba83ff1de57c5d1464dac3ed8f44a1'
CURL_PACKAGE_NAME='curl-8.22.0.tar.gz'
CURL_PACKAGE_EXTRACTED_DIR='curl-8.22.0'

WGET_PACKAGE_URL='https://ftpmirror.gnu.org/wget/wget2-2.3.0.tar.gz'
WGET_PACKAGE_SHA256SUM='4f1915b2a55a789a15f2f9ada7cc44bca81418e648f76fd88a7f4dd028b2149f'
WGET_PACKAGE_NAME='wget2-2.3.0.tar.gz'
WGET_PACKAGE_EXTRACTED_DIR='wget2-2.3.0'

BZIP2_PACKAGE_URL='https://sourceware.org/pub/bzip2/bzip2-1.0.8.tar.gz'
BZIP2_PACKAGE_SHA256SUM='ab5a03176ee106d3f0fa90e381da478ddae405918153cca248e682cd0c4a2269'
BZIP2_PACKAGE_NAME='bzip2-1.0.8.tar.gz'
BZIP2_PACKAGE_EXTRACTED_DIR='bzip2-1.0.8'

XZ_PACKAGE_URL='https://github.com/tukaani-project/xz/releases/download/v5.8.4/xz-5.8.4.tar.gz'
XZ_PACKAGE_SHA256SUM='0014c7886930454fe8bd4228665b51af55eeae560ea135c9c4cd33f55b2591d9'
XZ_PACKAGE_NAME='xz-5.8.4.tar.gz'
XZ_PACKAGE_EXTRACTED_DIR='xz-5.8.4'

SQLITE_PACKAGE_URL='https://sqlite.org/2026/sqlite-autoconf-3540000.tar.gz'
SQLITE_PACKAGE_SHA256SUM='134ec0802dda5795816e25d25872d20b312cb3973438c49b30bc40b7705ea9ed'
SQLITE_PACKAGE_NAME='sqlite-autoconf-3540000.tar.gz'
SQLITE_PACKAGE_EXTRACTED_DIR='sqlite-autoconf-3540000'

LIBMPDEC_PACKAGE_URL='https://www.bytereef.org/software/mpdecimal/releases/mpdecimal-4.0.1.tar.gz'
LIBMPDEC_PACKAGE_SHA256SUM='96d33abb4bb0070c7be0fed4246cd38416188325f820468214471938545b1ac8'
LIBMPDEC_PACKAGE_NAME='mpdecimal-4.0.1.tar.gz'
LIBMPDEC_PACKAGE_EXTRACTED_DIR='mpdecimal-4.0.1'

LIBUUID_PACKAGE_URL='https://github.com/util-linux/util-linux/archive/refs/tags/v2.42.4.tar.gz'
LIBUUID_PACKAGE_SHA256SUM='e1d38037dab761a2d39114d88a6744ffd5a4576efa29fe41e1dfbd8453891fe7'
LIBUUID_PACKAGE_NAME='util-linux-2.42.4.tar.gz'
LIBUUID_PACKAGE_EXTRACTED_DIR='util-linux-2.42.4'

PYTHON_PACKAGE_URL='https://github.com/python/cpython/archive/refs/tags/v3.15.0.tar.gz'
PYTHON_PACKAGE_SHA256SUM='f8cb0b9a98d5412cab2d207241fec5aa5a09552e33f237c7a06cfe36be8687c4'
PYTHON_PACKAGE_NAME='cpython-3.15.0.tar.gz'
PYTHON_PACKAGE_EXTRACTED_DIR='cpython-3.15.0'

EXPAT_PACKAGE_URL='https://github.com/libexpat/libexpat/releases/download/R_2_9_0/expat-2.9.0.tar.gz'
EXPRT_PACKAGE_SHA256SUM='16afbb9cefead2aa278105cf27d9f597bde7fbf3dbb85015857ca7ca6a4e89ba'
EXPAT_PACKAGE_NAME='expat-2.9.0.tar.gz'
EXPAT_PACKAGE_EXTRACTED_DIR='expat-2.9.0'

GETTEXT_PACKAGE_URL='https://ftpmirror.gnu.org/gettext/gettext-1.0.tar.xz'
GETTEXT_PACKAGE_SHA256SUM='71132a3fb71e68245b8f2ac4e9e97137d3e5c02f415636eb508ae607bc01add7'
GETTEXT_PACKAGE_NAME='gettext-1.0.tar.xz'
GETTEXT_PACKAGE_EXTRACTED_DIR='gettext-1.0'

GIT_PACKAGE_URL='https://github.com/git/git/archive/refs/tags/v2.56.0.tar.gz'
GIT_PACKAGE_SHA256SUM='d761232b81394f7d4c3ef1a99fa804ffbe10d278ae1ad302833a0892050ca9fc'
GIT_PACKAGE_NAME='git-2.56.0.tar.gz'
GIT_PACKAGE_EXTRACTED_DIR='git-2.56.0'

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

GDB_PACKAGE_URL='https://ftpmirror.gnu.org/gdb/gdb-18.1.tar.gz'
GDB_PACKAGE_SHA256SUM='fb83623deb238cab91ad17f8a906e2da26d0b4620fb1da43c20a274252e51082'
GDB_PACKAGE_NAME='gdb-18.1.tar.gz'
GDB_PACKAGE_EXTRACTED_DIR='gdb-18.1'

NEOVIM_PACKAGE_URL="https://github.com/neovim/neovim/releases/download/v0.12.6/nvim-linux-${ARCH/aarch64/arm64}.tar.gz"
if [[ "${ARCH}" == 'x86_64' ]]; then
	NEOVIM_PACKAGE_SHA256SUM='474430d53e6264f6d6dd18db42d6dc9df3a1b56ca9e88a325bbf860e1a811d87'
else
	NEOVIM_PACKAGE_SHA256SUM='8f1f64a0bdb97247034038c3823c6cbad5bdf9ecd5751b85494b71c3ee04c815'
fi
NEOVIM_PACKAGE_NAME="nvim-linux-${ARCH/aarch64/arm64}.tar.gz"

ZSTD_PACKAGE_URL='https://github.com/facebook/zstd/releases/download/v1.5.7/zstd-1.5.7.tar.gz'
ZSTD_PACKAGE_SHA256SUM='eb33e51f49a15e023950cd7825ca74a4a2b43db8354825ac24fc1b7ee09e6fa3'
ZSTD_PACKAGE_NAME='zstd-1.5.7.tar.gz'
ZSTD_PACKAGE_EXTRACTED_DIR='zstd-1.5.7'

CMAKE_PACKAGE_URL="https://github.com/Kitware/CMake/releases/download/v4.4.4/cmake-4.4.4-linux-${ARCH}.tar.gz"
if [[ "${ARCH}" == 'x86_64' ]]; then
	CMAKE_PACKAGE_SHA256SUM='e5bb807f7728cb60cd8b27ebc97a2edb469b68655f21e844a600c3575b76f5bb'
elif [[ "${ARCH}" == 'aarch64' ]]; then
	CMAKE_PACKAGE_SHA256SUM='a1b6cc63636a0e55c63257cf3315a8a5f129e42fade25db1afea4ff8ab06f25e'
fi
CMAKE_PACKAGE_NAME="cmake-4.4.4-linux-${ARCH}.tar.gz"
CMAKE_PACKAGE_EXTRACTED_DIR="cmake-4.4.4-linux-${ARCH}"

XXHASH_PACKAGE_URL='https://github.com/Cyan4973/xxHash/archive/refs/tags/v0.8.4.tar.gz'
XXHASH_PACKAGE_SHA256SUM='5738270935e7c3d38a79b3adf7c9692566ce7895a25f67de43ad52ab504acd32'
XXHASH_PACKAGE_NAME='xxHash-0.8.4.tar.gz'
XXHASH_PACKAGE_EXTRACTED_DIR='xxHash-0.8.4'

CCACHE_PACKAGE_URL='https://github.com/ccache/ccache/releases/download/v4.14.1/ccache-4.14.1.tar.gz'
CCACHE_PACKAGE_SHA256SUM='dfd2b9e446b2cf68e83e21b25317d8f868de6f1b246c7e99e04d07f4e1b0b97e'
CCACHE_PACKAGE_NAME='ccache-4.14.1.tar.gz'
CCACHE_PACKAGE_EXTRACTED_DIR='ccache-4.14.1'

LIBXML2_PACKAGE_URL='https://github.com/GNOME/libxml2/archive/refs/tags/v2.15.4.tar.gz'
LIBXML2_PACKAGE_SHA256SUM='bb01bd9ac9a7403f9706816fd6d3e7888041d32b0211075feb20e755d2a9f29d'
LIBXML2_PACKAGE_NAME='libxml2-2.15.4.tar.gz'
LIBXML2_PACKAGE_EXTRACTED_DIR='libxml2-2.15.4'

SWIG_PACKAGE_URL='https://downloads.sourceforge.net/project/swig/swig/swig-4.5.1/swig-4.5.1.tar.gz'
SWIG_PACKAGE_SHA256SUM='7fec50b27deddab5455a9633780b6341eddfb96215a7619e93a76eb27178f653'
SWIG_PACKAGE_NAME='swig-4.5.1.tar.gz'
SWIG_PACKAGE_EXTRACTED_DIR='swig-4.5.1'

LIBEDIT_PACKAGE_URL='https://www.thrysoee.dk/editline/libedit-20260512-3.1.tar.gz'
LIBEDIT_PACKAGE_SHA256SUM='432d5e7ea8b0116dd39f2eca7bc11d0eed77faa6b77ea526ace89907c23ea4a0'
LIBEDIT_PACKAGE_NAME='libedit-20260512-3.1.tar.gz'
LIBEDIT_PACKAGE_EXTRACTED_DIR='libedit-20260512-3.1'

LLVM_PACKAGE_URL='https://github.com/llvm/llvm-project/releases/download/llvmorg-23.1.3/llvm-project-23.1.3.src.tar.xz'
LLVM_PACKAGE_SHA256SUM='c44186a7762ed28954be72e5ff6df9808e0779d4f1bf014ecc4e7e211d31ee34'
LLVM_PACKAGE_NAME='llvm-project-23.1.3.src.tar.xz'
LLVM_PACKAGE_EXTRACTED_DIR='llvm-project-23.1.3.src'

ZSH_PACKAGE_URL='https://downloads.sourceforge.net/project/zsh/zsh/5.9.2/zsh-5.9.2.tar.xz'
ZSH_PACKAGE_SHA256SUM='36fa734374b44783582cec09bcd67822e2f992c779ec1624ab5596df078d2f81'
ZSH_PACKAGE_NAME='zsh-5.9.2.tar.xz'
ZSH_PACKAGE_EXTRACTED_DIR='zsh-5.9.2'
