#!/bin/bash

## config ######################################################################

export STARSHIP_CONFIG="${CONFIG_ROOT_PUB}/starship.toml"

## init ########################################################################

## init starship prompt

eval "$(starship init bash)"

