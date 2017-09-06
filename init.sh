#!/bin/bash -ex
#
# dotfileを置き換え

temp="/tmp/dotfiles_`date '+%s'`"
mkdir -p $temp

echo ".Xmodmap
.ackrc
.ctags
.eslintrc.yml
.gitignore_global
.ideavimrc
.peco
.pryrc
.railsrc
.tigrc
.tmux.conf
.tmux.linux.conf
.tmux.mac.conf
.zshrc2
.vimrc" | while read f
do
  echo "mv $HOME/$f $temp"
  mv $HOME/$f $temp

  echo "ln -sf `pwd`/$f $HOME"
  ln -sf `pwd`/$f $HOME

  echo "---"
done

# ghqの設定
mkdir -p ~/dev/src
mkdir -p ~/dev/bin

grep ghq ~/.gitconfig
if [ $? -ne 0 ]; then
  echo "[ghq]"              >> ~/.gitconfig
  echo "  root = ~/dev/src" >> ~/.gitconfig
fi


# preztoの設定ファイルに置き換え
# readmeの手順をbashで実現したもの
# https://github.com/sorin-ionescu/prezto
while read rcfile
do
  ln -sf ${rcfile} ~/.$(basename ${rcfile})
done < <(find "${ZDOTDIR:-$HOME}/.zprezto/runcoms" -maxdepth 1 -type f -name 'z*')

# 設定の追加分
grep .zshrc2 ~/.zshrc
if [ $? -ne 0 ]; then
  echo 'source ${HOME}/.zshrc2' >> ~/.zshrc
fi


# yamllintのconfig
mkdir -p ~/.config/yamllint
cp .config/yamllint/config ~/.config/yamllint
