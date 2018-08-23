#!/bin/bash -x
#
# require: gnu readlink

mkdir -p ~/.hammerspoon
ln -sf $(readlink -f .hammerspoon/init.lua) ~/.hammerspoon/
