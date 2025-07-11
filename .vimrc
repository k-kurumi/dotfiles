" ------------------------------------------------------------------------------
call plug#begin()

" コメント周り
" https://github.com/tpope/vim-commentary
Plug 'tpope/vim-commentary'

" 文字列の囲み
" https://github.com/tpope/vim-surround
Plug 'tpope/vim-surround'

" git差分表示
" https://github.com/airblade/vim-gitgutter
Plug 'airblade/vim-gitgutter'

call plug#end()
" ------------------------------------------------------------------------------

" default updatetime 4000ms is not good for async update
set updatetime=100

" bashのsyntaxを有効にする
let g:is_bash = 1

" デフォルトの\ではなく<space>を使う
" let mapleader="\<space>"

" バックスペースで文字削除
set bs=2

" 検索などの履歴
" set viminfo+=n~/.viminfo

" カーソル位置をバーに表示
set ruler

" nobackup
set nobackup

" zsh風のファイル名補完しない
set nowildmenu

" bash風なtabで補完候補を表示する
set wildmode=longest,list

" undo redo の回数
set undolevels=1000

" ファイルの自動改行無効化
set textwidth=0

" <C-a> で8進数として扱わない
set nrformats-=octal

" beep と画面フラッシュを消す(linux only)
set novisualbell

" 行番号表示
set number

" tabは2スペース
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" ビジュアルモードかどうか見せる
set showmode

" 自動字下げ
"set cindent
set autoindent

" 括弧対応を強調
set showmatch

" 右下あたりに状態表示( 100G 等が出る )
set showcmd

" モードラインの有効化(// vim: set ft=json : のようなもの)
set modeline

" 括弧のパターン(追加すると % で対応に飛べる)
"set matchpairs=<:>,(:),{:},[:]
set matchpairs=(:),{:},[:]

" 他のプラグインから上書きされるので指定しても意味なし
" t textwidthを使ってテキストを自動折返しする。
" c 現在のコメント指示を挿入して、textwidthを使ってコメントを自動折返しする。
" r 挿入モードで<return>を打った後に、現在のコメント指示を自動的に挿入する。
" o ノーマルモードで'o'、'O'を打った後に、現在のコメント指示を自動的に挿入する。
" q "gq"によるコメントの整形を可能にする。
" 2 テキストの整形処理時、段落の最初の行ではなく2番目の行のインデントをそれ以降の行に対して使う。
" v 挿入モードでVi互換の自動折返しを使う 現在の挿入モードで入力された空白でのみ折返しが行われる。
" b 'v'と同じ、ただし空白の入力か折返しマージンの前でのみ自動折返しをする。
" l 挿入モードでは長い行は折り返されない。
" default: tcq
"set formatoptions-=croql

" 保存ヒストリ数
set history=500

" :set list 時の表示文字
set listchars=eol:$,tab:>_

" 検索結果をハイライト表示
set hlsearch

" 検索文字に順次ヒット
set incsearch

" 大文字小文字を区別する
set noignorecase

" 下までいったら循環しない
set nowrapscan

" 文字コード関連
set laststatus=2
set encoding=utf-8
set fileencodings=utf-8,euc-jp,sjis,iso-2022-jp
set fileencoding=utf-8

" タブ移動周り
function! s:MoveTabpage(num)
  if type(a:num) != type(0)
    return
  endif

  let pos = tabpagenr() - 1 + a:num
  let tabcount = tabpagenr("$")

  if pos < 0
    let pos = tabcount - 1
  elseif pos >= tabcount
    let pos = 0
  endif

  execute "tabmove " . pos
endfunction

" TabMove: Move tabpage with reltive number
command! -nargs=1 TabMove :call <SID>MoveTabpage(<f-args>)

" タブを左右に移動する
nnoremap tH :call <SID>MoveTabpage(-1)<Return>
nnoremap tL :call <SID>MoveTabpage(1)<Return>

" 2バイト文字の記号が崩れなくなるが対応するiterm2設定を入れるとtmux分割時に残像が残るため使用しない
" set ambiwidth=double

" ------------------------------------------------------------------------------
"  keymap
" ------------------------------------------------------------------------------
"
" 検索結果を常に画面中央に表示
noremap n nzz
noremap N Nzz
noremap * *zz
noremap # #zz
noremap g* g*zz
noremap g# g#zz

" 折り返し行も見た目一行移動
noremap j gj
noremap k gk

" 一つ前のバッファを開く
noremap <C-j> <C-^>

" ビジュアルモードからの検索と置換
"選択した文字列を検索
vnoremap <silent> // y/<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>
"選択した文字列を置換
vnoremap /s "xy:%s/<C-R>=escape(@x, '\\/.*$^~[]')<CR>//gc<Left><Left><Left>

inoremap <silent> jj <ESC>

" 行の強調(列を有効にするとカーソル移動がもたつくため使わない)
set cursorline
set nocursorcolumn

" フリーカーソル {block, insert, all, onemore}
set virtualedit=all

