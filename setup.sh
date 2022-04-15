#!/usr/bin/env bash

set -e

# shellcheck disable=SC2155
readonly NUM_CORES="$(nproc)"
readonly PACKAGES_PATH='packages'
readonly ORIGIN_LD_RUN_PATH="\$\$ORIGIN/../lib"
readonly BUILD_LD_RUN_PATH="${DEVEL_HOME_PATH}/lib"

setup_package() {
  local package="${1}"
  pushd "${DEVEL_HOME_PATH}" > /dev/null
  ./setup_package.sh "${package}"
  popd > /dev/null
}

setup_autoconf() {
  local package='autoconf'
  echo -e "\033[32;1mStart to setup ${package}.\033[0m"
  pushd "${PACKAGES_PATH}" > /dev/null
  local dir='autoconf-2.71'
  rm -rf "${dir}" && tar -zxvf autoconf-2.71.tar.gz
  cd "${dir}"
  mkdir build
  cd build
  ../configure --prefix="${DEVEL_HOME_PATH}/opt/${package}"
  make -j "${NUM_CORES}"
  make install
  popd > /dev/null

  setup_package "${package}"
}

setup_automake() {
  local package='automake'
  echo -e "\033[32;1mStart to setup ${package}.\033[0m"
  pushd "${PACKAGES_PATH}" > /dev/null
  local dir='automake-1.16.5'
  rm -rf "${dir}" && tar -xvf automake-1.16.5.tar.xz
  cd "${dir}"
  mkdir build
  cd build
  ../configure --prefix="${DEVEL_HOME_PATH}/opt/${package}"
  make -j "${NUM_CORES}"
  make install
  popd > /dev/null

  setup_package "${package}"
}

setup_libtool() {
  local package='libtool'
  echo -e "\033[32;1mStart to setup ${package}.\033[0m"
  pushd "${PACKAGES_PATH}" > /dev/null
  local dir='libtool-2.4.6'
  rm -rf "${dir}" && tar -zxvf libtool-2.4.6.tar.gz
  cd "${dir}"
  mkdir build
  cd build
  ../configure --prefix="${DEVEL_HOME_PATH}/opt/${package}"
  make -j "${NUM_CORES}"
  make install
  popd > /dev/null

  setup_package "${package}"
}

setup_make() {
  local package='make'
  echo -e "\033[32;1mStart to setup ${package}.\033[0m"
  pushd "${PACKAGES_PATH}" > /dev/null
  local dir='make-4.3'
  rm -rf "${dir}" && tar -zxvf make-4.3.tar.gz
  cd "${dir}"
  mkdir build
  cd build
  ../configure --prefix="${DEVEL_HOME_PATH}/opt/${package}"
  make -j "${NUM_CORES}"
  make install
  popd > /dev/null

  setup_package "${package}"
}

setup_pkg-config() {
  local package='pkg-config'
  echo -e "\033[32;1mStart to setup ${package}.\033[0m"
  pushd "${PACKAGES_PATH}" > /dev/null
  local dir='pkg-config-0.29.2'
  rm -rf "${dir}" && tar -zxvf pkg-config-0.29.2.tar.gz
  cd "${dir}"
  mkdir build
  cd build
  ../configure --prefix="${DEVEL_HOME_PATH}/opt/${package}" --with-internal-glib
  make -j "${NUM_CORES}"
  make install
  popd > /dev/null

  setup_package "${package}"
}

setup_patchelf() {
  local package='patchelf'
  echo -e "\033[32;1mStart to setup ${package}.\033[0m"
  pushd "${PACKAGES_PATH}" > /dev/null
  local dir='patchelf-0.14.3'
  rm -rf "${dir}" && tar -zxvf patchelf-0.14.3.tar.gz
  cd "${dir}"
  mkdir build
  cd build
  ../configure --prefix="${DEVEL_HOME_PATH}/opt/${package}"
  make -j "${NUM_CORES}"
  make install
  popd > /dev/null

  setup_package "${package}"
}

setup_ncurses() {
  local package='ncurses'
  echo -e "\033[32;1mStart to setup ${package}.\033[0m"
  pushd "${PACKAGES_PATH}" > /dev/null
  local dir='ncurses-6.3'
  rm -rf "${dir}" && tar -zxvf ncurses-6.3.tar.gz
  cd "${dir}"
  mkdir build
  cd build
  ../configure --prefix="${DEVEL_HOME_PATH}/opt/${package}" --enable-widec --with-shared --with-termlib
  make -j "${NUM_CORES}"
  make install
  popd > /dev/null

  setup_package "${package}"
}

