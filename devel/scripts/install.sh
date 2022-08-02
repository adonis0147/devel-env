#!/bin/bash

set -e

declare -r CMD="${BASH_SOURCE[0]}"
SCRIPTS_PATH="$(dirname "$(readlink -f "${CMD}")")"
declare -r SCRIPTS_PATH
declare -r INSTALL_TOOLCHAIN_SCRIPT="${SCRIPTS_PATH}/install_toolchain.sh"
DOWNLOADS_PATH="$(readlink -f "${SCRIPTS_PATH}/../downloads")"
declare -r DOWNLOADS_PATH

NUM_CORES="$(nproc)"
declare -r NUM_CORES
declare -r INTERPRETER='ld-linux-x86-64.so.2'
declare -r LIBC_SO='libc.so.6'

source "${SCRIPTS_PATH}/common.sh"
source "${SCRIPTS_PATH}/env_vars.sh"
# shellcheck source-path=SCRIPTDIR/../../devel/downloads
source "${DOWNLOADS_PATH}/packages.sh"

function install_toolchain() {
	log_info 'Installing the toolchain...'
	if [[ ! -d "${DEVEL_HOME_PATH}/compiler" ]]; then
		if [[ ! -f "${INSTALL_TOOLCHAIN_SCRIPT}" ]]; then
			log_error "Failed to install the toolchain: \033[34;1m${INSTALL_TOOLCHAIN_SCRIPT}\033[0m doesn't exist."
		fi
		bash "${INSTALL_TOOLCHAIN_SCRIPT}" "${DEVEL_HOME_PATH}"
	fi
	log_info 'Success!'
}

function setup_package() {
	local package="${1}"
	"${SCRIPTS_PATH}/setup_package.sh" "${package}"
}

function install_autoconf() {
	local package='autoconf'
	log_info "Start to install ${package}."
	rm -rf "${AUTOCONF_PACKAGE_EXTRACTED_DIR}" && tar -zxvf "${AUTOCONF_PACKAGE_NAME}"

	pushd "${AUTOCONF_PACKAGE_EXTRACTED_DIR}" >/dev/null
	mkdir -p build
	cd build
	../configure --prefix="${DEVEL_HOME_PATH}/opt/${package}"
	make -j "${NUM_CORES}"
	make install
	popd >/dev/null
	setup_package "${package}"

	log_info 'Success!'
}

function install_automake() {
	local package='automake'
	log_info "Start to install ${package}."
	rm -rf "${AUTOMAKE_PACKAGE_EXTRACTED_DIR}" && tar -zxvf "${AUTOMAKE_PACKAGE_NAME}"

	pushd "${AUTOMAKE_PACKAGE_EXTRACTED_DIR}" >/dev/null
	mkdir build
	cd build
	../configure --prefix="${DEVEL_HOME_PATH}/opt/${package}"
	make -j "${NUM_CORES}"
	make install
	popd >/dev/null
	setup_package "${package}"

	log_info 'Success!'
}

function install_libtool() {
	local package='libtool'
	log_info "Start to install ${package}."
	rm -rf "${LIBTOOL_PACKAGE_EXTRACTED_DIR}" && tar -zxvf "${LIBTOOL_PACKAGE_NAME}"

	pushd "${LIBTOOL_PACKAGE_EXTRACTED_DIR}" >/dev/null
	mkdir build
	cd build
	../configure --prefix="${DEVEL_HOME_PATH}/opt/${package}"
	make -j "${NUM_CORES}"
	make install
	popd >/dev/null
	setup_package "${package}"

	log_info 'Success!'
}

function install_make() {
	local package='make'
	log_info "Start to install ${package}."
	rm -rf "${MAKE_PACKAGE_EXTRACTED_DIR}" && tar -zxvf "${MAKE_PACKAGE_NAME}"

	pushd "${MAKE_PACKAGE_EXTRACTED_DIR}" >/dev/null
	mkdir build
	cd build
	../configure --prefix="${DEVEL_HOME_PATH}/opt/${package}"
	make -j "${NUM_CORES}"
	make install
	popd >/dev/null
	setup_package "${package}"

	log_info 'Success!'
}

function install_pkg_config() {
	local package='pkg-config'
	log_info "Start to install ${package}."
	rm -rf "${PKG_CONFIG_PACKAGE_EXTRACTED_DIR}" && tar -zxvf "${PKG_CONFIG_PACKAGE_NAME}"

	pushd "${PKG_CONFIG_PACKAGE_EXTRACTED_DIR}" >/dev/null
	mkdir build
	cd build
	../configure --prefix="${DEVEL_HOME_PATH}/opt/${package}" --with-internal-glib
	make -j "${NUM_CORES}"
	make install
	popd >/dev/null
	setup_package "${package}"

	log_info 'Success!'
}

