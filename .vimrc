" .vimrc
set encoding=utf-8
scriptencoding utf-8

" neobundle
"   curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh
" or
"   mkdir -p ~/.vim/bundle
"   git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

if &compatible
  " nocompatibleのタイミングでhistoryがクリアされる
  set nocompatible
endif

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

" ------------------------------------------------------------------------------
"  plugin
" ------------------------------------------------------------------------------

" 整形
NeoBundle 'junegunn/vim-easy-align'

" undo redo
NeoBundle 'sjl/gundo.vim'

" 高速なgrep
NeoBundle 'mileszs/ack.vim'

" ackより高速らしい
" the_silver_searcher
" mac:   brew install the_silver_searcher
" linux: apt-get install silversearcher-ag
NeoBundle 'rking/ag.vim'

" ファイルリネーム
NeoBundle 'vim-scripts/renamer.vim'

" markを表示
NeoBundle 'kshenoy/vim-signature'

" フォルダツリー
NeoBundle 'scrooloose/nerdtree'

" コメント
NeoBundle 'tyru/caw.vim'

" rubyでend補完
NeoBundle 'tpope/vim-endwise'

" \rで実行
NeoBundle 'thinca/vim-quickrun'

" アスキーアート作成
NeoBundle 'vim-scripts/DrawIt'

" 保存時の構文チェッカ
" javascript : npm install -g jshint
"     coffee : npm install -g coffeelint
"         go : go get github.com/golang/lint
NeoBundle 'scrooloose/syntastic'

" javascript
NeoBundle 'jiangmiao/simple-javascript-indenter'
NeoBundle 'jQuery'
NeoBundle 'jelera/vim-javascript-syntax'

" golang
NeoBundle 'fatih/vim-go'
NeoBundle 'dgryski/vim-godef'

" 括弧補完(visula+Iなどで括弧補完がおかしい(macvimで確認))
"NeoBundle 'jiangmiao/auto-pairs'
NeoBundle 'MetalPhaeton/easybracket-vim'

" tagbar
NeoBundle 'majutsushi/tagbar'

" memolist
NeoBundle 'glidenote/memolist.vim'

" json
NeoBundle 'elzr/vim-json'

" インデント(concealを使ったものでvimでも動く)
"NeoBundle 'Yggdroot/indentLine'

" バイナリエディタ
"NeoBundle 'Shougo/vinarise.vim'

" rails
NeoBundle 'tpope/vim-rails'

" color
"NeoBundle 'jpo/vim-railscasts-theme'
"NeoBundle 'tomasr/molokai'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'chriskempson/vim-tomorrow-theme'

" git diffを表示
NeoBundle 'airblade/vim-gitgutter'

" zencoding
" <c-y>,で展開
NeoBundle 'mattn/emmet-vim'

" 末尾半角スペースの可視化(:FixWhitespace で削除)
" ntpeters/vim-better-whitespace が高機能だがssh経由で赤色が出ない
" 色設定を調整するのが面倒なのでvim-trailing-whitespaceを使う
NeoBundle 'bronson/vim-trailing-whitespace'
" uniteで赤くなるため無効にする"
let g:extra_whitespace_ignored_filetypes = ['unite']

" coffee-script
NeoBundle 'kchmck/vim-coffee-script'

" protocolbuffer syntax color
NeoBundle 'uarun/vim-protobuf'

"NeoBundle 'Shougo/neosnippet'
"NeoBundle 'Shougo/neosnippet-snippets'

if v:version > 703 && has('lua')
  NeoBundle 'Shougo/neocomplete'
  " neocomplete用設定
  let g:neocomplete#enable_at_startup = 1
  let g:neocomplete#enable_ignore_case = 1
  let g:neocomplete#enable_smart_case = 1
  if !exists('g:neocomplete#keyword_patterns')
      let g:neocomplete#keyword_patterns = {}
  endif
  let g:neocomplete#keyword_patterns._ = '\h\w*'
  inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
else
  " https://github.com/Shougo/neocomplcache.vim
  " 設定が多いので使うときに作る
endif

NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'basyura/unite-rails'
let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable =1
let g:unite_source_file_mru_limit = 200

" yankバッファ一覧
nnoremap <silent> ,uy :<C-u>Unite history/yank<CR>
"nnoremap <silent> ,ub :<C-u>Unite buffer<CR>

" pwdのフォルダから探す
nnoremap <silent> ,uf :<C-u>UniteWithCurrentDir -buffer-name=files file<CR>

" 開いたファイルのあるフォルダから探す
nnoremap <silent> ,uc :<C-u>UniteWithBufferDir -buffer-name=files file<CR>

"nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> ,uu :<C-u>Unite file_mru buffer<CR>

