#!/bin/bash

export DEVEL_HOME_PATH="${DEVEL_HOME_PATH:-${HOME}/devel}"

export PKG_CONFIG_PATH="${DEVEL_HOME_PATH}/lib/pkgconfig"
export ACLOCAL_PATH="${DEVEL_HOME_PATH}/share/aclocal"

export GCONV_PATH="${DEVEL_HOME_PATH}/compiler/lib/gconv"

export CPATH="${DEVEL_HOME_PATH}/include"
export LD_RUN_PATH="${DEVEL_HOME_PATH}/lib"
export PATH="${DEVEL_HOME_PATH}/bin:${DEVEL_HOME_PATH}/compiler/bin:${PATH}"

export MANPATH="${DEVEL_HOME_PATH}/share/man:${DEVEL_HOME_PATH}/man:${DEVEL_HOME_PATH}/compiler/share/man:${MANPATH}"

if command -v nvim >/dev/null; then
	export EDITOR='nvim'
	export MANPAGER='nvim +Man!'
fi

GPG_TTY="$(tty)"
export GPG_TTY

function relocate() {
	local program="${1}"
	local libc_so
	local interpreter
	libc_so="$(find "${DEVEL_HOME_PATH}/compiler" -name 'libc.so.6')"
	interpreter="$(find "${DEVEL_HOME_PATH}/compiler" -name 'ld-linux-*.so.*')"

	patchelf --set-rpath "$(dirname "${libc_so}")" "${program}"
	patchelf --set-interpreter "${interpreter}" "${program}"
}

# Example: setup_locale 'UTF-8' 'en_US' 'en_US.UTF-8'
function setup_locale() {
	local charmap="${1}"
	local input="${2}"
	local output_path="${3}"

	export I18NPATH="${DEVEL_HOME_PATH}/compiler/share/i18n"
	export LOCPATH="${HOME}/.locale"

	local full_ouput_path="${LOCPATH}/${output_path}"
	if [[ ! -d "${full_ouput_path}" ]]; then
		mkdir -p "${LOCPATH}"
		local message="Generate the locale \033[34;1m${output_path}\033[0m to \033[34;1m${LOCPATH}\033[0m."
		echo -e "${message}"

		if ! localedef -f "${charmap}" -i "${input}" "${full_ouput_path}"; then
			return "${?}"
		else
			echo -e "Success!\n\033[32;1m\n\tLANG=${output_path}\n\tLANGUAGE=${output_path}\033[0m"
		fi
	fi

	export LANG="${output_path}"
	export LANGUAGE="${output_path}"
	export LESSCHARSET="${charmap}"
}

function setup_terminfo() {
	if [[ ! -L "${HOME}/.terminfo" ]]; then
		if [[ -d "${DEVEL_HOME_PATH}/share/terminfo" ]]; then
			ln -s "${DEVEL_HOME_PATH}/share/terminfo" "${HOME}/.terminfo"
			echo -e "\033[32;1mSuccess!\033[0m"
		else
			echo -e "\033[31;1mFailed to find the terminfo directory: ${DEVEL_HOME_PATH}/share/terminfo\033[0m"
			return 1
		fi
	fi
}

# Example:
#   curl -L https://curl.se/ca/cacert.pem -o "${HOME}/.local/share/cacert.pem"
#   setup_ca_certificate "${HOME}/.local/share/cacert.pem"
function setup_ca_certificate() {
	local cacert="${1:+$(readlink -f "${1}")}"

	# wget2
	local wget2rc="${HOME}/.config/wget/wget2rc"
	local content="ca_certificate=${cacert}"
	if [[ ! -f "${wget2rc}" ]] || ! grep "${content}" "${wget2rc}" >/dev/null; then
		echo -e "Configure ca_certificate to \033[34;1m${wget2rc}\033[0m"
		mkdir -p "$(dirname "${wget2rc}")"
		echo "${content}" >>"${wget2rc}"
	fi

	# curl
	export CURL_CA_BUNDLE="${cacert}"
}
