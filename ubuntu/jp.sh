#!/bin/bash
#
# install jp http://jmespath.org/tutorial.html

version=0.1.3

pushd /tmp
  rm -rf jp
  wget https://github.com/jmespath/jp/releases/download/${version}/jp-linux-amd64 -O jp
  chmod +x jp
  sudo mv jp /usr/local/bin/
popd