" grep
nnoremap <silent> ,ug :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
" grep結果の再表示
nnoremap <silent> ,ur :<C-u>UniteResume search-buffer<CR>

" unite起動
nnoremap <silent> ,u<CR> :<C-u>Unite<CR>
nnoremap <silent> ,u<SPACE> :<C-u>Unite<CR>

if executable('pt')
  let g:unite_source_grep_command = 'pt'
elseif executable('ag')
  let g:unite_source_grep_command = 'ag'
endif

let g:unite_source_grep_default_opts = '--nocolor --nogroup'
let g:unite_source_grep_recursive_opt = ''
let g:unite_source_grep_max_candidates = 200


"" ruby補完(効かないような気がする)
"NeoBundleLazy 'marcus/rsense', {
"      \ 'autoload': {
"      \   'filetypes': 'ruby',
"      \ },
"      \ }
"
"NeoBundleLazy 'supermomonga/neocomplete-rsense.vim', { 'autoload' : {
"  \ 'insert' : 1,
"  \ 'filetypes': 'ruby',
"  \ }}

NeoBundle 'Shougo/vimproc.vim', {
      \ 'build' : {
      \     'windows' : 'tools\\update-dll-mingw',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'linux' : 'make',
      \     'unix' : 'gmake',
      \    },
      \ }

" status line
NeoBundle 'itchyny/lightline.vim'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"----------------------------------
"

syntax on

" バックスペースで文字削除
set bs=2

" 検索などの履歴
set viminfo+=n~/.viminfo

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
set fileencodings=utf-8,euc-jp,sjis,iso-2022-jp
set fileencoding=utf-8

"ステータスラインにファイルタイプ・文字コード・改行文字を表示
" powerline使うときは不要
"set statusline=%<[%n]%F%=\ %m%r%h%w%y%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}\ %l,%c\ %P

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


" 間違って押しやすいから
inoremap <C-@> <ESC>

" 短縮入力のような
ab #- ####----------------------------------------------------------------------------



" 行、列のハイライト表示
set cursorline
"set cursorcolumn

" フリーカーソル {block, insert, all, onemore}
set virtualedit=all



" 画面点滅を消す
set novisualbell

" ウインドウサイズ lines:縦 columns:横
"set lines=40
"set columns=100

" ウインドウ表示位置
"winpos 10 0

" フォント設定
set guifont=Ricty\ Diminished\ Discord\ Regular:h12

" 保存しなくてもファイルを切り替えることができ
" undo, redo の情報も保持させる
set hidden

" カーソルを点滅しないようにする
set guicursor=a:blinkon0

" デフォルトは guioptions=agimrLtT
" visual copy: a, 右スクロールバー: r, 縦分割時左スクロールバー: L
set guioptions=rL


" rubyの%ジャンプ
if !exists('loaded_matchit')
  " matchitを有効化
  runtime macros/matchit.vim
endif


" ------------------------------------------------------------------------------
" 拡張子ごとの個別設定
" ------------------------------------------------------------------------------

augroup MyGroup
  autocmd!

  " ruby settings
  autocmd MyGroup BufNewFile,BufRead *.rb  set filetype=ruby  et sw=2 ts=2 sts=2 nocindent autoindent
  autocmd MyGroup BufNewFile,BufRead *.erb set filetype=eruby et sw=2 ts=2 sts=2 nocindent autoindent
  autocmd MyGroup BufNewFile,BufRead .pryrc  set filetype=ruby  et sw=2 ts=2 sts=2 nocindent autoindent

  " coffee-script
  autocmd MyGroup BufNewFile,BufRead *.bats set filetype=coffee sw=2 ts=2 sts=2 et nocindent autoindent

  " python settings
  autocmd MyGroup BufNewFile,BufRead *.py set filetype=python et sw=2 ts=2 sts=2 nocindent autoindent

  " java(android) settings
  autocmd MyGroup BufNewFile,BufRead *.aidl set filetype=java

  " javascript settings
  autocmd MyGroup BufNewFile,BufRead *.js set filetype=javascript sw=2 ts=2 sts=2 et ai cin
  autocmd MyGroup BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery

  " gitit wiki(markdown)
  autocmd MyGroup BufNewFile,BufRead *.page set filetype=markdown
  autocmd MyGroup BufNewFile,BufRead *.md set filetype=markdown

  " rest
  autocmd MyGroup BufNewFile,BufRead *.rst set  filetype=rest expandtab sw=2 ts=2 sts=2
  autocmd MyGroup BufNewFile,BufRead *.rest set filetype=rest expandtab sw=2 ts=2 sts=2
  autocmd MyGroup BufNewFile,BufRead *.page set filetype=rest expandtab sw=2 ts=2 sts=2

  " yml(dotcloud)
  autocmd MyGroup BufNewFile,BufRead *.yml  set filetype=yaml autoindent expandtab sw=2 ts=2 sts=2
  autocmd MyGroup BufNewFile,BufRead *.yaml set filetype=yaml autoindent expandtab sw=2 ts=2 sts=2

  " ios(objective-c)
  autocmd MyGroup BufNewFile,BufRead *.m set filetype=objc sw=4 ts=4 sts=4 cindent autoindent
  autocmd MyGroup BufNewFile,BufRead *.h set filetype=objc sw=4 ts=4 sts=4 cindent autoindent

  " golang
  autocmd MyGroup BufNewFile,BufRead *.go set filetype=go sw=4 ts=4 sts=4 cindent autoindent smartindent noet

  " bats
  autocmd MyGroup BufNewFile,BufRead *.bats set filetype=sh sw=2 ts=2 sts=2 et nocindent autoindent

  " 保存時に末尾の半角スペースを強制削除する(既存ソースのものも消してしまいdiff多くなる)
  ""autocmd MyGroup BufWritePre * FixWhitespace

