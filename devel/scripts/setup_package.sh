#!/bin/bash

set -e
shopt -s inherit_errexit

declare -r CMD="${BASH_SOURCE[0]}"
SCRIPTS_PATH="$(dirname "$(readlink -f "${CMD}")")"
declare -r SCRIPTS_PATH

source "${SCRIPTS_PATH}/common.sh"
source "${SCRIPTS_PATH}/env_vars.sh"
declare -r OPT_PATH="${DEVEL_HOME_PATH}/opt"

function count_layers() {
	local package="${1}"
	local full_path="${2}"
	IFS='/' read -r -a tokens <<<"${full_path}"
	local num="${#tokens[@]}"
	echo "$((num - 2))"
}

function generate_link_path_prefix() {
	local num="${1}"
	local full_path="${2}"
	local path='..'
	for _ in $(seq "$((num - 1))"); do
		path+='/..'
	done
	echo "${path}/${full_path}"
}

function setup_package() {
	local package="${1}"
	local num
	local link_path_prefix
	log_info "Setup ${package} ..."
	while read -r path; do
		full_path="$(basename "${OPT_PATH}")/${package}/${path}"
		num="$(count_layers "${package}" "${full_path}")"
		link_path_prefix="$(generate_link_path_prefix "${num}" "${full_path}")"
		mkdir -p "${DEVEL_HOME_PATH}/${path}"
		while read -r sub_path; do
			ln -snf "${link_path_prefix}/${sub_path}" "${DEVEL_HOME_PATH}/${path}/"
		done < <(find "${DEVEL_HOME_PATH}/${full_path}" -mindepth 1 -maxdepth 1 ! -type d -printf '%P\n')
	done < <(find "${OPT_PATH}/${package}" -mindepth 1 -type d -printf '%P\n')
	log_info "Setup ${package} done."
}

function setup() {
	local package="${1}"
	if [[ -z "${package}" ]]; then
		while read -r package; do
			setup_package "${package}"
		done < <(find "${OPT_PATH}" -mindepth 1 -maxdepth 1 ! -name 'musl' -printf '%P\n')
	else
		setup_package "${package}"
	fi
}

setup "${@}"
