#!/bin/bash

set -e

declare -r CMD="${BASH_SOURCE[0]}"
WORKSPACE_PATH="$(dirname "$(readlink -f "${CMD}")")"
declare -r WORKSPACE_PATH

declare -r PACKAGES_PATH="${WORKSPACE_PATH}/packages"

declare -r BINUTILS_PACKAGE_URL='https://ftpmirror.gnu.org/binutils/binutils-2.44.tar.xz'
declare -r BINUTILS_MD5SUM='49912ce774666a30806141f106124294'

declare -r LINUX_PACKAGE_URL='https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-6.14.4.tar.xz'
declare -r LINUX_MD5SUM='c8e750100a5fc02bb856539ff9b9a41f'

declare -r GLIBC_PACKAGE_URL='https://ftpmirror.gnu.org/glibc/glibc-2.41.tar.xz'
declare -r GLIBC_MD5SUM='19862601af60f73ac69e067d3e9267d4'

declare -r GCC_PACKAGE_URL='https://ftpmirror.gnu.org/gcc/gcc-15.1.0/gcc-15.1.0.tar.xz'
declare -r GCC_MD5SUM='e55d13c55428bca27b4d2ea02f883135'

declare -r LIBXCRYPT_PACKAGE_URL='https://github.com/besser82/libxcrypt/releases/download/v4.4.38/libxcrypt-4.4.38.tar.xz'
declare -r LIBXCRYPT_MD5SUM='1796a5d20098e9dd9e3f576803c83000'

declare -r MUSL_OBSTACK_URL='https://github.com/void-linux/musl-obstack/archive/refs/tags/v1.2.3.tar.gz'
declare -r MUSL_OBSTACK_MD5SUM='e4f1d16aa3187e8d071f656dd2b10a9e'
declare -r MUSL_OBSTACK_NAME='musl-obstack-1.2.3.tar.gz'

function log() {
	local level="${1}"
	local message="${2}"
	local date
	date="$(date +'%Y-%m-%d %H:%M:%S')"
	if [[ "${level}" == 'INFO' ]]; then
		level="[\033[32;1m ${level}  \033[0m]"
	elif [[ "${level}" == 'WARNING' ]]; then
		level="[\033[33;1m${level}\033[0m]"
	elif [[ "${level}" == 'ERROR' ]]; then
		level="[\033[31;1m ${level} \033[0m]"
	fi
	echo -e "${level} ${date} - ${message}"
}

function log_info() {
	local message="${1}"
	log 'INFO' "${message}"
}

function log_warning() {
	local message="${1}"
	log 'WARNING' "${message}"
}

function log_error() {
	local message="${1}"
	log 'ERROR' "${message}"
	exit 1
}

function setup_environment() {
	declare -gr PREFIX="${PREFIX:-/compiler}"
	declare -gr CROSS_PREFIX="${PREFIX}/cross"
	declare -gr TARGET="${TARGET:-x86_64-linux-gnu}"
	declare -gr TARGET_PREFIX="${CROSS_PREFIX}/${TARGET}"

	if [[ "${TARGET}" == 'x86_64-linux-gnu' ]]; then
		declare -gr ARCH='x86'
	elif [[ "${TARGET}" == 'aarch64-linux-gnu' ]]; then
		declare -gr ARCH='arm64'
	fi
	export PATH="${PREFIX}/bin:${CROSS_PREFIX}/bin:${PATH}"
}

function show_environment() {
	log_info "Environment Information:"
	log_info "  PREFIX: \033[35;1m${PREFIX}\033[0m"
	log_info "  TARGET: \033[35;1m${TARGET}\033[0m"
	log_info "  ARCH:   \033[35;1m${ARCH}\033[0m"
	log_info "  PATH:   \033[35;1m${PATH}\033[0m"
}

function download() {
	local url="${1}"
	local md5sum="${2}"
	local package="${3:-$(basename "${url}")}"

	mkdir -p "${PACKAGES_PATH}"
	pushd "${PACKAGES_PATH}" >/dev/null

	if [[ ! -f "${package}" ]] || ! echo "${md5sum}  ${package}" | md5sum --check &>/dev/null; then
		log_info "Download ${package} ..."
		curl -L "${url}" -o "${package}"
		log_info "Download ${package} successfully!"
	fi

	popd >/dev/null
}

