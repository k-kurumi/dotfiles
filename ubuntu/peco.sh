#!/bin/bash -x
#
# install peco

pushd /tmp
  rm -rf peco*
  wget https://github.com/peco/peco/releases/download/v0.5.3/peco_linux_arm64.tar.gz
  tar zxvf peco_linux_arm64.tar.gz
  sudo mv peco_linux_arm64/peco/peco /usr/local/bin/
popd
