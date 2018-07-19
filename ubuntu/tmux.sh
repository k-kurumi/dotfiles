#!/bin/bash
#
# install latest tmux

sudo apt-get update
sudo apt-get install -y \
  libevent-dev \
  libncurses5-dev \
  git

pushd /tmp
  rm -rf tmux
  git clone git@github.com:tmux/tmux.git

  pushd vim
    ./configure
    make
    sudo make install
  popd

popd