function download_all() {
	download "${BINUTILS_PACKAGE_URL}" "${BINUTILS_MD5SUM}"
	download "${LINUX_PACKAGE_URL}" "${LINUX_MD5SUM}"
	download "${GLIBC_PACKAGE_URL}" "${GLIBC_MD5SUM}"
	download "${GCC_PACKAGE_URL}" "${GCC_MD5SUM}"
	download "${LIBXCRYPT_PACKAGE_URL}" "${LIBXCRYPT_MD5SUM}"
	download "${MUSL_OBSTACK_URL}" "${MUSL_OBSTACK_MD5SUM}" "${MUSL_OBSTACK_NAME}"
}

function extract_packages() {
	local package

	pushd "${PACKAGES_PATH}" >/dev/null

	find . -mindepth 1 -maxdepth 1 -type d -exec rm -rf {} \;

	for package in *.tar.xz; do
		log_info "Extract ${package} ..."
		tar -Jxf "${package}"
		log_info "Extract ${package} successfully!"
	done

	for package in *.tar.gz; do
		log_info "Extract ${package} ..."
		tar -zxf "${package}"
		log_info "Extract ${package} successfully!"
	done

	popd >/dev/null
}

function build_binutils() {
	local package
	package="$(basename "${BINUTILS_PACKAGE_URL}")"
	pushd "${package/.tar.xz/}" >/dev/null

	mkdir -p "${CROSS_PREFIX}"
	ln -snf .. "${CROSS_PREFIX}/${TARGET}"

	rm -rf build
	mkdir build
	cd build

	../configure --prefix="${CROSS_PREFIX}" \
		--target="${TARGET}" \
		--disable-multilib
	make -j "$(nproc)"
	make install

	popd >/dev/null
}

function build_linux_headers() {
	local package
	package="$(basename "${LINUX_PACKAGE_URL}")"
	pushd "${package/.tar.xz/}" >/dev/null

	make ARCH="${ARCH}" INSTALL_HDR_PATH="${TARGET_PREFIX}" headers_install

	popd >/dev/null
}

function build_gcc_step1() {
	local package
	package="$(basename "${GCC_PACKAGE_URL}")"
	pushd "${package/.tar.xz/}" >/dev/null

	contrib/download_prerequisites
	mkdir -p "${TARGET_PREFIX}/lib"
	ln -snf "lib" "${TARGET_PREFIX}/lib64"

	rm -rf build
	mkdir build
	cd build

	../configure --prefix="${CROSS_PREFIX}" \
		--target="${TARGET}" \
		--libdir="${TARGET_PREFIX}/lib" \
		--libexecdir="${TARGET_PREFIX}/libexec" \
		--with-local-prefix="${TARGET_PREFIX}" \
		--with-gxx-include-dir="${TARGET_PREFIX}/include/c++" \
		--enable-languages=c,c++ \
		--enable-default-pie \
		--disable-multilib \
		--disable-libssp \
		--disable-threads \
		--disable-libatomic \
		--disable-libffi \
		--disable-libgomp \
		--disable-libitm \
		--disable-libquadmath \
		--disable-libquadmath-support \
		--disable-libsanitizer \
		--disable-fixincludes \
		--disable-bootstrap
	make -j "$(nproc)" all-gcc
	make install-gcc

	popd >/dev/null
}

function build_gcc_step2() {
	local package
	package="$(basename "${GCC_PACKAGE_URL}")"
	pushd "${package/.tar.xz/}" >/dev/null

	cd build

	make -j "$(nproc)" all-target-libgcc
	make install-target-libgcc

	popd >/dev/null
}

function build_gcc_step3() {
	local package
	package="$(basename "${GCC_PACKAGE_URL}")"
	pushd "${package/.tar.xz/}" >/dev/null

	cd build

	make -j "$(nproc)"
	make install

	popd >/dev/null
}

function build_glibc_step1() {
	local package
	package="$(basename "${GLIBC_PACKAGE_URL}")"
	pushd "${package/.tar.xz/}" >/dev/null

	rm -rf build
	mkdir build
	cd build

	../configure --prefix="${TARGET_PREFIX}" \
		--build="${MACHTYPE}" \
		--host="${TARGET}" \
		--target="${TARGET}" \
		--with-headers="${TARGET_PREFIX}"/include \
		--disable-multilib \
		--disable-timezone-tools \
		libc_cv_forced_unwind=yes
	make install-bootstrap-headers=yes install-headers
	make -j "$(nproc)" csu/subdir_lib
	install csu/crt1.o csu/crti.o csu/crtn.o "${TARGET_PREFIX}"/lib
	"${TARGET}-gcc" -nostdlib -nostartfiles -shared -x c /dev/null -o "${TARGET_PREFIX}"/lib/libc.so
	touch "${TARGET_PREFIX}"/include/gnu/stubs.h

	popd >/dev/null
}

