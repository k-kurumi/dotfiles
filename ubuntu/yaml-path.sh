#!/bin/bash
#
# install yaml-path
# https://github.com/psycofdj/yaml-path/releases

version=0.4

pushd /tmp
  rm -rf yaml-path*
  wget https://github.com/psycofdj/yaml-path/releases/download/v${version}/yaml-path-${version}.linux-amd64.tar.gz
  tar zxvf yaml-path-${version}.linux-amd64.tar.gz
  sudo mv yaml-path-${version}.linux-amd64/yaml-path /usr/local/bin/
popd
