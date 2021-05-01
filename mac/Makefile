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
	brew install \
		tmux \
		coreutils \
		macvim \
		jq \
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
		tfenv \
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
		osxfuse \
		cryfs \
		gibo
	brew install --HEAD neovim

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
