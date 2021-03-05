#!/bin/bash
#
# install fzf
#
# https://github.com/junegunn/fzf.vim#dependencies
# vim+fzfのオプションツール
# bat:    色付きcat
# delta:  色付きgit-diff

version_bat=0.18.0
version_delta=0.6.0

pushd /tmp
  rm -rf bat_*
  wget "https://github.com/sharkdp/bat/releases/download/v${version_bat}/bat_${version_bat}_amd64.deb"
  sudo dpkg -i bat_${version_bat}_amd64.deb

  rm -rf delta_*
  wget "https://github.com/dandavison/delta/releases/download/${version_delta}/git-delta_${version_delta}_amd64.deb"
  sudo dpkg -i git-delta_${version_delta}_amd64.deb
popd

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
