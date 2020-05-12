#!/bin/bash -x
#
# install tmux

# 2.9でまた設定ファイルの書き方が変わったのでコンバートする
# https://gist.github.com/tbutts/6abf7fb5b948c066bf180922fb37adcf
version=3.1b

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
