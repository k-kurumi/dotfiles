#!/bin/bash
#
# 分離した理由はomfの後はシェルが終了してしまうため
# omf install toasterは既存のpromptをリネームするため
# このスクリプトを先に実行する

# install oh-my-fish
curl -L http://get.oh-my.fish | fish

# install omf plugin
omf install peco
omf install toaster
