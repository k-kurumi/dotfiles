#!/bin/bash
#
# install latest vim

sudo apt-get update
sudo apt-get install -y \
  python-dev \
  ruby-dev \
  luajit \
  liblua5.2-dev \
  git

pushd /tmp
  rm -rf vim
  git clone git@github.com:vim/vim.git

  pushd vim
    ./configure \
      --with-features=huge \
      --enable-multibyte \
      --enable-pythoninterp=yes \
      --enable-pythoninterp=yes \
      --enable-rubyinterp=yes \
      --enable-luainterp=yes \
      --enable-cscope \
      --enable-gpm \
      --enable-cscope \
      --enable-fail-if-missing
    make
    sudo make install
  popd

popd
