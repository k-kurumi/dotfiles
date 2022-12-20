eval "$(sheldon source)"

# 補完時に大文字小文字の区別をなくす
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# 補完時にtabで選択
zstyle ':completion:*:default' menu select=1

# 補完用のファイル読み込み
mkdir -p ~/.zsh_completion
if [[ -d ~/.zsh_completion ]]; then

  # go-task
  [[ -f ~/.zsh_completion/_task ]] || curl -o ~/.zsh_completion/_task https://raw.githubusercontent.com/go-task/task/master/completion/zsh/_task

  fpath=( ~/.zsh_completion "${fpath[@]}" )
  for f in ~/.zsh_completion/_*
  do
    autoload -Uz ${f}
  done
fi

# これがないとmacでzsh-completionsが効かない
autoload -Uz compinit && compinit

# 環境変数を補完
setopt AUTO_PARAM_KEYS

export EDITOR=nvim
export VISUAL=nvim # macのcrontabが参照する
export LANGUAGE=en
export LANG=en_US.UTF-8

export XDG_CONFIG_HOME="${HOME}/.config"

# ^を展開しないようにするためgitでHEAD^などがエスケープなしで使えるようになる
unsetopt extended_glob

# <c-a>などのemacsキーバインドを有効にする
bindkey -e
# <C-w>でフォルダパス単位の削除するため
export WORDCHARS='*?_.[]~-=&;!#$%^(){}<>'

# history周り
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=1000000
setopt hist_ignore_all_dups  # 重複するコマンド行は古い方を削除
setopt hist_ignore_dups      # 直前と同じコマンドラインはヒストリに追加しない
setopt share_history         # コマンド履歴ファイルを共有する
setopt append_history        # 履歴を追加 (毎回 .zsh_history を作るのではなく)
setopt inc_append_history    # 履歴をインクリメンタルに追加
setopt hist_no_store         # historyコマンドは履歴に登録しない
setopt hist_reduce_blanks    # 余分な空白は詰めて記録
zstyle ':completion:*:default' menu select

# パスを直接入力してもcdする
setopt AUTO_CD

export PURE_PROMPT_SYMBOL=$

################################################################################

# mac(arm)
test -f /opt/homebrew/opt/asdf/libexec/asdf.sh && source /opt/homebrew/opt/asdf/libexec/asdf.sh

# mac(intel)
test -f /usr/local/opt/asdf/libexec/asdf.sh && source /usr/local/opt/asdf/libexec/asdf.sh

if [[ $(uname) == Darwin ]];then
  # brewでインストールしたpyenvでzlibのパスがみつからない対策
  export LDFLAGS="-L/usr/local/opt/zlib/lib"
  export CPPFLAGS="-I/usr/local/opt/zlib/include"
fi

# nim
if [[ -d ~/.nimble/bin ]]; then
  export PATH="${HOME}/.nimble/bin:$PATH"
fi

# golang(1.8のデフォルトとは違う)
if [[ -d ~/go ]]; then
  export GOPATH=${HOME}/dev
  export PATH=${GOPATH}/bin:${PATH}
  export GOROOT=${HOME}/go
  export PATH=${GOROOT}/bin:${PATH}
  export GO111MODULE=on
  go env -w GO111MODULE=on
fi

# rust
if [[ -d ~/.cargo ]]; then
  source ${HOME}/.cargo/env
fi

# direnv
if type direnv > /dev/null; then
  eval "$(direnv hook zsh)"
fi

if [[ -d ~/.local/bin ]]; then
  export PATH=${PATH}:~/.local/bin
fi

if [[ -d ~/dotfiles/bin ]]; then
  export PATH=${PATH}:~/dotfiles/bin
fi

# ~/.gcloudrc は ./google-cloud-sdk/install.sh 実行時に指定して作成する
if [[ -f ~/.gcloudrc ]]; then
  source ~/.gcloudrc
fi

################################################################################
# alias

# -v: 自然な並び順
# 標準の ll='ls -lh' では 頭の_が考慮されない
alias ll='ls -lv'

if type trash > /dev/null; then
  alias rm='trash'
fi

# デフォルトで隠しファイルまで対象にする
alias ag='ag --hidden'
alias rg="rg --hidden --glob '!.git/'"

alias tmpfile='nvim $(mktemp)'

