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
.ideavimrc
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

# install oh-my-fish
curl -L http://get.oh-my.fish | fish

# install omf plugin
omf install peco
omf install toaster

# toaster base prompt
ln -sf `pwd`/fish_prompt.fish ~/.config/fish/functions/

# fishの設定ファイル
ln -sf `pwd`/config.fish ~/.config/fish/
