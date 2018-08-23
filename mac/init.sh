#!/bin/bash -x


mkdir -p ~/.hammerspoon
# hammerspoonはシンボリックリンクが読めない模様
cp -f .hammerspoon/init.lua ~/.hammerspoon/init.lua
