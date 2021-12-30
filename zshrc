export DEVEL_HOME_PATH="${HOME}/devel"

export PKG_CONFIG_PATH="${DEVEL_HOME_PATH}/lib/pkgconfig:${PKG_CONFIG_PATH}"
export ACLOCAL_PATH="${DEVEL_HOME_PATH}/share/aclocal:${ACLOCAL_PATH}"

export CPATH="${DEVEL_HOME_PATH}/include"
export LD_RUN_PATH="\$ORIGIN/../lib:${DEVEL_HOME_PATH}/lib:${LD_RUN_PATH}"
