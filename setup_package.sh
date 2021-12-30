#!/bin/bash

DEVEL_HOME_PATH="${HOME}/devel"
OPT_PATH="${DEVEL_HOME_PATH}/opt"

count_layers() {
  local package="${1}"
  local full_path="${2}"
  IFS='/' read -r -a tokens <<< "${full_path}"
  local num="${#tokens[@]}"
  echo "$((num - 2))"
}

generate_link_path_prefix() {
  local num="${1}"
  local full_path="${2}"
  local path='..'
  for _ in $(seq "$((num - 1))"); do
    path+='/..'
  done
  echo "${path}/${full_path}"
}

setup_package() {
  local package="${1}"
  local num
  local link_path_prefix
  echo "Setup ${package} ..."
  while read -r path; do
    full_path="$(basename "${OPT_PATH}")/${package}/${path}"
    num="$(count_layers "${package}" "${full_path}")"
    link_path_prefix="$(generate_link_path_prefix "${num}" "${full_path}")"
    mkdir -p "${path}"
    while read -r sub_path; do
      ln -snf "${link_path_prefix}/${sub_path}" "${path}/"
    done < <(find "${full_path}" -mindepth 1 -maxdepth 1 ! -type d -printf '%P\n')
  done < <(find "${OPT_PATH}/${package}" -mindepth 1 -type d -printf '%P\n')
  echo "Setup ${package} done."
}

setup() {
  local package="${1}"
  if [[ -z "${package}" ]]; then
    while read -r package; do
      if [[ "${package}" == 'musl' ]]; then
        continue
      fi
      setup_package "${package}"
    done < <(find "${OPT_PATH}" -mindepth 1 -maxdepth 1 -printf '%P\n')
  else
    setup_package "${package}"
  fi
}

setup "${@}"
