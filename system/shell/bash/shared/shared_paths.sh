#!/bin/bash


comment() {
cat <<comment
This script contains paths shared by the admin user (aka: me, Austin) and the 
super user.
comment
}


## administrator ###############################################################

#### source

# roots
export readonly ADMIN_HOME="/home/austin"
export readonly DEV_ROOT="${ADMIN_HOME}/Workspace"
export readonly CONFIG_ROOT="${DEV_ROOT}/dotfiles"
export readonly CODE_ROOT="${DEV_ROOT}/workspace"
export readonly TOOLING_ROOT="${CONFIG_ROOT}/tooling"

# executables
export readonly TOOLS_ROOT="${CODE_ROOT}/tools"

# config
export readonly INT_TOOLING_ROOT="${TOOLING_ROOT}/internal"

#### shared paths

## interface points

# external repo staging/storage
# TODO: consider renaming to "EXTERNAL_REPOS", or something like that
# TODO: consider moving this out of my (Austin's) home dir
export readonly EXTERNAL_PKGS="${DEV_ROOT}/external"

# root
export readonly USR_LOCAL="/usr/local"
# dest for shared execs...
export readonly SHARED_BINS="${USR_LOCAL}/bin"
# ...config
export readonly SHARED_CONFIG_ROOT="${USR_LOCAL}/etc"

## application/executable specific paths

export readonly GO_ROOT="${USR_LOCAL}/go"

