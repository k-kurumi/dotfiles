#!/bin/bash
#
# install latest pt

version=${1:-v2.1.6}

pushd /tmp
  rm -rf pt_linux_amd64*
  wget "https://github.com/monochromegane/the_platinum_searcher/releases/download/${version}/pt_linux_amd64.tar.gz"
  tar zxvf pt_linux_amd64.tar.gz
  sudo cp -f pt_linux_amd64/pt /usr/local/bin/
popd
