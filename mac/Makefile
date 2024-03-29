# https://postd.cc/auto-documented-makefile/
.DEFAULT_GOAL := help
.PHONY: help
help: ## help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(word 1,$(MAKEFILE_LIST)) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'


.PHONY: brew-update
brew-update: ## brew update
# macのアップデートの度に必要になる
	xcode-select --install || :
	brew update


.PHONY: brew-upgrade
brew-upgrade: brew-update ## brew upgrade all package
	brew upgrade
	brew upgrade --build-from-source --fetch-HEAD neovim


.PHONY: brew-install-all
brew-install-all: brew-update ## brew install all package
	brew tap homebrew/cask-fonts
# osxfuse, cryfs はm1にインストールできない
	brew install \
		sheldon \
		tmux \
		coreutils \
		macvim \
		jq \
		gron \
		tree \
		wget \
		curl \
		tig \
		ghq \
		fzf \
		ag \
		ripgrep \
		mosh \
		pyenv \
		pyenv-virtualenv \
		direnv \
		gpg \
		pinentry \
		trash-cli \
		grip \
		p7zip \
		yamllint \
		ansifilter \
		bat \
		git-delta \
		lf \
		shellcheck \
		shfmt \
		gibo \
		neofetch \
		stats \
		font-fira-code-nerd-font \
		font-fira-mono-nerd-font \
		font-cica \
		font-hackgen-nerd

# クリップボードマネージャー
	brew install --cask maccy

# ~/.fzf.zshを追加する(これがないと入力中の文字が引き継がれない)
	$(shell brew --prefix)/opt/fzf/install

	# ripgrepを整形してようなもの
	brew tap "rhysd/hgrep" "https://github.com/rhysd/hgrep"
	brew install hgrep

	# yaml用のdiff
	brew install homeport/tap/dyff

.PHONY: brew-install
brew-install: brew-update  ## brew install target=package
ifdef target
	brew install $(target)
else
	@echo "Usage: make brew-install target=<package-name>"
endif


.PHONY: brew-uninstall
brew-uninstall: ## brew uninstall target=package
ifdef target
	brew unlink $(target)
	brew uninstall $(target)
else
	@echo "Usage: make brew-uninstall target=<package-name>"
endif
