#!/bin/bash

set -e

declare -r CMD="${SOURCE_BASH[0]:-${0}}"
FILENAME="$(readlink -f "${CMD}")"
declare -r FILENAME
declare -r TOOLCHAIN_DIRNAME='compiler'
declare -r PATCHELF='patchelf'
declare -r LIBC_SO='libc.so.6'
declare -r INTERPRETER='ld-linux-*'

LD="$(command -v ld || true)"
declare -r LD

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

# shellcheck disable=SC2317,SC2329
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

	if [[ -d "${prefix}/${TOOLCHAIN_DIRNAME}" ]]; then
		log_error "Failed to extract the toolchain due to the target directory \033[34;1m${prefix}/${TOOLCHAIN_DIRNAME}\033[0m already exists."
	fi

	if ! temp_dir="$(mktemp -d)"; then
		log_error "Failed to create a temporary directory."
	fi
	# shellcheck disable=2064
	trap "rm -rf ${temp_dir}" EXIT

	log_info "The toolchain will be extracted to \033[34;1m${prefix}\033[0m ."
	log_info 'Extracting the toolchain...'
	if ! sed '1,/^# -\*- EOF -\*-$/d' "${FILENAME}" | tar -Jx --strip-components=1 -C "${temp_dir}"; then
		log_error 'Failed to extract the toolchain.'
	fi

	mv "${temp_dir}" "${prefix}/${TOOLCHAIN_DIRNAME}"
	log_info 'Success!'
}

function relocate() {
	local patchelf="${1}"
	local rpath="${2}"
	local interpreter="${3}"
	shift 3

	local file
	for file in "${@}"; do
		"${patchelf}" --set-rpath "${rpath}" "${file}"
		"${patchelf}" --set-interpreter "${interpreter}" "${file}"
	done
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

	# Remove useless files
	rm -rf "$(pwd)/$(uname -m)-linux-gnu"/*
	find "$(pwd)" -name '*.la' -delete

	mkdir "$(pwd)/$(uname -m)-linux-gnu/include"
	mkdir "$(pwd)/$(uname -m)-linux-gnu/lib"
	ln -snf lib "$(pwd)/$(uname -m)-linux-gnu/lib64"

	local rpaths=(
		"$(pwd)/$(uname -m)-linux-gnu/lib"
		"$(dirname "${libc_so}")"
		"\$ORIGIN"
		"\$ORIGIN/lib64"
		"\$ORIGIN/lib"
		"\$ORIGIN/../lib64"
		"\$ORIGIN/../lib"
	)
	local rpaths_in_line
	rpaths_in_line="$(
		IFS=':'
		echo "${rpaths[*]}"
	)"

	# Use bundled readelf
	local readelf
	readelf="$(pwd)/bin/readelf"
	relocate "${patchelf}" "${rpaths_in_line}" "${interpreter}" "${readelf}"

	while read -r file; do
		if ! "${readelf}" -h "${file}" &>/dev/null; then
			continue
		fi
		"${patchelf}" --set-rpath "${rpaths_in_line}" "${file}"
		if "${readelf}" -S "${file}" | grep '.interp' >/dev/null; then
			"${patchelf}" --set-interpreter "${interpreter}" "${file}"
		fi
	done < <(
		find "$(pwd)" -type f ! -name '*.o' ! -name '*.a' \
			! -name "${PATCHELF}" ! -name "${INTERPRETER}" ! -name "${LIBC_SO}"
	)
	"${patchelf}" --set-interpreter "${interpreter}" "${libc_so}"

	pushd bin >/dev/null || exit
	ln -snf gcc cc
	popd >/dev/null || exit

	# Modify files
	local current_path
	current_path="$(pwd)"
	while read -r file; do
		if "${readelf}" -h "${file}" &>/dev/null; then
			continue
		fi
		if [[ "${file}" != *.so ]]; then
			sed -i "s|/compiler|${current_path}|g" "${file}"
		else
			sed -i "s|/compiler|..|g" "${file}"
		fi
	done < <(
		find . -type f -exec grep -E -I -l $'[=\'" ]/compiler' {} \;
	)

	# Modify ldd
	sed -i "s|RTLDLIST=.*|RTLDLIST='${interpreter}'|" bin/ldd

	if [[ -n "${LD}" ]]; then
		local search_dirs
		read -r -a search_dirs <<<"$("${LD}" --verbose | grep SEARCH_DIR | sed -n 's/SEARCH_DIR("=*\([^)]*\)");/\1/gp')"

		local library_path
		library_path="$(dirname "${libc_so}"):$(
			IFS=':'
			echo "${search_dirs[*]}"
		)"
		sed -i "/RTLDLIST=/i \
export LD_LIBRARY_PATH=\"${library_path}:\${LD_LIBRARY_PATH}\" \\
" bin/ldd
	fi

	# Configure gcc specs
	local filename
	filename="$(basename "${interpreter}")"
	local dirname
	dirname="$(dirname "${interpreter}")"
	"$(pwd)/bin/gcc" -dumpspecs | sed "{
		/^\*cc1:/ {n; s|\$| -isysroot ${prefix}|}
		s|:\([^;}:]*\)/\(${filename/.so*/}\)|:${dirname}/\2|g
		s|collect2|collect2 --sysroot=${prefix} -rpath ${rpaths_in_line}|
	}" >"$(pwd)/lib/gcc/specs"
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
