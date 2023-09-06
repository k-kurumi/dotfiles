#!/bin/bash
#
# install astronvim and config
#

if [[ -d ~/.config/nvim/.git ]]; then
  pushd ~/.config/nvim || exit 1
    # デフォルトのhlsearch周りが気に入らないので修正した部分をstash
    git stash
    git pull
    git stash pop
  popd || exit 1
else
  mv ~/.config/nvim ~/.config/nvim.bak
  mv ~/.local/share/nvim ~/.local/share/nvim.bak
  mv ~/.local/state/nvim ~/.local/state/nvim.bak
  mv ~/.cache/nvim ~/.cache/nvim.bak
  git clone --depth 1 https://github.com/AstroNvim/AstroNvim ~/.config/nvim
fi

if [[ -d ~/.config/nvim/lua/user/.git ]]; then
  pushd ~/.config/nvim/lua/user || exit 1
    git pull
  popd || exit 1
else
  mv ~/.config/nvim/lua/user /tmp
  git clone git@github.com:k-kurumi/astronvim_config.git ~/.config/nvim/lua/user
fi
