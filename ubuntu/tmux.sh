#!/bin/bash -x
#
# install tmux

version=2.7

sudo apt-get update
sudo apt-get install -y \
  libevent-dev \
  libncurses5-dev \
  git

pushd /tmp
  rm -rf tmux*
  wget https://github.com/tmux/tmux/releases/download/${version}/tmux-${version}.tar.gz
  tar zxvf tmux-${version}.tar.gz

  pushd tmux-${version}
    ./configure && make
    sudo make install
  popd

popd
