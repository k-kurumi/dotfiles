#!/bin/bash -x
#
# install peco

version=v0.5.3

pushd /tmp
  rm -rf peco*
  wget https://github.com/peco/peco/releases/download/${version}/peco_linux_amd64.tar.gz
  tar zxvf peco_linux_amd64.tar.gz
  sudo mv peco_linux_amd64/peco /usr/local/bin/
popd
