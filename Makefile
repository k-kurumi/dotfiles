SHELL := /bin/bash


# https://postd.cc/auto-documented-makefile/
# .envをincludeするとMAKEFILE_LISTに追加されるためwordでMakefileのみ指定する
.DEFAULT_GOAL := help
.PHONY: help
help: ## print help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(word 1,$(MAKEFILE_LIST)) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-22s\033[0m %s\n", $$1, $$2}'

.PHONY: rbenv_update
rbenv_update: ~/.rbenv ## git pull rbenv
	cd ~/.rbenv; git pull
	cd ~/.rbenv/plugins/ruby-build; git pull

.PHONY: pyenv_update
pyenv_update: ~/.pyenv ## git pull pyenv
	cd ~/.pyenv; git pull
	cd ~/.pyenv/plugins/python-build; git pull
	cd ~/.pyenv/plugins/pyenv-virtualenv; git pull

.PHONY: ndenv_update
ndenv_update: ~/.ndenv ## git pull ndenv
	cd ~/.ndenv; git pull
	cd ~/.ndenv/plugins/node-build; git pull

.PHONY: cryfs_mount_vimwiki
cryfs_mount_vimwiki: ## mount dir for vimwiki (事前に CRYFS_VIMWIKI_PASSWORD を.envrc で設定する keepass参照)
	cryfs ~/Dropbox/cryfs/vimwiki ~/vimwiki < <(echo $(CRYFS_VIMWIKI_PASSWORD))

.PHONY: cryfs_unmount_vimwiki
cryfs_unmount_vimwiki: ## unmount dir for vimwiki
	cryfs-unmount ~/vimwiki
