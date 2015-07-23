#!/bin/bash

echo "*env update"

if [ -d ~/.ndenv ]; then
  echo "-- ndenv --"
  cd ~/.ndenv && git pull
  cd ~/.ndenv/plugins/node-build && git pull
fi

if [ -d ~/.rbenv ]; then
  echo "-- rbenv --"
  cd ~/.rbenv && git pull
  cd ~/.rbenv/plugins/ruby-build && git pull
fi

if [ -d ~/.pyenv ]; then
  echo "-- pyenv --"
  cd ~/.pyenv && git pull
  cd ~/.pyenv/plugins/python-build && git pull
  cd ~/.pyenv/plugins/pyenv-virtualenv && git pull
fi

echo "---"
echo "*env update finished"
