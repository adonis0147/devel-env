#!/bin/bash

declare -r CMD="${SOURCE_BASH[0]:-${0}}"
FILENAME="$(readlink -f "${CMD}")"
declare -r FILENAME
declare -r TOOLCHAIN_DIRNAME='compiler'
declare -r PATCHELF='patchelf'
declare -r INTERPRETER='ld-linux-x86-64.so.2'
declare -r LIBC_SO='libc.so.6'

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

function help() {
	echo -e "Usage: ${CMD} PATH [should_extract]"
}

function extract_toolchain() {
	local prefix="${1}"
	local temp_dir

	if ! temp_dir="$(mktemp -d)"; then
		log_error "Failed to create a temporary directory."
	fi
	# shellcheck disable=2064
	trap "rm -rf ${temp_dir}" EXIT

	log_info "The toolchain will be extracted to \033[34;1m${prefix}\033[0m ."
	log_info 'Extracting the toolchain...'
	if ! sed '1,/^# -\*- EOF -\*-$/d' "${FILENAME}" | tar -zx --strip-components=1 -C "${temp_dir}"; then
		log_error 'Failed to extract the toolchain.'
	fi
	mv "${temp_dir}" "${prefix}/${TOOLCHAIN_DIRNAME}"
	log_info 'Success!'
}

function configure_toolchain() {
	local prefix="${1}"
	log_info 'Configuring the toolchain...'
	if ! cd "${prefix}/${TOOLCHAIN_DIRNAME}"; then
		log_error "Failed to change the current directory to \033[34;1m${prefix}/${TOOLCHAIN_DIRNAME}\033[0m ."
	fi

	local patchelf="${prefix}/${TOOLCHAIN_DIRNAME}/bin/${PATCHELF}"
	if [[ ! -f "${patchelf}" ]]; then
		log_error "Failed to find the tool \033[34;1m${patchelf}\033[0m ."
	fi
	log_info "Program ${PATCHELF} was found: \033[34;1m${patchelf}\033[0m"

	local interpreter
	if ! interpreter="$(find "$(pwd)" -name "${INTERPRETER}")" || [[ -z "${interpreter}" ]]; then
		log_error "Failed to find the interpreter \033[34;1m${INTERPRETER}\033[0m"
	fi
	log_info "Interpreter was found: \033[34;1m${interpreter}\033[0m"

	local libc_so
	if ! libc_so="$(find "$(pwd)" -name "${LIBC_SO}")" || [[ -z "${libc_so}" ]]; then
		log_error "Failed to find the library \033[34;1m${LIBC_SO}\033[0m"
	fi
	log_info "Library was found: \033[34;1m${libc_so}\033[0m"

	local rpaths=(
		"\$ORIGIN"
		"\$ORIGIN/lib"
		"\$ORIGIN/lib64"
		"\$ORIGIN/../lib"
		"\$ORIGIN/../lib64"
		"$(dirname "${libc_so}")"
	)
	local rpaths_in_line
	rpaths_in_line="$(
		IFS=':'
		echo "${rpaths[*]}"
	)"

	while read -r file; do
		if ! file "${file}" | grep ELF >/dev/null; then
			continue
		fi
		"${patchelf}" --set-rpath "${rpaths_in_line}" "${file}"
		if readelf -S "${file}" | grep '.interp' >/dev/null; then
			"${patchelf}" --set-interpreter "${interpreter}" "${file}"
		fi
	done < <(
		find "$(pwd)" -type f ! -name '*.o' ! -name '*.a' \
			! -name "${PATCHELF}" ! -name "${INTERPRETER}" ! -name "${LIBC_SO}"
	)

	# Rename
	pushd bin >/dev/null || exit
	while read -r file; do
		local path_prefix='./x86_64-pc-linux-gnu-'
		if [[ "$(basename "${file}")" =~ x86_64-pc-linux-gnu-.* ]]; then
			mv "${file}" "${file:${#path_prefix}}"
		fi
	done < <(find . -mindepth 1)
	ln -snf gcc cc
	popd >/dev/null || exit

	# Configure gcc specs
	"$(pwd)/bin/gcc" -dumpspecs >lib/gcc/x86_64-pc-linux-gnu/11.2.0/specs
	sed -i "{
		s/\/lib64\/${INTERPRETER}/${interpreter//\//\\/}/g
		s/collect2/collect2 -rpath ${rpaths_in_line//\//\\/}/
	}" "$(pwd)/lib/gcc/x86_64-pc-linux-gnu/11.2.0/specs"

	# Link programs
	while read -r file; do
		ln -snf "${file}" bin/
	done < <(find "$(pwd)/x86_64-pc-linux-gnu/sysroot/usr/bin" -mindepth 1)

	# Modify files
	local python_dir="${prefix}/${TOOLCHAIN_DIRNAME}/share/gcc-11.2.0/python"
	local lib_dir="${prefix}/${TOOLCHAIN_DIRNAME}/x86_64-pc-linux-gnu/sysroot/lib64"
	sed -i "{
		s/^pythondir = .*/pythondir = '${python_dir//\//\\/}'/
		s/^libdir = .*/libdir = '${lib_dir//\//\\/}'/
	}" "$(pwd)/x86_64-pc-linux-gnu/sysroot/lib/libstdc++.so.6.0.29-gdb.py"
}

function main() {
	if [[ "${#}" -lt 1 ]]; then
		help
		exit 1
	fi
	local prefix="${1}"
	if ! mkdir -p "${prefix}"; then
		log_error "Failed to create the directory \033[34;1m${prefix}\033[0m ."
	fi
	if ! prefix="$(readlink -f "${1}")"; then
		log_error "Failed to get the absolute path of \033[34;1m${1}\033[0m ."
	fi

	local should_extract="${2:-true}"
	if [[ "${should_extract}" == 'true' ]]; then
		extract_toolchain "${prefix}"
	fi

	configure_toolchain "${prefix}"
	log_info 'Completed!'

	local message='Before using the toolchain, please run the following command first:\n\n'
	message+="\t\033[32;1mexport PATH=\"${prefix}/${TOOLCHAIN_DIRNAME}/bin:\${PATH}\"\033[0m\n"
	log_info "${message}"
}

main "${@}"

exit 0

# -*- EOF -*-
