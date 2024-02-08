#!/usr/bin/env bash


## inject host specific config #################################################

HOST="$(host-id)"
HOST_ROOT="${HOST_CONFIG_ROOT}/${HOST}"
HOSTRC="${HOST_ROOT}/hostrc"

# this machine's host specific config
if [[ -f "${HOSTRC}" ]]; then
    source "${HOSTRC}"
else
    echo "[WARN] no host specific config found for host='${HOST}' (path=${HOSTRC})"
fi

HOST_APPEARANCE="${HOST_ROOT}/appearance.sh"

# source optional appearance customization file, if it exists
if [[ -f "${HOST_APPEARANCE}" ]]; then
    source "${HOST_APPEARANCE}"
fi

