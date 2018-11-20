#!/bin/bash
#
# macvim: gvim相当

set -e
set -x

brew install lua
brew install vim --with-luajit

# xcode(gui)が必要らしい(xcode(cli)だけではエラー)
# brew install macvim --with-lua
