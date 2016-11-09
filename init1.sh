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

  echo "ln -sf `pwd`/$f $HOME"
  ln -sf `pwd`/$f $HOME

  echo "---"
done


# fish functions
mkdir -p ~/.config/fish/functions
ln -sf `pwd`/fish/functions/* ~/.config/fish/functions/

# toaster base prompt
ln -sf `pwd`/fish_prompt.fish ~/.config/fish/functions/fish_prompt.fish

# fishの設定ファイル
ln -sf `pwd`/config.fish ~/.config/fish/config.fish
