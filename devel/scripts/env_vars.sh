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
	local file="${1:+$(readlink -f "${1}")}"
	local temp_dir
	local ncurses_package='ncurses-6.4.tar.gz'
	local url="https://ftpmirror.gnu.org/ncurses/${ncurses_package}"
	local sha256sum='6931283d9ac87c5073f30b6290c4c75f21632bb4fc3603ac8100812bed248159'
	local status_code

	if ! temp_dir="$(mktemp -d)"; then
		status_code="${?}"
		echo -e "\033[31;1mFailed to create a temporary directory.\033[0m"
		return "${status_code}"
	fi
	# shellcheck disable=2064
	trap "rm -rf ${temp_dir}" EXIT

	pushd "${temp_dir}" >/dev/null || return "${?}"
	if [[ -z "${file}" ]]; then
		curl -L "${url}" -o "${ncurses_package}"
		if [[ "${sha256sum}" != "$(sha256sum "${ncurses_package}" | awk '{print $1}')" ]]; then
			echo -e "\033[31;1mFailed to download ${ncurses_package} from ${url} .\033[0m"
			return 1
		fi
		tar -zxf "${ncurses_package}"
	else
		tar -zxf "${file}" -C "${temp_dir}"
	fi

	status_code=0
	if /usr/bin/tic -xe tmux-256color,alacritty "${ncurses_package%.tar.gz}/misc/terminfo.src"; then
		echo -e "\033[32;1mSuccess!\033[0m"
	else
		status_code="${?}"
	fi
	popd >/dev/null || return "${?}"
	return "${status_code}"
}
