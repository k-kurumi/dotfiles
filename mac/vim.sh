#!/bin/bash

set -e
set -x

# reinstallではエラーになることがあるため
brew uninstall vim

brew install lua

# デフォルトで +ruby +python が付く
brew install vim --with-luajit
