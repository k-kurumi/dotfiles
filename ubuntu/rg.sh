#!/bin/bash -x
#
# install ripgrep

version=0.10.0

pushd /tmp
  rm -rf ripgrep-*
  wget "https://github.com/BurntSushi/ripgrep/releases/download/${version}/ripgrep-${version}-x86_64-unknown-linux-musl.tar.gz"
  tar zxvf ripgrep-${version}-x86_64-unknown-linux-musl.tar.gz
  sudo cp -f ripgrep-${version}-x86_64-unknown-linux-musl/rg /usr/local/bin/
popd
