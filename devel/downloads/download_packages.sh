#!/bin/bash

set -e

declare -r CMD="${BASH_SOURCE[0]}"
DOWNLOADS_PATH="$(dirname "$(readlink -f "${CMD}")")"
declare -r DOWNLOADS_PATH
SCRIPTS_PATH="$(readlink -f "${DOWNLOADS_PATH}/../scripts")"
declare -r PACKAGES_PATH="${DOWNLOADS_PATH}/packages"

source "${SCRIPTS_PATH}/common.sh"
source "${DOWNLOADS_PATH}/packages.sh"

function download() {
	local package="${1}"
	local url="${2}"
	local sha256sum="${3}"
	local output="${PACKAGES_PATH}/${4}"

	log_info "Downloading ${package}..."
	if [[ ! -f "${output}" ]] || [[ "${sha256sum}" != "$(sha256sum "${output}" | awk '{print $1}')" ]]; then
		curl -L "${url}" -o "${output}"
	fi
	log_info "Download ${package} successfully!"
}

function main() {
	if [[ ! -d "${DOWNLOADS_PATH}/packages" ]]; then
		if ! mkdir "${PACKAGES_PATH}"; then
			log_error "Failed to create the directory: \033[34;1m${PACKAGES_PATH}\033[0m"
		fi
	fi

	download 'autoconf' "${AUTOCONF_PACKAGE_URL}" "${AUTOCONF_PACKAGE_SHA256SUM}" "${AUTOCONF_PACKAGE_NAME}"
	download 'automake' "${AUTOMAKE_PACKAGE_URL}" "${AUTOMAKE_PACKAGE_SHA256SUM}" "${AUTOMAKE_PACKAGE_NAME}"
	download 'libtool' "${LIBTOOL_PACKAGE_URL}" "${LIBTOOL_PACKAGE_SHA256SUM}" "${LIBTOOL_PACKAGE_NAME}"
	download 'make' "${MAKE_PACKAGE_URL}" "${MAKE_PACKAGE_SHA256SUM}" "${MAKE_PACKAGE_NAME}"
	download 'pkg-config' "${PKG_CONFIG_PACKAGE_URL}" "${PKG_CONFIG_PACKAGE_SHA256SUM}" "${PKG_CONFIG_PACKAGE_NAME}"
	download 'patchelf' "${PATCHELF_PACKAGE_URL}" "${PATCHELF_PACKAGE_SHA256SUM}" "${PATCHELF_PACKAGE_NAME}"
	download 'ncurses' "${NCURSES_PACKAGE_URL}" "${NCURSES_PACKAGE_SHA256SUM}" "${NCURSES_PACKAGE_NAME}"
	download 'readline' "${READLINE_PACKAGE_URL}" "${READLINE_PACKAGE_SHA256SUM}" "${READLINE_PACKAGE_NAME}"
	download 'libffi' "${LIBFFI_PACKAGE_URL}" "${LIBFFI_PACKAGE_SHA256SUM}" "${LIBFFI_PACKAGE_NAME}"
	download 'zlib' "${ZLIB_PACKAGE_URL}" "${ZLIB_PACKAGE_SHA256SUM}" "${ZLIB_PACKAGE_NAME}"
	download 'berkeley_db' "${BERKELEY_DB_PACKAGE_URL}" "${BERKELEY_DB_PACKAGE_SHA256SUM}" "${BERKELEY_DB_PACKAGE_NAME}"
	download 'perl' "${PERL_PACKAGE_URL}" "${PERL_PACKAGE_SHA256SUM}" "${PERL_PACKAGE_NAME}"
	download 'openssl' "${OPENSSL_PACKAGE_URL}" "${OPENSSL_PACKAGE_SHA256SUM}" "${OPENSSL_PACKAGE_NAME}"
	download 'curl' "${CURL_PACKAGE_URL}" "${CURL_PACKAGE_SHA256SUM}" "${CURL_PACKAGE_NAME}"
	download 'wget' "${WGET_PACKAGE_URL}" "${WGET_PACKAGE_SHA256SUM}" "${WGET_PACKAGE_NAME}"
	download 'bzip2' "${BZIP2_PACKAGE_URL}" "${BZIP2_PACKAGE_SHA256SUM}" "${BZIP2_PACKAGE_NAME}"
	download 'python' "${PYTHON_PACKAGE_URL}" "${PYTHON_PACKAGE_SHA256SUM}" "${PYTHON_PACKAGE_NAME}"
	download 'expat' "${EXPAT_PACKAGE_URL}" "${EXPRT_PACKAGE_SHA256SUM}" "${EXPAT_PACKAGE_NAME}"
	download 'git' "${GIT_PACKAGE_URL}" "${GIT_PACKAGE_SHA256SUM}" "${GIT_PACKAGE_NAME}"
	download 'gmp' "${GMP_PACKAGE_URL}" "${GMP_PACKAGE_SHA256SUM}" "${GMP_PACKAGE_NAME}"
	download 'gdb' "${GDB_PACKAGE_URL}" "${GDB_PACKAGE_SHA256SUM}" "${GDB_PACKAGE_NAME}"
	download 'neovim' "${NEOVIM_PACKAGE_URL}" "${NEOVIM_PACKAGE_SHA256SUM}" "${NEOVIM_PACKAGE_NAME}"
	download 'zstd' "${ZSTD_PACKAGE_URL}" "${ZSTD_PACKAGE_SHA256SUM}" "${ZSTD_PACKAGE_NAME}"
	download 'ccache' "${CCACHE_PACKAGE_URL}" "${CCACHE_PACKAGE_SHA256SUM}" "${CCACHE_PACKAGE_NAME}"
}

main "${@}"
