#!/bin/bash
#
# install vim

set -e
set -x

sudo apt-get update
sudo apt-get install -y \
  ncurses-dev \
  python-dev \
  python3-dev \
  ruby-dev \
  lua5.2 \
  lua5.2-dev \
  luajit \
  git

pushd /tmp
  rm -rf vim
  git clone git@github.com:vim/vim.git

  pushd vim

    ./configure \
      --with-features=huge \
      --enable-multibyte \
      --enable-pythoninterp=yes \
      --enable-python3interp=yes \
      --enable-rubyinterp=yes \
      --enable-luainterp=yes \
      --enable-cscope \
      --enable-gpm \
      --enable-fail-if-missing

    make
    sudo make install
  popd

popd
