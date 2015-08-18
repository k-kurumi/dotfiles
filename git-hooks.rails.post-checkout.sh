#!/bin/bash
#
# git checkoutで大きくソースが変更されるとspring(rails)が
# 原因でおかしくなる(cucumber沈黙など)ためkillする

if [ -x bin/spring ]; then
  bin/spring stop
else
  # とりあえず強制kill
  ps ax | grep spring | cut -f1 -d' ' | xargs kill
fi