# vim-fugitive
# alias g='nvim -c G -c only'

################################################################################
# function

# json to yaml
function j2y() {
  ruby -ryaml -rjson -e 'puts YAML.dump(JSON.load(ARGF.read))'
}
# yaml to json
function y2j() {
  ruby -ryaml -rjson -e 'puts JSON.pretty_generate(YAML.load(ARGF.read))'
}

# mkdir-p風にフォルダを作ってからtouchする
function touch_p() {
  for item in $@
  do
    echo "touch: ${item}"
    mkdir -p $(dirname ${item})
    touch ${item}
  done
}

# $ echo abc_def | camel_case
# AbcDef
function camel_case() {
  perl -pe 's#(_|^)(.)#\u$2#g'
}

# $ echo AbcDef | snake_case
# abc_def
function snake_case() {
  perl -pe 's#([A-Z])#_\L$1#g' | perl -pe 's#^_##'
}

# tmuxとguakeのリネーム
function t() {
  # 引数なしはカレントフォルダ名にする
  local name=${1:-$(basename $PWD)}
  pgrep guake > /dev/null && guake -r "${name}"
  pgrep tmux  > /dev/null && tmux rename-session "${name}"
}

# # 指定したファイルをクリップボードに取り込む
# function c() {
#   # 引数なしは何もしない
#   [[ $# -eq 0 ]] && return
#   type xsel > /dev/null && cat "${1}" | xsel -bi
# }

# dockerhubのタグリストの表示(webだとページングされて見づらいため)
function dockerhub_tag_search {
  # 引数なしは何もしない
  if [[ $# -eq 0 ]]; then
    >&2 echo "usage: $0 <dockerhub-repo-name>"
    return 1
  fi

  local repo=${1}
  curl -s https://registry.hub.docker.com/v1/repositories/${repo}/tags | jq -r '.[]| .name' | fzf
}

# 簡易HTTPサーバ
function httpd_rb() {
  local port=${1:-8000}
  ruby -run -e httpd . -p "${port}"
}

# sleepの秒数表示
function sleep2() {
  # 時間が指定されていないとき何もしない
  [[ $# -eq 0 ]] && return
  local max=${1}
  local t=0
  while ((t < max))
  do
    ((t++))
    sleep 1
    echo -n "$t "
  done
}

# vimwiki
function wiki() {
  tmux rename-window wiki-neovim
  cd ~/vimwiki; nvim index.md; cd -
  tmux rename-window zsh
}

################################################################################
# fzf

# ^Tでファイル補完ができるので不要になった
# # フォルダは移動する
# # ファイルはvimで開く
# function fzf_open_file() {
#   local selected=$(find . -not -path './.git/*' -print 2> /dev/null | fzf)
#   echo $selected
#   if [ -n "$selected" ]; then
#     if [[ -d "$selected" ]]; then
#       BUFFER="cd ${selected}"
#     else
#       BUFFER="nvim ${selected}"
#     fi
#     zle accept-line
#   fi
#   zle clear-screen
# }
# zle -N fzf_open_file
# bindkey '^O' fzf_open_file

# history表示
function fzf_select_history() {
  BUFFER=$(history -n 1 | fzf)
  zle clear-screen
}
zle -N fzf_select_history
bindkey '^R' fzf_select_history

# ghqリポジトリに移動する
function fzf_select_ghq_repo() {
  local selected_dir=$(ghq list -p | fzf)
  echo $selected_dir
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N fzf_select_ghq_repo
bindkey '^G' fzf_select_ghq_repo

# コマンドをエディタで編集する
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^O' edit-command-line

# read private config
if [[ -d ~/OneDrive/dotfiles_private ]]; then
  for f in ~/OneDrive/dotfiles_private/*.sh
  do
    [[ -e "$f" ]] || break
    source "${f}"
  done
fi

# fzfだけ打ったときの元データ(vimのfzfも同じ)
# --hidden: 隠しファイル表示する
# --skip-vcs-ignores: .gitignoreを無視して表示する
# --ignore-dir: .gitフォルダは無視する
# --filename-pattern: find . 相当のファイル一覧表示
# export FZF_DEFAULT_COMMAND='ag --hidden --skip-vcs-ignores --ignore-dir ".git" --filename-pattern ""'
#
# rg版
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# PC情報の表示
type neofetch > /dev/null && neofetch || :
