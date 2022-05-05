#!/bin/bash

export DEVEL_HOME_PATH="${DEVEL_HOME_PATH:-${HOME}/devel}"

export PKG_CONFIG_PATH="${DEVEL_HOME_PATH}/lib/pkgconfig:${PKG_CONFIG_PATH}"
export ACLOCAL_PATH="${DEVEL_HOME_PATH}/share/aclocal:${ACLOCAL_PATH}"

export GCONV_PATH="${DEVEL_HOME_PATH}/compiler/x86_64-pc-linux-gnu/sysroot/usr/lib/gconv"
export CPATH="${DEVEL_HOME_PATH}/include"
export LD_RUN_PATH="${DEVEL_HOME_PATH}/lib:${LD_RUN_PATH}"
export PATH="${DEVEL_HOME_PATH}/bin:${DEVEL_HOME_PATH}/compiler/bin:${PATH}"

export EDITOR='nvim'
export MANPAGER='col -b | nvim -m -c "set ft=man ts=8 nonu nolist" -'

function relocate() {
	local program="${1}"
	local libc_so
	local interpreter
	libc_so="$(find "${DEVEL_HOME_PATH}/compiler" -name 'libc.so.6')"
	interpreter="$(find "${DEVEL_HOME_PATH}/compiler" -name 'ld-linux-x86-64.so.2')"

	patchelf --set-rpath "$(dirname "${libc_so}")" "${program}"
	patchelf --set-interpreter "${interpreter}" "${program}"
}