function build_glibc_step2() {
	local package
	package="$(basename "${GLIBC_PACKAGE_URL}")"
	pushd "${package/.tar.xz/}" >/dev/null

	cd build

	make -j "$(nproc)"
	make install

	popd >/dev/null
}

function build_cross_toolchain() {
	build_binutils
	build_linux_headers
	build_gcc_step1
	build_glibc_step1
	build_gcc_step2
	build_glibc_step2
	build_gcc_step3
}

function build_binutils_final() {
	local package
	package="$(basename "${BINUTILS_PACKAGE_URL}")"
	pushd "${package/.tar.xz/}" >/dev/null

	rm -rf build
	mkdir build
	cd build

	LDFLAGS="-L${PREFIX}/lib -Wl,-rpath,${PREFIX}/lib \
        -Wl,-dynamic-linker,$(find "${PREFIX}/lib" -name 'ld-linux-*')" \
		../configure --prefix="${PREFIX}" \
		--host="${TARGET}" \
		--enable-plugins \
		--disable-multilib \
		--with-sysroot=/
	make -j "$(nproc)"
	make install-strip

	# Remove the old files
	rm -rf "${PREFIX}/lib/ldscripts"

	popd >/dev/null
}

function build_gcc_final() {
	local package
	package="$(basename "${GCC_PACKAGE_URL}")"
	pushd "${package/.tar.xz/}" >/dev/null

	rm -rf build
	mkdir build
	cd build

	ldflags="-L${PREFIX}/lib -Wl,-rpath,${PREFIX}/lib \
        -Wl,-dynamic-linker,$(find "${PREFIX}/lib" -name 'ld-linux-*')"

	LDFLAGS="${ldflags}" LDFLAGS_FOR_TARGET="${ldflags}" \
		../configure --prefix="${PREFIX}" \
		--host="${TARGET}" \
		--with-local-prefix="${PREFIX}" \
		--enable-languages=c,c++ \
		--enable-default-pie \
		--disable-multilib \
		--disable-fixincludes

	make BOOT_LDFLAGS="${ldflags}" -j "$(nproc)"

	# Remove the old files
	rm -r "${PREFIX}/include/c++"

	make install-strip

	popd >/dev/null
}

function build_glibc_final() {
	local package
	package="$(basename "${GLIBC_PACKAGE_URL}")"
	pushd "${package/.tar.xz/}" >/dev/null

	rm -rf build
	mkdir build
	cd build

	../configure --prefix="${PREFIX}" \
		--with-headers="${PREFIX}"/include \
		--disable-multilib \
		--disable-timezone-tools
	make -j "$(nproc)"
	make install

	popd >/dev/null
}

function build_libxcrypt() {
	local package
	package="$(basename "${LIBXCRYPT_PACKAGE_URL}")"
	pushd "${package/.tar.xz/}" >/dev/null

	rm -rf build
	mkdir build
	cd build

	../configure --prefix="${PREFIX}"
	make -j "$(nproc)"
	make install

	rm -rf "${PREFIX}/lib/pkgconfig"

	popd >/dev/null
}

function build_musl_obstack() {
	local package="${MUSL_OBSTACK_NAME}"
	pushd "${package/.tar.gz/}" >/dev/null

	./bootstrap.sh

	rm -rf build
	mkdir build
	cd build

	../configure --prefix="${PREFIX}"
	make -j "$(nproc)"
	make install

	rm -rf "${PREFIX}/lib/pkgconfig"

	popd >/dev/null
}

function build_final_toolchain() {
	build_binutils_final
	build_gcc_final
	build_glibc_final
}

function build_all() {
	pushd "${PACKAGES_PATH}" >/dev/null

	build_cross_toolchain
	build_final_toolchain
	build_libxcrypt
	build_musl_obstack

	popd >/dev/null
}

function main() {
	setup_environment
	show_environment

	download_all
	extract_packages
	build_all

	# Remove the cross toolchain
	rm -rf "${CROSS_PREFIX}"
}

main "${@}"
