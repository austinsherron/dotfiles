#!/usr/bin/env bash


## inject os specific config ###################################################

OS="$(os-type)"
OSRC="${HOST_CONFIG_ROOT}/${OS}/osrc"

# this machine os specific config
if [[ -f "${OSRC}" ]]; then
    source "${OSRC}"
else
    echo "[WARN] no os specific config found for os='${OS}' (path=${OSRC})"
fi

