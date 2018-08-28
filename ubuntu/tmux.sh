#!/bin/bash -x
#
# install tmux

sudo apt-get update
sudo apt-get install -y \
  libevent-dev \
  libncurses5-dev \
  git

pushd /tmp
  rm -rf tmux*
  wget https://github.com/tmux/tmux/releases/download/2.7/tmux-2.7.tar.gz
  tar zxvf tmux-2.7.tar.gz

  pushd tmux-2.7
    ./configure && make
    sudo make install
  popd

popd
