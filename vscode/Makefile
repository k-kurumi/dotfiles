OS := $(shell uname)

# https://postd.cc/auto-documented-makefile/
.DEFAULT_GOAL := help
.PHONY: help
help: ## help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(word 1,$(MAKEFILE_LIST)) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-10s\033[0m %s\n", $$1, $$2}'

.PHONY: init
init: ## 設定ファイルをシンボリックリンクで作成する
ifeq ($(OS), Linux)
	ln -sf $(CURDIR)/settings.json ~/.config/Code/User/settings.json
	ln -sf $(CURDIR)/keybindings.json ~/.config/Code/User/keybindings.json
endif

ifeq ($(OS), Darwin)
# macでスペースがあるときはバックスラッシュが必要(クォートで囲んでもエラーになる)
	ln -sf $(CURDIR)/settings.json ~/Library/Application\ Support/Code/User/settings.json
endif

.PHONY: list
list: ## プラグイン一覧を表示する
	code --list-extensions

.PHONY: uninstall
uninstall: ## 全てのプラグインを削除する
	code --list-extensions | xargs -I@ code --uninstall-extension @

.PHONY: install
install: ## プラグインをインストールする
# markdownの目次生成
	code --install-extension AlanWalk.markdown-toc

# 標準のより使いやすいmarkdown表示
	code --install-extension shd101wyy.markdown-preview-enhanced

# ペアプロ
# code --install-extension ms-vsliveshare.vsliveshare

# vim kyebind
# code --install-extension vscodevim.vim

# js系の整形ほか
	code --install-extension dbaeumer.vscode-eslint

# テーマ
	code --install-extension dracula-theme.theme-dracula
	code --install-extension Equinusocio.vsc-material-theme
	code --install-extension jdinhlife.gruvbox

# todoをハイライト
	code --install-extension wayou.vscode-todo-highlight

# RGB表記を色付け
	code --install-extension naumovs.color-highlight

# アイコン
	code --install-extension PKief.material-icon-theme

# 日本語の折り返し補助
	code --install-extension MS-CEINTL.vscode-language-pack-ja

# キーワードで色分け、インデント強調、行末スペースの色付けなど
# 色付けが多すぎて見づらいので使用しない
#	code --install-extension wraith13.background-phi-colors

# 括弧の色付け
	code --install-extension CoenraadS.bracket-pair-colorizer

# markdownなどのテーブル整形
	code --install-extension shuworks.vscode-table-formatter

# git
	code --install-extension eamodio.gitlens
	code --install-extension donjayamanne.githistory

# スペルチェック
	code --install-extension streetsidesoftware.code-spell-checker

# rest client
	code --install-extension humao.rest-client

# 整形
	code --install-extension wwm.better-align

# パスの補完
	code --install-extension christian-kohler.path-intellisense

# 閉じタグの補完
	code --install-extension formulahendry.auto-close-tag

# ghosttext
	code --install-extension tokoph.ghosttext

# draw.io
	code --install-extension hediet.vscode-drawio

# 行末スペース強調
	code --install-extension shardulm94.trailing-spaces

# インデントの色付け
	code --install-extension oderwat.indent-rainbow

# リロード機能付きhttpサーバ
	code --install-extension ritwickdey.liveserver

# リモートのファイルを編集数r
	code --install-extension ms-vscode-remote.vscode-remote-extensionpack
