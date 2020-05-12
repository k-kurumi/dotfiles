#!/bin/bash

set -e
set -x

version=2.5.1

sudo apt-get update
sudo apt-get install -y \
  libncursesw5 \
  libncursesw5-dev

pushd /tmp

  rm -rf tig-*
  wget https://github.com/jonas/tig/releases/download/tig-${version}/tig-${version}.tar.gz
  tar zxvf tig-${version}.tar.gz

  pushd tig-${version}
    make configure
    LDLIBS=-lncursesw CFLAGS=-I/usr/include/ncursesw ./configure --prefix=/usr/local
    make
    sudo make install
  popd

popd
