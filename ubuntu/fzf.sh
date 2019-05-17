#!/bin/bash -x
#
# install fzf

version=0.18.0

pushd /tmp
  rm -rf fzf*
  wget https://github.com/junegunn/fzf-bin/releases/download/${version}/fzf-${version}-linux_amd64.tgz
  tar zxvf fzf-${version}-linux_amd64.tgz
  sudo mv fzf /usr/local/bin/
popd