" 画面点滅を消す
set novisualbell

" 保存しなくてもファイルを切り替えることができ
" undo, redo の情報も保持させる
set hidden

" カーソルを点滅しないようにする
set guicursor=a:blinkon0

" デフォルトは guioptions=agimrLtT
" visual copy: a, 右スクロールバー: r, 縦分割時左スクロールバー: L
set guioptions=rL

" ビジュアルモードで選択したところを*で検索する
vnoremap * "zy:let @/ = @z<CR>n

" ------------------------------------------------------------------------------
" 拡張子ごとの個別設定
" ------------------------------------------------------------------------------

augroup MyGroup
  autocmd!

  " ruby settings
  autocmd BufNewFile,BufRead *.rb  set filetype=ruby  et sw=2 ts=2 sts=2 nocindent autoindent
  autocmd BufNewFile,BufRead *.erb set filetype=eruby et sw=2 ts=2 sts=2 nocindent autoindent
  autocmd BufNewFile,BufRead *_spec.rb  set filetype=rspec  et sw=2 ts=2 sts=2 nocindent autoindent
  autocmd BufNewFile,BufRead .pryrc  set filetype=ruby  et sw=2 ts=2 sts=2 nocindent autoindent

  " typescript
  autocmd BufNewFile,BufRead *.ts set filetype=typescript sw=2 ts=2 sts=2 et

  " python settings
  autocmd BufNewFile,BufRead *.py set filetype=python et sw=4 ts=4 sts=4 nocindent autoindent

  " yml
  " indentkeysを空にすると改行時にインデントが入らない
  autocmd BufNewFile,BufRead *.yml  set filetype=yaml.ansible expandtab sw=2 ts=2 sts=2 indentkeys=
  autocmd BufNewFile,BufRead *.yaml set filetype=yaml.ansible expandtab sw=2 ts=2 sts=2 indentkeys=

  " direnv
  autocmd BufNewFile,BufRead .envrc set filetype=sh  et sw=2 ts=2 sts=2 nocindent autoindent

  " jsonc
  autocmd BufNewFile,BufRead *.json set filetype=jsonc
augroup END

" ハイフン付き文字も保管できるようにする
setlocal iskeyword+=-
" rubyのクラス変数など @@val を保管できるようにする
setlocal iskeyword+=@-@

" ------------------------------------------------------------------------------
" *.swpの出力先
"
" 同名のファイルを編集中でも、*.swp *.swo など別のスワップファイルとして保持される
" ------------------------------------------------------------------------------
set directory=~/.vim

" タグジャンプ時にタブで開く
nnoremap <C-]> :<C-u>tab stj <C-R>=expand('<cword>')<CR><CR>

" ESCのとき早く抜ける
set timeout
set timeoutlen=1000
set ttimeoutlen=70

" vim7.4からundoを保存する.un~ファイルが出来るためまとめる
set undodir=~/.vim/undodir
set undofile

" macのcrontabで指定しないと怒られる
set backupskip=/tmp/*,/private/tmp/*

" jsonでconcealが"を消してずれるので無効にする"
let g:vim_json_syntax_conceal = 0

" 何に使用しているか不明 TODO 後で削除する
"call smartinput_endwise#define_default_rules()

" *検索で移動しない
nnoremap * *N
nnoremap # #N

" タブ
nnoremap tn :tabnew<CR>
nnoremap tl :tabnext<CR>
nnoremap th :tabprevious<CR>
nnoremap tq :tabclose<CR>
nnoremap t1 :tabnext1<CR>
nnoremap t2 :tabnext2<CR>
nnoremap t3 :tabnext3<CR>
nnoremap t4 :tabnext4<CR>
nnoremap t5 :tabnext5<CR>
nnoremap t6 :tabnext6<CR>
nnoremap t7 :tabnext7<CR>
nnoremap t8 :tabnext8<CR>
nnoremap t9 :tabnext9<CR>

" paste
nnoremap <SPACE>p :set paste!<CR>:set et<CR>

" 画面分割時に間違って:onlyしてしまうのを抑制(tmuxのペイン間移動)
noremap <C-w>o <ESC>
noremap! <C-w>o <ESC>

" データは変えずに表示のみ変更する機能(jsonでkeyの""囲みを消したり)は見づらいのでオフ
set conceallevel=0

" markdownのtodo
" todoリストを簡単に入力する
abbreviate tl - [ ]

" terminalのノーマルインサート切り替え(vimとneoで違う)
" neo: <C-\><C-n>
" vim: <C-w>N
" 端末ジョブモード(通常のターミナル)に切り替えるには i や a

" terminalでターミナルモードから抜ける
tnoremap <silent> <C-[> <C-\><C-n>

" macvimは\で円マークが入るため入れ替える
noremap! ¥ \

" ターミナルでスクロールが遅いのを改善する
set lazyredraw
set ttyfast

" vimdiffで元ファイルとの差分を表示する
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
    \ | wincmd p | diffthis
endif

set background=dark
colorscheme desert
