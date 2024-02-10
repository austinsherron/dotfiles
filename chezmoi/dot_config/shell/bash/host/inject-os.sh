#!/usr/bin/env bash


## inject os specific config ###################################################

OS="$(os-type)"
export OS_ROOT="${HOST_CONFIG_ROOT}/${OS}"
OSRC="${OS_ROOT}/osrc"

# this machine os specific config
if [[ -f "${OSRC}" ]]; then
    source "${OSRC}"
else
    echo "[WARN] no os specific config found for os='${OS}' (path=${OSRC})"
fi

