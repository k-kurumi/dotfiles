#!/bin/bash
#
# golangを使う上で必要なツール一式をインストールする

# repl(pryのようなもの)
go get -u -v github.com/motemen/gore/cmd/gore
go get -u -v github.com/mdempsky/gocode
go get -u -v github.com/k0kubun/pp

# gitのラッパー
go get -u -v github.com/motemen/ghq

# リネームツール
go get -u -v github.com/laurent22/massren
go get -u -v github.com/itchyny/mmv/cmd/mmv

# デバッガ
go get -v -u github.com/derekparker/delve/cmd/dlv
