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

# zのインストール方法
# omf install z して
# git clone https://github.com/rupa/z このz.shを指定する
set -g Z_SCRIPT_PATH $HOME/.config/z/z.sh
# git clone https://github.com/sjl/z-fish して.config/fish/functions にln -sする(来れなくても動くので不要かも)

# direnv読み込み
eval (direnv hook fish)

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