function install_patchelf() {
	local package='patchelf'
	log_info "Start to install ${package}."

	local install_path="${DEVEL_HOME_PATH}/opt/patchelf"
	rm -rf "${install_path}" && mkdir -p "${install_path}"
	tar -zxvf "${PATCHELF_PACKAGE_NAME}" -C "${install_path}"
	setup_package "${package}"

	log_info 'Success!'
}

function install_ncurses() {
	local package='ncurses'
	log_info "Start to install ${package}."
	rm -rf "${NCURSES_PACKAGE_EXTRACTED_DIR}" && tar -zxvf "${NCURSES_PACKAGE_NAME}"

	pushd "${NCURSES_PACKAGE_EXTRACTED_DIR}" >/dev/null
	mkdir build
	cd build
	../configure --prefix="${DEVEL_HOME_PATH}/opt/${package}" --enable-widec --with-shared --with-termlib
	make -j "${NUM_CORES}"
	make install
	popd >/dev/null
	setup_package "${package}"
	ln -snf "${DEVEL_HOME_PATH}/include/ncursesw" "${DEVEL_HOME_PATH}/include/ncurses"

	log_info 'Success!'
}

function install_readline() {
	local package='readline'
	log_info "Start to install ${package}."
	rm -rf "${READLINE_PACKAGE_EXTRACTED_DIR}" && tar -zxvf "${READLINE_PACKAGE_NAME}"

	pushd "${READLINE_PACKAGE_EXTRACTED_DIR}" >/dev/null
	mkdir build
	cd build
	../configure --prefix="${DEVEL_HOME_PATH}/opt/${package}"
	make SHLIB_LIBS="-Wl,-rpath,${DEVEL_HOME_PATH}/lib -L${DEVEL_HOME_PATH}/lib -ltinfow" \
		-j "${NUM_CORES}"
	make install
	popd >/dev/null
	setup_package "${package}"

	log_info 'Success!'
}

function install_libffi() {
	local package='libffi'
	log_info "Start to install ${package}."
	rm -rf "${LIBFFI_PACKAGE_EXTRACTED_DIR}" && tar -zxvf "${LIBFFI_PACKAGE_NAME}"

	pushd "${LIBFFI_PACKAGE_EXTRACTED_DIR}" >/dev/null
	mkdir build
	cd build
	../configure --prefix="${DEVEL_HOME_PATH}/opt/${package}"
	make -j "${NUM_CORES}"
	make install
	popd >/dev/null
	setup_package "${package}"

	log_info 'Success!'
}

function install_zlib() {
	local package='zlib'
	log_info "Start to install ${package}."
	rm -rf "${ZLIB_PACKAGE_EXTRACTED_DIR}" && tar -zxvf "${ZLIB_PACKAGE_NAME}"

	pushd "${ZLIB_PACKAGE_EXTRACTED_DIR}" >/dev/null
	mkdir build
	cd build
	../configure --prefix="${DEVEL_HOME_PATH}/opt/${package}"
	make -j "${NUM_CORES}"
	make install
	popd >/dev/null
	setup_package "${package}"

	log_info 'Success!'
}

function install_openssl() {
	local package='openssl'
	log_info "Start to install ${package}."
	rm -rf "${OPENSSL_PACKAGE_EXTRACTED_DIR}" && tar -zxvf "${OPENSSL_PACKAGE_NAME}"

	pushd "${OPENSSL_PACKAGE_EXTRACTED_DIR}" >/dev/null
	mkdir build
	cd build
	../config --prefix="${DEVEL_HOME_PATH}/opt/${package}"
	make -j "${NUM_CORES}"
	make install
	popd >/dev/null
	setup_package "${package}"

	log_info 'Success'
}

function install_curl() {
	local package='curl'
	log_info "Start to install ${package}."
	rm -rf "${CURL_PACKAGE_EXTRACTED_DIR}" && tar -zxvf "${CURL_PACKAGE_NAME}"

	pushd "${CURL_PACKAGE_EXTRACTED_DIR}" >/dev/null
	mkdir build
	cd build
	LDFLAGS="-Wl,-rpath,${DEVEL_HOME_PATH}/lib" ../configure --prefix="${DEVEL_HOME_PATH}/opt/${package}" \
		--with-openssl="${DEVEL_HOME_PATH}/opt/openssl"
	make -j "${NUM_CORES}"
	make install
	popd >/dev/null
	setup_package "${package}"

	log_info 'Success!'
}

