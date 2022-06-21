#!/bin/bash

export DEVEL_HOME_PATH="${DEVEL_HOME_PATH:-${HOME}/devel}"

export PKG_CONFIG_PATH="${DEVEL_HOME_PATH}/lib/pkgconfig"
export ACLOCAL_PATH="${DEVEL_HOME_PATH}/share/aclocal"

export GCONV_PATH="${DEVEL_HOME_PATH}/compiler/x86_64-pc-linux-gnu/sysroot/usr/lib/gconv"

export CPATH="${DEVEL_HOME_PATH}/include"
export LD_RUN_PATH="${DEVEL_HOME_PATH}/lib"
export PATH="${DEVEL_HOME_PATH}/bin:${DEVEL_HOME_PATH}/compiler/bin:${PATH}"

export EDITOR='nvim'
export MANPAGER='nvim +Man!'

function relocate() {
	local program="${1}"
	local libc_so
	local interpreter
	libc_so="$(find "${DEVEL_HOME_PATH}/compiler" -name 'libc.so.6')"
	interpreter="$(find "${DEVEL_HOME_PATH}/compiler" -name 'ld-linux-x86-64.so.2')"

	patchelf --set-rpath "$(dirname "${libc_so}")" "${program}"
	patchelf --set-interpreter "${interpreter}" "${program}"
}

# Example: setup_locale 'UTF-8' 'en_US' 'en_US.UTF-8'
function setup_locale() {
	local charmap="${1}"
	local input="${2}"
	local output_path="${3}"

	export I18NPATH="${DEVEL_HOME_PATH}/compiler/x86_64-pc-linux-gnu/sysroot/usr/share/i18n"
	export LOCPATH="${HOME}/.locale"

	local full_ouput_path="${LOCPATH}/${output_path}"
	if [[ ! -d "${full_ouput_path}" ]]; then
		mkdir -p "${LOCPATH}"
		local message="Generate the locale \033[34;1m${output_path}\033[0m to \033[34;1m${LOCPATH}\033[0m."
		echo -e "${message}"

		if ! localedef -f "${charmap}" -i "${input}" "${full_ouput_path}"; then
			return
		else
			echo -e "Success!\n\033[32;1m\n\tLANG=${output_path}\n\tLANGUAGE=${output_path}\033[0m"
		fi
	fi

	export LANG="${output_path}"
	export LANGUAGE="${output_path}"
	export LESSCHARSET="${charmap}"
}
