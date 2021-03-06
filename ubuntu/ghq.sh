#!/bin/bash
#
# install ghq
# https://github.com/x-motemen/ghq/releases

version=v1.1.5

pushd /tmp
  rm -rf ghq_linux_amd64*
  wget "https://github.com/x-motemen/ghq/releases/download/${version}/ghq_linux_amd64.zip"
  unzip ghq_linux_amd64.zip
  sudo cp -f ghq_linux_amd64/ghq /usr/local/bin/
popd
