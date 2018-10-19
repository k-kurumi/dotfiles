.PHONY: update_all rbenv pyenv ndenv

# xxenv系をアップデートする
update_all:
	@ if test -d ~/.rbenv ; then \
		$(MAKE) rbenv; \
	fi

	@ if test -d ~/.pyenv ; then \
		$(MAKE) pyenv; \
	fi

	@ if test -d ~/.ndenv ; then \
		$(MAKE) ndenv; \
	fi

rbenv:
	cd ~/.rbenv && git pull
	cd ~/.rbenv/plugins/ruby-build && git pull

pyenv:
	cd ~/.pyenv && git pull
	cd ~/.pyenv/plugins/python-build && git pull
	cd ~/.pyenv/plugins/pyenv-virtualenv && git pull

ndenv:
	cd ~/.ndenv && git pull
	cd ~/.ndenv/plugins/node-build && git pull