augroup END


" ------------------------------------------------------------------------------
" 新しくファイルを作ったときのテンプレ
" ------------------------------------------------------------------------------
"augroup MyTemplate
" autocmd!
" autocmd BufNewFile *.py 0r $HOME/.vim/skel/python
"augroup END


" ------------------------------------------------------------------------------
" 保存時にシンタックスなどのチェック
" ------------------------------------------------------------------------------
" warn多いから面倒で使わなくなった
"augroup MyCheck
" autocmd!
" autocmd BufWrite *.py w !pep8 %
"augroup END


" ------------------------------------------------------------------------------
" 半角スペースが入ったファイル名もgfで開けるようにする
" ------------------------------------------------------------------------------
"set isfname+=32

" ------------------------------------------------------------------------------
" *.swpの出力先
"
" 同名のファイルを編集中でも、*.swp *.swo など別のスワップファイルとして保持される
" ------------------------------------------------------------------------------
set directory=~/.vim

" ------------------------------------------------------------------------------
" Gundo用のツリー展開
" ------------------------------------------------------------------------------
" ツリーの開閉
""nnoremap ,u :GundoToggle<CR>

" ------------------------------------------------------------------------------
" NERDTree
" ------------------------------------------------------------------------------
" 開いているファイルをツリーで表示
nnoremap ,f :NERDTreeFind<CR>

" ツリーの開閉
"nnoremap ,t :NERDTreeToggle<CR>

" 表示しないもの
let g:NERDTreeIgnore = ['\.swp$',
  \ '\~$',
  \ '\.pyc$',
  \ '\.pyo$',
  \ '\.class$',
  \ '\.sqlite$',
  \ '__pycache__',
  \ '\.svn$',
  \ '\.git$'
  \ ]

" 0は半角文字(1は全角文字(三角など)は階層がわかりづらい)
let g:NERDTreeDirArrows = 0

" 隠しファイルも表示する
let g:NERDTreeShowHidden = 1


" ------------------------------------------------------------------------------
" Tagbar
" ------------------------------------------------------------------------------
let g:tagbar_left = 1


" ------------------------------------------------------------------------------
" 使い方メモ
" ------------------------------------------------------------------------------

" drawitの操作
" \di 線の開始
" \ds 線の停止

" quickrunの実行
" \r


" コピーに付いて
" viの削除したりコピーした文字をコマンド行で使用する
" /<C-r>"
" これはインサートモード時の入力でも使えるため
" <C-r>+ でクリップボードを貼りつけ
" <C-r>" で直近のレジスタ貼りつけとなる。


" javascript simple-javascript-indenter の設定
" この設定入れるとshiftwidthを1にしてインデントしてくれる
let g:SimpleJsIndenter_BriefMode = 1
" この設定入れるとswitchのインデントがいくらかマシに
let g:SimpleJsIndenter_CaseIndentLevel = -1



" quickrun
let g:quickrun_config = {
\   "_" : {
\       "outputter/buffer/split" : ":botright",
\       "outputter/buffer/close_on_empty" : 1
\   },
\}

" syntastic 構文チェックするかどうかの指定
let g:syntastic_mode_map = {'mode':'active',
  \ 'active_filetypes':['python', 'ruby'],
  \ 'passive_filetypes':['sh']}


" memolist
nnoremap ,mn  :MemoNew<CR>
nnoremap ,ml  :MemoList<CR>
" agなど使うほうが便利
nnoremap ,mg  :MemoGrep<CR>

" 日付の挿入
" 2015-02-23 (月) 09:04:14
" -------------------------
nnoremap ,t i<C-R>=strftime("%Y-%m-%d (%a) %H:%M:%S")<CR><CR><ESC>25i-<ESC>a<CR>

