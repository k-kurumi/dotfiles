# Set up the prompt

export LANG=ja_JP.UTF-8

# Use modern completion system
autoload -U compinit
compinit

autoload -U promptinit
promptinit
prompt walters
setopt print_exit_value


# TODO: 設定を見直す http://mollifier.hatenablog.com/entry/20100906/p1

# add git branch name
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '(%s)-[%b]'
zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'

autoload -Uz is-at-least
if is-at-least 4.3.10; then
  zstyle ':vcs_info:git:*' check-for-changes true
  zstyle ':vcs_info:git:*' stagedstr "(staged)"    # 適当な文字列に変更する
  zstyle ':vcs_info:git:*' unstagedstr "(modified)"  # 適当の文字列に変更する
  zstyle ':vcs_info:git:*' formats '(%s)-[%b] %c%u'
  zstyle ':vcs_info:git:*' actionformats '(%s)-[%b|%a] %c%u'
fi

precmd () {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}
RPROMPT=""
PROMPT="
%n@%m [%~] (%D{%T}) %1(v|%F{green}%1v%f|)
%(!.#.$)%f "

# %n@%m

# emacs: -e, vi: -v
bindkey -e

# historical backward/forward search with linehead string binded to ^P/^N
#
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end
bindkey '^R' history-incremental-pattern-search-backward
bindkey '^S' history-incremental-pattern-search-forward

# Keep 100000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=100000
SAVEHIST=100000
setopt hist_ignore_dups

# コマンドがスペースで始まる場合、コマンド履歴に追加しない
setopt hist_ignore_space

setopt share_history
HISTFILE=~/.zsh_history


setopt auto_cd

# auto pwd stack
setopt auto_pushd

setopt list_packed
#setopt correct
setopt nolistbeep
setopt list_packed
setopt complete_aliases


# alias
alias ll='ls -l'
alias l='ls -l'
[ -e `which trash` ] && alias rm='trash'
alias vi='vim'
alias info='info --vi-keys'
alias ren='vim -c Renamer'

export EDITOR=vim

#改行のない出力をプロンプトで上書きするのを防ぐ
unsetopt promptcr



# "~hoge" が特定のパス名に展開されるようにする(ブックマークのようなもの)
# 例: cd ~hoge と入力すると /long/path/to/hogehoge ディレクトリに移動
hash -d hoge=/long/path/to/hogehoge


# pushd したとき、ディレクトリがすでにスタックに含まれていればスタックに追加しない
setopt pushd_ignore_dups

# 拡張 glob を有効にする
# glob とはパス名にマッチするワイルドカードパターンのこと
# (たとえば `mv hoge.* ~/dir` における "*")
# 拡張 glob を有効にすると # ~ ^ もパターンとして扱われる
# どういう意味を持つかは `man zshexpn` の FILENAME GENERATION を参照
#setopt extended_glob

# 入力したコマンドがすでにコマンド履歴に含まれる場合、履歴から古いほうのコマンドを削除する
# コマンド履歴とは今まで入力したコマンドの一覧のことで、上下キーでたどれる
#setopt hist_ignore_all_dups


# <Tab> でパス名の補完候補を表示したあと、
# 続けて <Tab> を押すと候補からパス名を選択できるようになる
# 候補を選ぶには <Tab> か Ctrl-N,B,F,P
#zstyle ':completion:*:default' menu select=1

# 単語の一部として扱われる文字のセットを指定する
# ここではデフォルトのセットから / を抜いたものとする
# こうすると、 Ctrl-W でカーソル前の1単語を削除したとき、 / までで削除が止まる
#WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

# ctrl+sのロックをやめる(ctrl+sはctrl+qで復帰)
stty stop undef

# docker
docker_rm_container() {
  docker rm `docker ps -a -q`
}
docker_rm_images() {
  docker rmi $(docker images | awk '/^<none>/ { print $3 }')
}
alias dc=docker-compose

# read local env
[[ -s $HOME/.shenv_local ]] && source $HOME/.shenv_local
