#!/usr/bin/env bash

## config ######################################################################

export STARSHIP_CONFIG="${CONFIG_ROOT_PUB}/starship.toml"

## init ########################################################################

eval "$(starship init bash)"

