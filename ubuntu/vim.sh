#!/bin/bash
#
# install vim
# https://vim-jp.org/docs/build_linux.html

set -e
set -x

sudo apt-get update

if [[ -z ${DISPLAY} ]]; then

  # CUIのみ
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

else

  # GUIあり
  sudo apt-get install -y \
    ncurses-dev \
    python-dev \
    python3-dev \
    ruby-dev \
    lua5.2 \
    lua5.2-dev \
    luajit \
    libxmu-dev \
    libgtk-3-dev \
    libxpm-dev \
    git

  # libxmu-dev libgtk-3-dev libxpm-dev

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
        --enable-gui=gtk3 \
        --enable-fail-if-missing
      make
      sudo make install
    popd
  popd

fi