setup_readline() {
  local package='readline'
  echo -e "\033[32;1mStart to setup ${package}.\033[0m"
  pushd "${PACKAGES_PATH}" > /dev/null
  local dir='readline-8.1'
  rm -rf "${dir}" && tar -zxvf readline-8.1.tar.gz
  cd "${dir}"
  mkdir build
  cd build
  ../configure --prefix="${DEVEL_HOME_PATH}/opt/${package}"
  make SHLIB_LIBS="-Wl,-rpath,'${ORIGIN_LD_RUN_PATH}:${BUILD_LD_RUN_PATH}' -L${DEVEL_HOME_PATH}/lib -ltinfow" \
    -j "${NUM_CORES}"
  make install
  popd > /dev/null

  setup_package "${package}"
}

setup_libffi() {
  local package='libffi'
  echo -e "\033[32;1mStart to setup ${package}.\033[0m"
  pushd "${PACKAGES_PATH}" > /dev/null
  local dir='libffi-3.4.2'
  rm -rf "${dir}" && tar -zxvf libffi-3.4.2.tar.gz
  cd "${dir}"
  mkdir build
  cd build
  ../configure --prefix="${DEVEL_HOME_PATH}/opt/${package}"
  make -j "${NUM_CORES}"
  make install
  popd > /dev/null

  setup_package "${package}"
}

setup_openssl() {
  local package='openssl'
  echo -e "\033[32;1mStart to setup ${package}.\033[0m"
  pushd "${PACKAGES_PATH}" > /dev/null
  local dir='openssl-1.1.1m'
  rm -rf "${dir}" && tar -zxvf openssl-1.1.1m.tar.gz
  cd "${dir}"
  mkdir build
  cd build
  ../config --prefix="${DEVEL_HOME_PATH}/opt/${package}"
  make -j "${NUM_CORES}"
  make install
  popd > /dev/null

  setup_package "${package}"
}

setup_curl() {
  local package='curl'
  echo -e "\033[32;1mStart to setup ${package}.\033[0m"
  pushd "${PACKAGES_PATH}" > /dev/null
  local dir='curl-7.80.0'
  rm -rf "${dir}" && tar -zxvf curl-7.80.0.tar.gz
  cd "${dir}"
  mkdir build
  cd build
  LDFLAGS="-Wl,-rpath,'${ORIGIN_LD_RUN_PATH}:${BUILD_LD_RUN_PATH}'" ../configure --prefix="${DEVEL_HOME_PATH}/opt/${package}" \
    --with-openssl="${DEVEL_HOME_PATH}/opt/openssl"
  make -j "${NUM_CORES}"
  make install
  popd > /dev/null

  setup_package "${package}"
}

setup_wget() {
  local package='wget'
  echo -e "\033[32;1mStart to setup ${package}.\033[0m"
  pushd "${PACKAGES_PATH}" > /dev/null
  local dir='wget-1.21.1'
  rm -rf "${dir}" && tar -zxvf wget-1.21.1.tar.gz
  cd "${dir}"
  mkdir build
  cd build
  LDFLAGS="-Wl,-rpath,'${ORIGIN_LD_RUN_PATH}:${BUILD_LD_RUN_PATH}'" \
    ../configure --prefix="${DEVEL_HOME_PATH}/opt/${package}" \
    --with-ssl=openssl --with-libssl-prefix="${DEVEL_HOME_PATH}/opt/openssl"
  make -j "${NUM_CORES}"
  make install
  popd > /dev/null

  setup_package "${package}"
}

setup_bzip2() {
  local package='bzip2'
  echo -e "\033[32;1mStart to setup ${package}.\033[0m"
  pushd "${PACKAGES_PATH}" > /dev/null
  local dir='bzip2-1.0.8'
  rm -rf "${dir}" && tar -zxvf bzip2-latest.tar.gz
  cd "${dir}"
  make install PREFIX="${DEVEL_HOME_PATH}/opt/${package}" -j "${NUM_CORES}"
  make clean
  make -f Makefile-libbz2_so
  mv libbz2.so* "${DEVEL_HOME_PATH}/opt/${package}/lib"
  cd "${DEVEL_HOME_PATH}/opt/${package}/lib"
  ln -s libbz2.so.1.0 libbz2.so
  popd > /dev/null

  setup_package "${package}"
}

setup_python() {
  local package='python'
  echo -e "\033[32;1mStart to setup ${package}.\033[0m"
  pushd "${PACKAGES_PATH}" > /dev/null
  local dir='Python-3.9.5'
  rm -rf "${dir}" && tar -zxvf Python-3.9.5.tgz
  cd "${dir}"
  mkdir build
  cd build
  CFLAGS="-DHAVE_NCURSES_H -DHAVE_NCURSESW -I${DEVEL_HOME_PATH}/include/ncursesw" \
    LDFLAGS="-Wl,-rpath,'${ORIGIN_LD_RUN_PATH}' -Wl,-rpath,${BUILD_LD_RUN_PATH} -L${DEVEL_HOME_PATH}/lib" \
    LIBS='-ltinfow -lncursesw' \
    ../configure --prefix="${DEVEL_HOME_PATH}/opt/${package}" \
    --with-openssl="${DEVEL_HOME_PATH}/opt/openssl" --enable-shared --enable-optimizations
  make -j "${NUM_CORES}"
  make install
  cd "${DEVEL_HOME_PATH}/bin"
  ln -s python3 python
  ln -s python3-config python-config
  ln -s pip3 pip
  popd > /dev/null

  setup_package "${package}"
}

