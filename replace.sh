#!/bin/bash
#
# dotfileを置き換え

temp="/tmp/dotfiles_`date '+%s'`"
mkdir -p $temp

echo ".Xmodmap
.ackrc
.ctags
.gitignore_global
.railsrc
.tigrc
.tmux.conf
.vimrc
.zshrc
.ideavimrc
.cftools
.pryrc
.peco" | while read f
do
  echo "mv $HOME/$f $temp"
  mv $HOME/$f $temp

  echo "ln -s `pwd`/$f $HOME"
  ln -s `pwd`/$f $HOME

  echo "---"
done

mkdir -p $HOME/_app/bin
cp cmd/* $HOME/_app/bin
chmod +x $HOME/_app/bin/*
