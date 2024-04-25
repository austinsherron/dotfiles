#!/usr/bin/env bash

source "${BASH_LIB}/utils/sys.sh"


## inject os specific config ###################################################

OS="$(sys::os_type)"
export OS_ROOT="${HOST_CONFIG_ROOT}/${OS}"
OSRC="${OS_ROOT}/osrc"

# this machine os specific config
if [[ -f "${OSRC}" ]]; then
    source "${OSRC}"
else
    echo "[WARN] no os specific config found for os='${OS}' (path=${OSRC})"
fi

