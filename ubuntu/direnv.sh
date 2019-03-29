#!/bin/bash
#
# install direnv

version=v2.19.2

pushd /tmp
  rm -rf direnv*
  wget https://github.com/direnv/direnv/releases/download/${version}/direnv.linux-amd64 -O direnv
  chmod +x direnv
  sudo mv direnv /usr/local/bin/
popd