let g:memolist_path = "~/Dropbox/memo"
"let g:memolist_memo_suffix = "txt"
"let g:memolist_memo_date = "%Y-%m-%d %H:%M"
"let g:memolist_memo_date = "epoch"
"let g:memolist_memo_date = "%D %T"
"let g:memolist_prompt_tags = 1
"let g:memolist_prompt_categories = 1
"let g:memolist_qfixgrep = 1
"let g:memolist_vimfiler = 1
"let g:memolist_template_dir_path = "path/to/dir"

" 複数のタグがあるとき確認できるようにする
nnoremap <C-]> g<C-]>

" ESCのとき早く抜ける
set timeout
set timeoutlen=1000
set ttimeoutlen=70

" vim7.4からundoを保存する.un~ファイルが出来るためまとめる
set undodir=~/.vim

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

" ビジュアルモードの選択部分のみ置換する
" 通常の s ではなく :s とする
" 1. 選択する
" 2. '<,'>:s/\%Vaaa/bbb/g

" gitgutter
" 変更箇所へ飛ぶ
nnoremap ,g :GitGutterToggle<CR>
nnoremap ,n :GitGutterNextHunk<CR>
nnoremap ,p :GitGutterPrevHunk<CR>

" カーソルのハイライト
nnoremap ,c :set cursorcolumn!<CR>
"nnoremap ,cl :set cursorline!<CR>

" 画面分割時に間違って:onlyしてしまうのを抑制(tmuxのペイン間移動)
noremap <C-w>o <ESC>
noremap! <C-w>o <ESC>

" データは変えずに表示のみ変更する機能(jsonでkeyの""囲みを消したり)は見づらいのでオフ
set conceallevel=0


" brew でインストールした macvim が spotlight に表示されるように変更する
" 1. brew install macvim
" 2. Finderで /usr/local/Cellar/macvim/7.3.64 から MacVim.app をアプリケーションへ移動する
" 3. ln -s /Applications/MacVim.app /usr/local/Cellar/macvim/7.3.64/


" golang
" 1. install go commands
"   go get code.google.com/p/go.tools/cmd/goimports
"   go get code.google.com/p/rog-go/exp/cmd/godef
"   go get github.com/golang/lint
"   go get github.com/jstemmer/gotags
"   go get github.com/nsf/gocode
"   go get golang.org/x/tools/cmd/cover
"   go get golang.org/x/tools/cmd/godoc
"   go get golang.org/x/tools/cmd/vet

" 2. add .zshrc
"   [[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"
"   export PATH="$GOPATH/bin:$PATH"
set rtp+=$GOROOT/misc/vim
set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim
exe "set rtp+=".globpath($GOPATH, "src/github.com/nsf/gocode/vim")
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

" " https://sites.google.com/site/fudist/Home/vim-nihongo-ban/-vimrc-sample
" """"""""""""""""""""""""""""""
" " 挿入モード時、ステータスラインの色を変更
" """"""""""""""""""""""""""""""
" let g:hi_insert = 'highlight StatusLine guifg=darkblue guibg=darkyellow gui=none ctermfg=blue ctermbg=yellow cterm=none'
"
" if has('syntax')
"   augroup InsertHook
"     autocmd!
"     autocmd InsertEnter * call s:StatusLine('Enter')
"     autocmd InsertLeave * call s:StatusLine('Leave')
"   augroup END
" endif
"
" let s:slhlcmd = ''
" function! s:StatusLine(mode)
"   if a:mode == 'Enter'
"     silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
"     silent exec g:hi_insert
"   else
"     highlight clear StatusLine
"     silent exec s:slhlcmd
"   endif
" endfunction
"
" function! s:GetHighlight(hi)
"   redir => hl
"   exec 'highlight '.a:hi
"   redir END
"   let hl = substitute(hl, '[\r\n]', '', 'g')
"   let hl = substitute(hl, 'xxx', '', '')
"   return hl
" endfunction

" コメントのトグル
vmap ,c <Plug>(caw:i:toggle)

""""""""""""""""""""""""""""""

" vim-go tagbar
let g:go_gotags_bin=$GOPATH . "/bin/gotags"

" if has("mac")
" " mac用の設定
" elseif has("unix")
" " unix固有の設定
" elseif has("win64")
" " 64bit_windows固有の設定
" elseif has("win32unix")
" " Cygwin固有の設定
" elseif has("win32")
" " 32bit_windows固有の設定
" endif

if has('gui_running')
" gvim
  colorscheme desert
else
  "colorscheme default
  "colorscheme desert
  colorscheme hybrid
  "colorscheme hybrid-light
endif
