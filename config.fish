#
# 追加でインストールするプラグイン
# omf install toaster
# omf install peco
#
# omf installでrbenvなどの*env系は使えないものばかりなのでインストールしない
#

set -x EDITOR vim

switch (uname)
case Darwin
  # javaはインストーラで場所指定できないがPATHが通ったところに入るためJAVA_HOME指定はしない

case Linux
  # java
  set -x JAVA_HOME $HOME/_app/jdk
  mkdir -p $JAVA_HOME
  set -x PATH $JAVA_HOME/bin $PATH
end

# その他の個人ツール
set local_bin ~/_app/bin
mkdir -p $local_bin
set -x PATH $local_bin $PATH

# golang
set -x GOROOT $HOME/go
set -x PATH $GOROOT/bin $PATH
set -x GOPATH $HOME/dev
set -x PATH $GOPATH/bin $PATH

# <C-r>でpecoで履歴検索
function fish_user_key_bindings
  bind \cr 'peco_select_history (commandline -b)'
end

# rbenv
# macはbrewで入れて ln -s /usr/local/bin/rbenv ~/.rbenv/bin/ しておく
set -x PATH $HOME/.rbenv/bin $PATH
rbenv init - | source

# pyenv
set -x PATH $HOME/.pyenv/bin $PATH
pyenv init - | source

# node.js
set -x PATH $HOME/.nodebrew/current/bin $PATH


# direnvは最後に実行する
eval (direnv hook fish)
