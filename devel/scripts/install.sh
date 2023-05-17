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
declare -r INTERPRETER='ld-linux-*.so.*'
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

function install_m4() {
	local package='m4'
	log_info "Start to install ${package}."
	rm -rf "${M4_PACKAGE_EXTRACTED_DIR}"
	tar -xvf "${M4_PACKAGE_NAME}"

	pushd "${M4_PACKAGE_EXTRACTED_DIR}" >/dev/null
	mkdir -p build
	cd build
	../configure --prefix="${DEVEL_HOME_PATH}/opt/${package}"
	make -j "${NUM_CORES}"
	make install
	popd >/dev/null
	setup_package "${package}"

	log_info 'Success!'
}

function install_autoconf() {
	local package='autoconf'
	log_info "Start to install ${package}."
	rm -rf "${AUTOCONF_PACKAGE_EXTRACTED_DIR}"
	tar -zxvf "${AUTOCONF_PACKAGE_NAME}"

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
	rm -rf "${AUTOMAKE_PACKAGE_EXTRACTED_DIR}"
	tar -zxvf "${AUTOMAKE_PACKAGE_NAME}"

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
	rm -rf "${LIBTOOL_PACKAGE_EXTRACTED_DIR}"
	tar -zxvf "${LIBTOOL_PACKAGE_NAME}"

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
	rm -rf "${MAKE_PACKAGE_EXTRACTED_DIR}"
	tar -zxvf "${MAKE_PACKAGE_NAME}"

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
	rm -rf "${PKG_CONFIG_PACKAGE_EXTRACTED_DIR}"
	tar -zxvf "${PKG_CONFIG_PACKAGE_NAME}"

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

function install_ninja() {
	local package='ninja'
	log_info "Start to install ${package}."
	rm -rf "${NINJA_PACKAGE_EXTRACTED_DIR}"
	tar -zxvf "${NINJA_PACKAGE_NAME}"

	pushd "${NINJA_PACKAGE_EXTRACTED_DIR}" >/dev/null
	mkdir build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX="${DEVEL_HOME_PATH}/opt/${package}" ..
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
	rm -rf "${install_path}"
	mkdir -p "${install_path}"
	tar -zxvf "${PATCHELF_PACKAGE_NAME}" -C "${install_path}"
	setup_package "${package}"

	log_info 'Success!'
}

function install_ncurses() {
	local package='ncurses'
	log_info "Start to install ${package}."
	rm -rf "${NCURSES_PACKAGE_EXTRACTED_DIR}"
	tar -zxvf "${NCURSES_PACKAGE_NAME}"

	pushd "${NCURSES_PACKAGE_EXTRACTED_DIR}" >/dev/null
	mkdir build
	cd build

	# Install libncursesw
	../configure --prefix="${DEVEL_HOME_PATH}/opt/${package}" --enable-widec --with-shared --with-termlib
	make -j "${NUM_CORES}"
	make install.libs

	# Install ncurses
	rm -rf ./*
	../configure --prefix="${DEVEL_HOME_PATH}/opt/${package}" --with-shared --with-termlib
	make -j "${NUM_CORES}"
	make install

	popd >/dev/null
	setup_package "${package}"

	log_info 'Success!'
}

function install_readline() {
	local package='readline'
	log_info "Start to install ${package}."
	rm -rf "${READLINE_PACKAGE_EXTRACTED_DIR}"
	tar -zxvf "${READLINE_PACKAGE_NAME}"

	pushd "${READLINE_PACKAGE_EXTRACTED_DIR}" >/dev/null
	mkdir build
	cd build
	../configure --prefix="${DEVEL_HOME_PATH}/opt/${package}"
	make SHLIB_LIBS='-ltinfow' -j "${NUM_CORES}"
	make install
	popd >/dev/null
	setup_package "${package}"

	log_info 'Success!'
}

function install_libffi() {
	local package='libffi'
	log_info "Start to install ${package}."
	rm -rf "${LIBFFI_PACKAGE_EXTRACTED_DIR}"
	tar -zxvf "${LIBFFI_PACKAGE_NAME}"

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
	rm -rf "${ZLIB_PACKAGE_EXTRACTED_DIR}"
	tar -zxvf "${ZLIB_PACKAGE_NAME}"

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

function install_libdb() {
	local package='libdb'
	log_info "Start to install ${package}."
	rm -rf "${BERKELEY_DB_PACKAGE_EXTRACTED_DIR}"
	tar -zxvf "${BERKELEY_DB_PACKAGE_NAME}"

	pushd "${BERKELEY_DB_PACKAGE_EXTRACTED_DIR}" >/dev/null
	mkdir build
	cd build
	../dist/configure --prefix="${DEVEL_HOME_PATH}/opt/${package}" --with-repmgr-ssl=no
	make -j "${NUM_CORES}"
	make install_include install_lib
	popd >/dev/null
	setup_package "${package}"

	log_info 'Success!'
}

function install_perl() {
	local package='perl'
	log_info "Start to install ${package}."
	rm -rf "${PERL_PACKAGE_EXTRACTED_DIR}"
	tar -zxvf "${PERL_PACKAGE_NAME}"

	pushd "${PERL_PACKAGE_EXTRACTED_DIR}" >/dev/null
	./Configure -des -Dprefix="${DEVEL_HOME_PATH}/opt/${package}" \
		-Dlibpth="${DEVEL_HOME_PATH}/lib ${DEVEL_HOME_PATH}/compiler/lib"
	make
	make install
	popd >/dev/null
	setup_package "${package}"

	log_info 'Success!'
}

function install_openssl() {
	local package='openssl'
	log_info "Start to install ${package}."
	rm -rf "${OPENSSL_PACKAGE_EXTRACTED_DIR}"
	tar -zxvf "${OPENSSL_PACKAGE_NAME}"

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
	rm -rf "${CURL_PACKAGE_EXTRACTED_DIR}"
	tar -zxvf "${CURL_PACKAGE_NAME}"

	pushd "${CURL_PACKAGE_EXTRACTED_DIR}" >/dev/null
	mkdir build
	cd build
	../configure --prefix="${DEVEL_HOME_PATH}/opt/${package}" --with-openssl="${DEVEL_HOME_PATH}/opt/openssl"
	make -j "${NUM_CORES}"
	make install
	popd >/dev/null
	setup_package "${package}"

	log_info 'Success!'
}

function install_wget() {
	local package='wget'
	log_info "Start to install ${package}."
	rm -rf "${WGET_PACKAGE_EXTRACTED_DIR}"
	tar -zxvf "${WGET_PACKAGE_NAME}"

	pushd "${WGET_PACKAGE_EXTRACTED_DIR}" >/dev/null
	mkdir build
	cd build
	../configure --prefix="${DEVEL_HOME_PATH}/opt/${package}" \
		--with-ssl=openssl --with-libssl-prefix="${DEVEL_HOME_PATH}/opt/openssl" \
		--without-libpcre --without-libidn
	make -j "${NUM_CORES}"
	make install
	popd >/dev/null
	setup_package "${package}"

	ln -snf wget2 "${DEVEL_HOME_PATH}/bin/wget"

	log_info 'Success!'
}

function install_bzip2() {
	local package='bzip2'
	log_info "Start to install ${package}."
	rm -rf "${BZIP2_PACKAGE_EXTRACTED_DIR}"
	tar -zxvf "${BZIP2_PACKAGE_NAME}"

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

function install_xz() {
	local package='xz'
	log_info "Start to install ${package}."
	rm -rf "${XZ_PACKAGE_EXTRACTED_DIR}"
	tar -zxvf "${XZ_PACKAGE_NAME}"

	pushd "${XZ_PACKAGE_EXTRACTED_DIR}" >/dev/null
	mkdir build
	cd build
	../configure --prefix="${DEVEL_HOME_PATH}/opt/${package}"
	make -j "${NUM_CORES}"
	make install
	popd >/dev/null
	setup_package "${package}"

	log_info 'Success!'
}

function install_sqlite() {
	local package='sqlite'
	log_info "Start to install ${package}."
	rm -rf "${SQLITE_PACKAGE_EXTRACTED_DIR}"
	tar -zxvf "${SQLITE_PACKAGE_NAME}"

	pushd "${SQLITE_PACKAGE_EXTRACTED_DIR}" >/dev/null
	mkdir build
	cd build
	../configure --prefix="${DEVEL_HOME_PATH}/opt/${package}"
	make -j "${NUM_CORES}"
	make install
	popd >/dev/null
	setup_package "${package}"

	log_info 'Success!'
}

function install_python() {
	local package='python'
	log_info "Start to install ${package}."
	rm -rf "${PYTHON_PACKAGE_EXTRACTED_DIR}"
	tar -zxvf "${PYTHON_PACKAGE_NAME}"

	pushd "${PYTHON_PACKAGE_EXTRACTED_DIR}" >/dev/null
	mkdir build
	cd build
	CFLAGS="-I${DEVEL_HOME_PATH}/include/ncursesw" \
		LDFLAGS="-L${DEVEL_HOME_PATH}/lib" \
		../configure --prefix="${DEVEL_HOME_PATH}/opt/${package}" \
		--with-openssl="${DEVEL_HOME_PATH}/opt/openssl" --enable-shared --enable-optimizations
	make -j "${NUM_CORES}"
	make install
	cd "${DEVEL_HOME_PATH}/bin"
	ln -snf python3 python
	ln -snf python3-config python-config
	ln -snf pip3 pip
	popd >/dev/null
	setup_package "${package}"

	log_info 'Success!'
}

function install_expat() {
	local package='expat'
	log_info "Start to install ${package}."
	rm -rf "${EXPAT_PACKAGE_EXTRACTED_DIR}"
	tar -zxvf "${EXPAT_PACKAGE_NAME}"

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
	rm -rf "${GIT_PACKAGE_EXTRACTED_DIR}"
	tar -zxvf "${GIT_PACKAGE_NAME}"

	pushd "${GIT_PACKAGE_EXTRACTED_DIR}" >/dev/null
	make configure
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
	rm -rf "${GMP_PACKAGE_EXTRACTED_DIR}"
	tar -xvf "${GMP_PACKAGE_NAME}"

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
	rm -rf "${GDB_PACKAGE_EXTRACTED_DIR}"
	tar -zxvf "${GDB_PACKAGE_NAME}"

	pushd "${GDB_PACKAGE_EXTRACTED_DIR}" >/dev/null
	mkdir build
	cd build
	LDFLAGS='-ltinfow -lncursesw' \
		../configure --prefix="${DEVEL_HOME_PATH}/opt/${package}" --with-gmp="${DEVEL_HOME_PATH}/opt/gmp"
	make -j "${NUM_CORES}"
	make install

	cd "${DEVEL_HOME_PATH}/bin"
	ln -snf ../opt/"${package}/bin"/* "${DEVEL_HOME_PATH}/bin/"
	popd >/dev/null

	log_info 'Success!'
}

function install_neovim() {
	local package='neovim'
	log_info "Start to install ${package}."

	local install_path="${DEVEL_HOME_PATH}/opt/neovim"
	rm -rf "${install_path}"

	local interpreter
	interpreter="$(find "${DEVEL_HOME_PATH}/compiler" -name "${INTERPRETER}")"
	local libc_so
	libc_so="$(find "${DEVEL_HOME_PATH}/compiler" -name "${LIBC_SO}")"

	chmod u+x nvim.appimage
	patchelf --set-rpath "${DEVEL_HOME_PATH}/compiler/$(uname -m)-linux-gnu/lib:$(dirname "${libc_so}")" nvim.appimage
	patchelf --set-interpreter "${interpreter}" nvim.appimage
	./nvim.appimage --appimage-extract
	mv ./squashfs-root/usr "${install_path}"
	rm -rf ./squashfs-root

	patchelf --set-rpath "$(dirname "${libc_so}")" "${install_path}/bin/nvim"
	patchelf --set-interpreter "${interpreter}" "${install_path}/bin/nvim"

	setup_package "${package}"

	log_info 'Success!'
}

function install_zstd() {
	local package='zstd'
	log_info "Start to install ${package}."
	rm -rf "${ZSTD_PACKAGE_EXTRACTED_DIR}"
	tar -zxvf "${ZSTD_PACKAGE_NAME}"

	pushd "${ZSTD_PACKAGE_EXTRACTED_DIR}" >/dev/null
	make -j "${NUM_CORES}" install PREFIX="${DEVEL_HOME_PATH}/opt/zstd"
	popd >/dev/null
	setup_package "${package}"

	log_info 'Success!'
}

function install_cmake() {
	local package='cmake'
	log_info "Start to install ${package}."

	local install_path="${DEVEL_HOME_PATH}/opt/${package}"
	rm -rf "${install_path}"
	mkdir -p "${install_path}"
	tar -zxvf "${CMAKE_PACKAGE_NAME}" --strip-components=1 -C "${install_path}"
	setup_package "${package}"

	log_info 'Success!'
}

function install_ccache() {
	local package='ccache'
	log_info "Start to install ${package}."
	rm -rf "${CCACHE_PACKAGE_EXTRACTED_DIR}"
	tar -zxvf "${CCACHE_PACKAGE_NAME}"

	pushd "${CCACHE_PACKAGE_EXTRACTED_DIR}" >/dev/null
	mkdir build
	cd build
	cmake -G Ninja -DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX="${DEVEL_HOME_PATH}/opt/${package}" \
		-DCMAKE_PREFIX_PATH="${DEVEL_HOME_PATH}" \
		-DREDIS_STORAGE_BACKEND=OFF \
		..
	ninja -j "${NUM_CORES}"
	ninja install
	popd >/dev/null
	setup_package "${package}"

	log_info 'Success!'
}

function install_libedit() {
	local package='libedit'
	log_info "Start to install ${package}."
	rm -rf "${LIBEDIT_PACKAGE_EXTRACTED_DIR}"
	tar -zxvf "${LIBEDIT_PACKAGE_NAME}"

	pushd "${LIBEDIT_PACKAGE_EXTRACTED_DIR}" >/dev/null
	mkdir build
	cd build
	CFLAGS="-I${DEVEL_HOME_PATH}/include/ncurses" \
		../configure --prefix="${DEVEL_HOME_PATH}/opt/${package}"
	make -j "${NUM_CORES}"
	make install
	popd >/dev/null
	setup_package "${package}"

	log_info 'Success!'
}

function install_libxml2() {
	local package='libxml2'
	log_info "Start to install ${package}."
	rm -rf "${LIBXML2_PACKAGE_EXTRACTED_DIR}"
	tar -zxvf "${LIBXML2_PACKAGE_NAME}"

	pushd "${LIBXML2_PACKAGE_EXTRACTED_DIR}" >/dev/null
	mkdir build
	cd build
	../autogen.sh --prefix="${DEVEL_HOME_PATH}/opt/${package}"
	make -j "${NUM_CORES}"
	make install
	popd >/dev/null
	setup_package "${package}"

	log_info 'Success!'
}

function install_swig() {
	local package='swig'
	log_info "Start to install ${package}."
	rm -rf "${SWIG_PACKAGE_EXTRACTED_DIR}"
	tar -zxvf "${SWIG_PACKAGE_NAME}"

	pushd "${SWIG_PACKAGE_EXTRACTED_DIR}" >/dev/null
	mkdir build
	cd build
	../configure --prefix="${DEVEL_HOME_PATH}/opt/${package}" --without-pcre
	make -j "${NUM_CORES}"
	make install
	popd >/dev/null
	setup_package "${package}"

	log_info 'Success!'
}

function install_llvm() {
	local package='llvm'
	log_info "Start to install ${package}."
	rm -rf "${LLVM_PACKAGE_EXTRACTED_DIR}"
	tar -Jxvf "${LLVM_PACKAGE_NAME}"

	pushd "${LLVM_PACKAGE_EXTRACTED_DIR}" >/dev/null
	mkdir -p "${HOME}/.config/${package}"
	local rpath
	rpath="$(sed -n 's/collect2 -rpath \(.*\)/\1/p' "${DEVEL_HOME_PATH}/compiler/lib/gcc/specs")"
	cat >"${HOME}/.config/${package}/clang.cfg" <<EOF
-Wl,-rpath,${rpath//\$/\\\$}
-Wl,--dynamic-linker,$(find "${DEVEL_HOME_PATH}/compiler/lib" -name 'ld-linux-*')
EOF
	ln -snf clang.cfg "${HOME}/.config/${package}/clang++.cfg"

	mkdir build
	cd build

	# See https://github.com/rust-lang/rust/issues/102897
	local kernel_version
	kernel_version="$(uname -r | sed -n 's/\([[:digit:]]\+\.[[:digit:]]\+\).*/\1/p')"
	if [[ "$(echo "${kernel_version}" 3.17 | awk '{print $1 < $2}')" == 1 ]]; then
		disable_arc4random='-DHAVE_DECL_ARC4RANDOM=0'
	fi

	cmake -G Ninja -DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX="${DEVEL_HOME_PATH}/opt/${package}" \
		-DCMAKE_PREFIX_PATH="${DEVEL_HOME_PATH}" \
		-DLLVM_ENABLE_PROJECTS="clang;lld;clang-tools-extra;lldb" \
		-DGCC_INSTALL_PREFIX="${DEVEL_HOME_PATH}/compiler" \
		-DCLANG_CONFIG_FILE_USER_DIR='~/.config/llvm' \
		-DLLVM_ENABLE_RUNTIMES="compiler-rt;libcxx;libcxxabi;libunwind" \
		-DLIBCXXABI_USE_LLVM_UNWINDER=ON \
		-DCOMPILER_RT_USE_LLVM_UNWINDER=ON \
		-DTerminfo_LIBRARIES="${DEVEL_HOME_PATH}/lib/libtinfow.so" \
		-DCURSES_NEED_WIDE=ON \
		${disable_arc4random:+${disable_arc4random}} \
		../llvm
	ninja -j "${NUM_CORES}"
	ninja install

	rpath="$(find "${DEVEL_HOME_PATH}/opt/${package}/lib" -maxdepth 1 -name "$(uname -m)-*-linux-gnu")"
	sed -i "/-Wl,-rpath/ s/\$/:${rpath//\//\\/}/" "${HOME}/.config/${package}/clang.cfg"
	mv "${HOME}/.config/${package}"/* "${DEVEL_HOME_PATH}/opt/${package}/bin/"
	popd >/dev/null

	log_info 'Success!'
}

function install_zsh() {
	local package='zsh'
	log_info "Start to install ${package}."
	rm -rf "${ZSH_PACKAGE_EXTRACTED_DIR}"
	tar -Jxvf "${ZSH_PACKAGE_NAME}"

	pushd "${ZSH_PACKAGE_EXTRACTED_DIR}" >/dev/null
	mkdir -p build
	cd build
	../configure --prefix="${DEVEL_HOME_PATH}/opt/${package}"
	make -j "${NUM_CORES}"
	make install
	popd >/dev/null
	setup_package "${package}"

	log_info 'Success!'
}

function install_packages() {
	local continue=${1}
	local start_package="${2}"
	local packages
	shift 2
	read -r -a packages <<<"${@}"
	local found=false

	pushd "${DOWNLOADS_PATH}/packages" >/dev/null
	if [[ "${#packages[@]}" -eq 0 ]]; then
		packages=(
			m4
			zlib
			libdb
			perl
			autoconf
			automake
			libtool
			make
			pkg_config
			cmake
			ninja
			patchelf
			ncurses
			readline
			libffi
			openssl
			curl
			wget
			bzip2
			xz
			sqlite
			python
			expat
			git
			gmp
			zstd
			gdb
			neovim
			ccache
			libedit
			libxml2
			swig
			llvm
			zsh
		)
	fi

	for package in "${packages[@]}"; do
		if [[ "${package}" == "${start_package}" ]]; then
			found=true
		fi
		if ! ${continue} || ${found}; then
			local command="install_${package}"
			${command}
		fi
	done
	popd >/dev/null
}

function usage() {
	cat >&2 <<EOF
Usage: ${BASH_SOURCE[0]} [options...] [packages...]

Options:
  -h, --help                Show usage
  --continue <package>      Continue to install packages starting from the specified package

EOF
	exit 1
}

function main() {
	local opts
	local packages
	local continue=false
	local start_package

	if ! opts="$(getopt -n "${0}" -o 'h' -l 'help,continue:' -- "${@}")"; then
		usage
	fi
	eval set -- "${opts}"
	while true; do
		case "${1}" in
		--continue)
			continue=true
			start_package="${2}"
			shift 2
			;;
		-h | --help)
			usage
			;;
		--)
			shift
			break
			;;
		*) ;;
		esac
	done
	if ${continue} && [[ "${#}" -ne 0 ]]; then
		usage
	fi

	# Prepare
	install_toolchain

	pushd "${DEVEL_HOME_PATH}" >/dev/null
	mkdir -p "compiler/$(uname -m)-linux-gnu/opt"
	ln -snf "compiler/$(uname -m)-linux-gnu"/* .
	popd >/dev/null

	# Setup locale
	setup_locale 'UTF-8' 'en_US' 'en_US.UTF-8'

	install_packages "${continue}" "${start_package}" "${@}"

	local message='Before using the packages, please run the following command first:\n\n'
	message+="\t\033[32;1msource ${SCRIPTS_PATH}/env_vars.sh\033[0m\n"
	log_info "${message}"
}

main "${@}"