function install_wget() {
	local package='wget'
	log_info "Start to install ${package}."
	rm -rf "${WGET_PACKAGE_EXTRACTED_DIR}" && tar -zxvf "${WGET_PACKAGE_NAME}"

	pushd "${WGET_PACKAGE_EXTRACTED_DIR}" >/dev/null
	mkdir build
	cd build
	LDFLAGS="-Wl,-rpath,${DEVEL_HOME_PATH}/lib" \
		../configure --prefix="${DEVEL_HOME_PATH}/opt/${package}" \
		--with-ssl=openssl --with-libssl-prefix="${DEVEL_HOME_PATH}/opt/openssl"
	make -j "${NUM_CORES}"
	make install
	popd >/dev/null
	setup_package "${package}"

	log_info 'Success!'
}

function install_bzip2() {
	local package='bzip2'
	log_info "Start to install ${package}."
	rm -rf "${BZIP2_PACKAGE_EXTRACTED_DIR}" && tar -zxvf "${BZIP2_PACKAGE_NAME}"

	pushd "${BZIP2_PACKAGE_EXTRACTED_DIR}" >/dev/null
	make install PREFIX="${DEVEL_HOME_PATH}/opt/${package}" -j "${NUM_CORES}"
	make clean
	make -f Makefile-libbz2_so
	mv libbz2.so* "${DEVEL_HOME_PATH}/opt/${package}/lib"
	cd "${DEVEL_HOME_PATH}/opt/${package}/lib"
	ln -s libbz2.so.1.0 libbz2.so
	popd >/dev/null
	setup_package "${package}"

	log_info 'Success!'
}

function install_python() {
	local package='python'
	log_info "Start to install ${package}."
	rm -rf "${PYTHON_PACKAGE_EXTRACTED_DIR}" && tar -zxvf "${PYTHON_PACKAGE_NAME}"

	pushd "${PYTHON_PACKAGE_EXTRACTED_DIR}" >/dev/null
	mkdir build
	cd build
	CFLAGS="-DHAVE_NCURSES_H -DHAVE_NCURSESW -I${DEVEL_HOME_PATH}/include/ncursesw" \
		LDFLAGS="-Wl,-rpath,${DEVEL_HOME_PATH}/lib -L${DEVEL_HOME_PATH}/lib" \
		LIBS='-ltinfow -lncursesw' \
		../configure --prefix="${DEVEL_HOME_PATH}/opt/${package}" \
		--with-openssl="${DEVEL_HOME_PATH}/opt/openssl" --enable-shared --enable-optimizations
	make -j "${NUM_CORES}"
	make install
	cd "${DEVEL_HOME_PATH}/bin"
	ln -s python3 python
	ln -s python3-config python-config
	ln -s pip3 pip
	popd >/dev/null
	setup_package "${package}"

	log_info 'Success!'
}

function install_expat() {
	local package='expat'
	log_info "Start to install ${package}."
	rm -rf "${EXPAT_PACKAGE_EXTRACTED_DIR}" && tar -zxvf "${EXPAT_PACKAGE_NAME}"

	pushd "${EXPAT_PACKAGE_EXTRACTED_DIR}" >/dev/null
	mkdir build
	cd build
	../configure --prefix="${DEVEL_HOME_PATH}/opt/${package}" --without-docbook
	make -j "${NUM_CORES}"
	make install
	popd >/dev/null
	setup_package "${package}"

	log_info 'Success!'
}

function install_git() {
	local package='git'
	log_info "Start to install ${package}."
	rm -rf "${GIT_PACKAGE_EXTRACTED_DIR}" && tar -zxvf "${GIT_PACKAGE_NAME}"

	pushd "${GIT_PACKAGE_EXTRACTED_DIR}" >/dev/null
	make configure
	LDFLAGS="-Wl,-rpath,${DEVEL_HOME_PATH}/lib -L${DEVEL_HOME_PATH}/lib" \
		./configure --prefix="${DEVEL_HOME_PATH}/opt/git" --with-openssl="${DEVEL_HOME_PATH}/opt/openssl"
	make -j "${NUM_CORES}"
	make install
	popd >/dev/null
	setup_package "${package}"

	log_info 'Success!'
}

function install_gmp() {
	local package='gmp'
	log_info "Start to install ${package}."
	rm -rf "${GMP_PACKAGE_EXTRACTED_DIR}" && tar -xvf "${GMP_PACKAGE_NAME}"

	pushd "${GMP_PACKAGE_EXTRACTED_DIR}" >/dev/null
	mkdir build
	cd build
	../configure --prefix="${DEVEL_HOME_PATH}/opt/${package}"
	make -j "${NUM_CORES}"
	make install
	popd >/dev/null
	setup_package "${package}"

	log_info 'Success!'
}

