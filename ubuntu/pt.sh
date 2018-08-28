#!/bin/bash -x
#
# install pt

version=$(curl -s https://api.github.com/repos/monochromegane/the_platinum_searcher/tags | jq -r '.[0].name')

pushd /tmp
  rm -rf pt_linux_amd64*
  wget "https://github.com/monochromegane/the_platinum_searcher/releases/download/${version}/pt_linux_amd64.tar.gz"
  tar zxvf pt_linux_amd64.tar.gz
  sudo cp -f pt_linux_amd64/pt /usr/local/bin/
popd
