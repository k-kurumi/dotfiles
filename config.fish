#
# 追加でインストールするプラグイン
# omf install toaster
# omf install peco
#
# omf installでrbenvなどの*env系は使えないものばかりなのでインストールしない
#

set -x EDITOR vim

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

# ndenvはinitするとエラー(記述が古い？)
set -x PATH $HOME/.ndenv/bin $PATH
set -x PATH $HOME/.ndenv/shims $PATH

# direnvは最後に実行する
eval (direnv hook fish)
