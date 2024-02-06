#!/usr/bin/env bash


comment() {
cat <<comment
This script contains paths shared by the admin user (aka: me, Austin) and the root user.
comment
}


## administrator ###############################################################

#### source

# roots
export DEV_ROOT="${ADMIN_HOME}/Workspace"
export CONFIG_ROOT="${DEV_ROOT}/dotfiles"
export CODE_ROOT="${DEV_ROOT}/workspace"
export TOOLING_ROOT="${CONFIG_ROOT}/tooling"

# executables
export TOOLS_ROOT="${CODE_ROOT}/tools"

# config
export INT_TOOLING_ROOT="${TOOLING_ROOT}/internal"

#### shared paths

## interface points

# external repo staging/storage
# TODO: consider renaming to "EXTERNAL_REPOS", or something like that
# TODO: consider moving this out of my (Austin's) home dir
export EXTERNAL_PKGS="${DEV_ROOT}/external"

# root
export USR_LOCAL="/usr/local"
export BIN_PARENT="${USR_LOCAL}"
# dest for shared execs...
export SHARED_BINS="${USR_LOCAL}/bin"
# TODO: replace used of SHARED_BINS w/ BIN
export BIN="${SHARED_BINS}"
# ...config
export SHARED_CONFIG_ROOT="${USR_LOCAL}/etc"

## application/executable specific paths

export GO_ROOT="${USR_LOCAL}/go"