setup_git() {
  local package='git'
  echo -e "\033[32;1mStart to setup ${package}.\033[0m"
  pushd "${PACKAGES_PATH}" > /dev/null
  local dir='git-2.34.1'
  rm -rf "${dir}" && tar -zxvf git-2.34.1.tar.gz
  cd "${dir}"
  make configure
  ./configure --prefix="${DEVEL_HOME_PATH}/opt/git" --with-openssl="${DEVEL_HOME_PATH}/opt/openssl"
  make -j "${NUM_CORES}"
  make install
  popd > /dev/null

  setup_package "${package}"
}

setup_gmp() {
  local package='gmp'
  echo -e "\033[32;1mStart to setup ${package}.\033[0m"
  pushd "${PACKAGES_PATH}" > /dev/null
  local dir='gmp-6.2.1'
  rm -rf "${dir}" && tar -xvf gmp-6.2.1.tar.xz
  cd "${dir}"
  mkdir build
  cd build
  ../configure --prefix="${DEVEL_HOME_PATH}/opt/${package}"
  make -j "${NUM_CORES}"
  make install
  popd > /dev/null

  setup_package "${package}"
}

setup_gdb() {
  local package='gdb'
  echo -e "\033[32;1mStart to setup ${package}.\033[0m"
  pushd "${PACKAGES_PATH}" > /dev/null
  local dir='gdb-11.1'
  rm -rf "${dir}" && tar -zxvf gdb-11.1.tar.gz
  cd "${dir}"
  mkdir build
  cd build
  CFLAGS="-I${DEVEL_HOME_PATH}/include/python3.9" \
    LDFLAGS="-Wl,-rpath,'${ORIGIN_LD_RUN_PATH}' -Wl,-rpath,${BUILD_LD_RUN_PATH} -L${DEVEL_HOME_PATH}/lib" \
    LIBS='-lpython3' \
    ../configure --prefix="${DEVEL_HOME_PATH}/opt/${package}" --with-gmp="${DEVEL_HOME_PATH}/opt/gmp"
  make -j "${NUM_CORES}"
  make install
  popd > /dev/null

  setup_package "${package}"
}

setup_vim() {
  local package='vim'
  echo -e "\033[32;1mStart to setup ${package}.\033[0m"
  pushd "${PACKAGES_PATH}" > /dev/null
  local dir='vim-8.2.3918'
  rm -rf "${dir}" && tar -zxvf vim-8.2.3918.tar.gz
  cd "${dir}"
  CFLAGS="-I${DEVEL_HOME_PATH}/include/python3.9" \
    LDFLAGS="-Wl,-rpath,'\\${ORIGIN_LD_RUN_PATH}' -Wl,-rpath,${BUILD_LD_RUN_PATH} -L${DEVEL_HOME_PATH}/lib" \
    LIBS='-lpython3' \
    ./configure --prefix="${DEVEL_HOME_PATH}/opt/${package}" \
    --with-features=huge \
    --enable-python3interp=dynamic \
    --enable-cscope \
    --enable-terminal
  # $(shell echo $(LDFLAGS) | sed -n $'s/\(\\$$ORIGIN[^ ]* \)/\'\\$$\1\'/p')
  # shellcheck disable=SC1003
  local DOUBLE_BACKSLASH='\\\\'
  local cmd="/cd xxd;/s/\$(LDFLAGS)/"
  cmd+="\$(shell echo \$(LDFLAGS) | "
  cmd+="sed -n $'s\/\\\(${DOUBLE_BACKSLASH}\$\$ORIGIN[^ ]* \\\)\/\\\'${DOUBLE_BACKSLASH}\$\$\\\1\\\'\/p')/"
  sed -i "${cmd}" src/Makefile
  make -j "${NUM_CORES}"
  make install
  popd > /dev/null

  setup_package "${package}"
}

setup_all() {
  setup_autoconf
  setup_automake
  setup_libtool
  setup_make
  setup_pkg-config
  setup_patchelf
  setup_ncurses
  setup_readline
  setup_libffi
  setup_openssl
  setup_curl
  setup_wget
  setup_bzip2
  setup_python
  setup_git
  setup_gmp
  setup_gdb
  setup_vim
}

main() {
  mkdir -p "${DEVEL_HOME_PATH}"
  if [[ ! -f "${DEVEL_HOME_PATH}/setup_package.sh" ]]; then
    cp setup_package.sh "${DEVEL_HOME_PATH}"
  fi

  if [[ "${#@}" -eq 0 ]]; then
    setup_all
  elif [[ "${#@}" -eq 1 ]]; then
    local package="${1}"
    eval "setup_${package}"
  fi
}

main "${@}"
