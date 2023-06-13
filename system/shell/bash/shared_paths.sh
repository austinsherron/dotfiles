#!/bin/bash

## administrator ###############################################################

## source

# root
export readonly ADMIN_HOME="/home/austin"
export readonly DEV_ROOT="${ADMIN_HOME}/Workspace"
export readonly CONFIG_ROOT="${DEV_ROOT}/dotfiles"
export readonly PROJECTS_ROOT="${DEV_ROOT}/projects"
export readonly TOOLING_ROOT="${CONFIG_ROOT}/tooling"

# exec
export readonly TOOLS_ROOT="${PROJECTS_ROOT}/tools"

# config
export readonly INT_TOOLING_ROOT="${TOOLING_ROOT}/internal"

## shared

# root
export readonly SHARED_ROOT="/usr/local"
# dest for shared execs...
export readonly SHARED_BINS="/usr/local/bin"
# ...config
export readonly SHARED_CONFIG_ROOT="/usr/local/etc"

