### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk

# https://github.com/zdharma/zinit#cloning-options
# ice wait で遅延読み込み, !0 で読み込み完了を非表示

# 非同期処理
# https://github.com/mafredri/zsh-async
zinit load "mafredri/zsh-async"

# シンプルなプロンプト
# https://github.com/sindresorhus/pure
zinit load "sindresorhus/pure"

  # プロンプトを $ に変更
  export PURE_PROMPT_SYMBOL=$

# 構文のハイライト
# https://github.com/zsh-users/zsh-syntax-highlighting
zinit ice wait'!0'; zinit light "zsh-users/zsh-syntax-highlighting"

# コマンド入力途中で上下キー押したときの過去履歴がいい感じに出るようになる
# https://github.com/zsh-users/zsh-history-substring-search
zinit load "zsh-users/zsh-history-substring-search"

# 過去に入力したコマンドの履歴が灰色のサジェストで出る
zinit load "zsh-users/zsh-autosuggestions"

# 256色表示にする
zinit load "chrissicool/zsh-256color"

# 補完強化
zinit ice wait'!0'; zinit light "zsh-users/zsh-completions"

  # 補完時に大文字小文字の区別をなくす
  zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

  # 補完時にtabで選択
  zstyle ':completion:*:default' menu select=1

  # これがないとmacでzsh-completionsが効かない
  autoload -Uz compinit && compinit

  # 環境変数を補完
  setopt AUTO_PARAM_KEYS

export EDITOR=nvim
export VISUAL=nvim # macのcrontabが参照する
export LANGUAGE=en
export LANG=en_US.UTF-8

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

################################################################################

# ruby
if [[ -d ~/.rbenv ]]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  export PATH="$HOME/.rbenv/shims:$PATH"  # /usr/local/bin/rubyが先に読まれるため上書きする
fi

# python
if [[ -d ~/.pyenv ]]; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
fi

if [[ $(uname) == Darwin ]];then
  # brewでインストールしたpyenvでzlibのパスがみつからない対策
  export LDFLAGS="-L/usr/local/opt/zlib/lib"
  export CPPFLAGS="-I/usr/local/opt/zlib/include"
fi

# node
if [[ -d ~/.ndenv ]]; then
  export PATH="$HOME/.ndenv/bin:$PATH"
  eval "$(ndenv init -)"
fi

# golang(1.8のデフォルトとは違う)
export GOPATH=${HOME}/dev
export GOROOT=${HOME}/go
export PATH=${GOPATH}/bin:${PATH}
export PATH=${GOROOT}/bin:${PATH}

# rust
if [[ -d ~/.cargo ]]; then
  source ${HOME}/.cargo/env
fi

# direnv
if type direnv > /dev/null; then
  eval "$(direnv hook zsh)"
fi

################################################################################
# alias

# -v: 自然な並び順
# 標準の ll='ls -lh' では 頭の_が考慮されない
alias ll='ls -lv'

if type trash > /dev/null; then
  alias rm='trash'
fi

# vimwiki
alias wiki='tmux rename-window wiki-neovim && nvim -c VimwikiIndex'

# ghosttext
alias ghost='tmux rename-window ghosttext-neovim && nvim -c GhostStart'

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

function httpd() {
  httpd_rb "$@"
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

################################################################################
# fzf

# フォルダは移動する
# ファイルはvimで開く
function fzf_open_file() {
  local selected=$(find . -not -path './.git/*' -print 2> /dev/null | fzf)
  echo $selected
  if [ -n "$selected" ]; then
    if [[ -d "$selected" ]]; then
      BUFFER="cd ${selected}"
    else
      BUFFER="nvim ${selected}"
    fi
    zle accept-line
  fi
  zle clear-screen
}
zle -N fzf_open_file
bindkey '^O' fzf_open_file

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

# fzfだけ打ったときの元データ(vimのfzfも同じ)
# --hidden: 隠しファイル表示する
# --skip-vcs-ignores: .gitignoreを無視して表示する
# --ignore-dir: .gitフォルダは無視する
# --filename-pattern: find . 相当のファイル一覧表示
# rg版 export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
export FZF_DEFAULT_COMMAND='ag --hidden --skip-vcs-ignores --ignore-dir ".git" --filename-pattern ""'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
