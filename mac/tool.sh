#!/bin/bash

brew install lua
brew install vim --with-luajit
# xcode(gui)が必要らしい(xcode(cli)だけではエラー)
# brew install macvim --with-lua

brew install zsh
brew install tmux
brew install tree
brew install mosh

brew cleanup
