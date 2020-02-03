#!/bin/bash -x
#
# install ghq

version=v1.1.0

pushd /tmp
  rm -rf ghq_linux_amd64*
  wget "https://github.com/motemen/ghq/releases/download/${version}/ghq_linux_amd64.zip"
  unzip ghq_linux_amd64.zip
  sudo cp -f ghq_linux_amd64/ghq /usr/local/bin/
popd
