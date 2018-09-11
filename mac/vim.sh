#!/bin/bash
#
# macvim: gvim相当

set -e
set -x

# reinstallではエラーになることがあるため
brew uninstall vim
brew uninstall macvim

brew cleanup vim
brew cleanup macvim

brew install lua

brew install vim --with-luajit
brew install macvim --with-lua
