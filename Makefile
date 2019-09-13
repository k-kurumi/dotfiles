# xxenv系をアップデートする

update_rbenv: ~/.rbenv
	cd ~/.rbenv; git pull
	cd ~/.rbenv/plugins/ruby-build; git pull

update_pyenv: ~/.pyenv
	cd ~/.pyenv; git pull
	cd ~/.pyenv/plugins/python-build; git pull
	cd ~/.pyenv/plugins/pyenv-virtualenv; git pull

update_ndenv: ~/.ndenv
	cd ~/.ndenv; git pull
	cd ~/.ndenv/plugins/node-build; git pull