function install_gdb() {
	local package='gdb'
	log_info "Start to install ${package}."
	rm -rf "${GDB_PACKAGE_EXTRACTED_DIR}" && tar -zxvf "${GDB_PACKAGE_NAME}"

	pushd "${GDB_PACKAGE_EXTRACTED_DIR}" >/dev/null
	mkdir build
	cd build
	CFLAGS="-I${DEVEL_HOME_PATH}/include/python3.10" \
		LDFLAGS="-Wl,-rpath,${DEVEL_HOME_PATH}/lib -L${DEVEL_HOME_PATH}/lib" \
		LIBS='-lpython3' \
		../configure --prefix="${DEVEL_HOME_PATH}/opt/${package}" --with-gmp="${DEVEL_HOME_PATH}/opt/gmp"
	make -j "${NUM_CORES}"
	make install
	popd >/dev/null
	setup_package "${package}"

	log_info 'Success!'
}

function install_neovim() {
	local package='neovim'
	log_info "Start to install ${package}."

	local install_path="${DEVEL_HOME_PATH}/opt/neovim"
	rm -rf "${install_path}" && mkdir -p "${install_path}"
	tar -zxvf "${NEOVIM_PACKAGE_NAME}" --strip-components=1 -C "${install_path}"
	local interpreter
	interpreter="$(find "${DEVEL_HOME_PATH}/compiler" -name "${INTERPRETER}")"
	local libc_so
	libc_so="$(find "${DEVEL_HOME_PATH}/compiler" -name "${LIBC_SO}")"
	patchelf --set-rpath "$(dirname "${libc_so}")" "${install_path}/bin/nvim"
	patchelf --set-interpreter "${interpreter}" "${install_path}/bin/nvim"
	setup_package "${package}"

	log_info 'Success!'
}

function install_zstd() {
	local package='zstd'
	log_info "Start to install ${package}."
	rm -rf "${ZSTD_PACKAGE_EXTRACTED_DIR}" && tar -zxvf "${ZSTD_PACKAGE_NAME}"

	pushd "${ZSTD_PACKAGE_EXTRACTED_DIR}" >/dev/null
	make -j "${NUM_CORES}" install PREFIX="${DEVEL_HOME_PATH}/opt/zstd"
	popd >/dev/null
	setup_package "${package}"

	log_info 'Success!'
}

function install_ccache() {
	local package='ccache'
	log_info "Start to install ${package}."
	rm -rf "${CCACHE_PACKAGE_EXTRACTED_DIR}" && tar -zxvf "${CCACHE_PACKAGE_NAME}"

	pushd "${CCACHE_PACKAGE_EXTRACTED_DIR}" >/dev/null
	mkdir build
	cd build
	cmake -DCMAKE_INSTALL_RPATH="${DEVEL_HOME_PATH}/lib" \
		-DCMAKE_INSTALL_PREFIX="${DEVEL_HOME_PATH}/opt/ccache" \
		-DZSTD_INCLUDE_DIR="${DEVEL_HOME_PATH}/opt/zstd/include" \
		-DZSTD_LIBRARY="${DEVEL_HOME_PATH}/opt/zstd/lib/libzstd.so" \
		-DREDIS_STORAGE_BACKEND=OFF ..
	make -j "${NUM_CORES}"
	make install
	popd >/dev/null
	setup_package "${package}"

	log_info 'Success!'
}

function install_packages() {
	pushd "${DOWNLOADS_PATH}/packages" >/dev/null
	install_autoconf
	install_automake
	install_libtool
	install_make
	install_pkg_config
	install_patchelf
	install_ncurses
	install_readline
	install_libffi
	install_zlib
	install_openssl
	install_curl
	install_wget
	install_bzip2
	install_python
	install_expat
	install_git
	install_gmp
	install_gdb
	install_neovim
	install_zstd
	install_ccache
	popd >/dev/null
}

function main() {
	# prepare
	mkdir -p "${DEVEL_HOME_PATH}/lib"
	ln -snf "${DEVEL_HOME_PATH}/lib" "${DEVEL_HOME_PATH}/lib64"

	install_toolchain
	install_packages

	local message='Before using the packages, please run the following command first:\n\n'
	message+="\t\033[32;1msource ${SCRIPTS_PATH}/env_vars.sh\033[0m\n"
	log_info "${message}"
}

main "${@}"
