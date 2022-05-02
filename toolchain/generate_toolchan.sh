#!/bin/bash

set -e

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

function prepare() {
	cd /x-tools
	mv /x-tools/x86_64-pc-linux-gnu /output
	chmod -R u+w /output/x86_64-pc-linux-gnu

	mkdir patchelf
	tar -C patchelf -zxf patchelf.tar.gz

	mv patchelf/bin/patchelf /output/x86_64-pc-linux-gnu/bin
}

function main() {
	if [[ ! -d '/output' ]]; then
		log_error "The host dirve wasn't mounted."
	elif [[ -d '/output/x86_64-pc-linux-gnu' ]]; then
		log_warning 'Toolchain was generated.'
		exit 0
	fi

	log_info 'Generating...'

	prepare

	# Clean up
	cd /output/x86_64-pc-linux-gnu
	rm -rf build.log.bz2

	log_info 'Packaging...'
	cd /output
	tar -zcf x86_64-pc-linux-gnu.tgz x86_64-pc-linux-gnu

	cat /x-tools/setup_toolchain.sh x86_64-pc-linux-gnu.tgz >install_toolchain.sh
	chmod a+x install_toolchain.sh

	log_info 'Completed!'
}

main "${@}"
