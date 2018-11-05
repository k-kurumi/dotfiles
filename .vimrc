" .vimrc
set encoding=utf-8
scriptencoding utf-8

" fishはPOSIX互換ではないためエラーがでるため回避する
if $SHELL =~ '/fish$'
  set shell=bash
endif

" ================================================================================
"   vim-plug
"
"   INSTALL:
"     curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"
call plug#begin()

Plug 'tpope/vim-sensible'

" 整形
Plug 'junegunn/vim-easy-align'

" python3で動かない
" " undo redo
" Plug 'sjl/gundo.vim'
" " toggle gundo
" nnoremap <leader>u :GundoToggle<CR>

" " :Rg <string|pattern>で検索
" Plug 'jremmen/vim-ripgrep'
" let g:rg_highlight = 1

" :Pt [option] <pattern> [<path>] で検索
" -w: 正規表現を使う
Plug 'nazo/pt.vim'

" markを表示
Plug 'kshenoy/vim-signature'

" フォルダツリー
Plug 'scrooloose/nerdtree'
" ツリーのアイコン
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'

Plug 'jistr/vim-nerdtree-tabs'
" 開くときNERDTreeも開く(:mksessionが壊れる)
let g:nerdtree_tabs_open_on_console_startup = 1
let g:nerdtree_tabs_open_on_gui_startup = 0

" gcでコメントトグル
Plug 'tpope/vim-commentary'

" githubのページで開く
" ビジュアルモードなどで :OpenGithubFile
Plug 'tyru/open-browser.vim'
Plug 'tyru/open-browser-github.vim'

" アスキーアート作成
Plug 'vim-scripts/DrawIt'

" 保存時の構文チェッカ
" javascript : npm install -g eslint
"     coffee : npm install -g coffeelint
" Plug 'scrooloose/syntastic'
" let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
" let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
" " typescriptは上手く動かないのでチェックしない
" let g:loaded_syntastic_typescript_tslint_checker = 0
" let g:loaded_syntastic_typescript_tsc_checker = 0

" インデント表示
" conceallevel=2が設定されてjsonの"が表示されない
" 見づらいため使用しないようにする
" Plug 'Yggdroot/indentLine'

" concealを使わないインデント表示
" ,ig で表示切り替え(,はleader)
Plug 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup = 0
let g:indent_guides_start_level = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=black
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=darkgrey

" バイナリエディタ
"Plug 'Shougo/vinarise.vim'

" rails
Plug 'tpope/vim-rails'
Plug 'tpope/vim-cucumber'
Plug 'tonekk/vim-ruby-capybara'
" <c-w><c-d>でsplitして開く

" カーソル文字に下線を引く
" カーソル移動が遅いので使わない
" Plug 'itchyny/vim-cursorword'

" color
Plug 'w0ng/vim-hybrid'
Plug 'cocopon/iceberg.vim'

" git diffを表示
Plug 'airblade/vim-gitgutter'

" gitをvimから使う
Plug 'tpope/vim-fugitive'

" github flavored markdown
Plug 'rhysd/vim-gfm-syntax'

" 括弧の色分け
Plug 'luochen1990/rainbow'
let g:rainbow_active = 1

" markdownの目次生成
" vscodeの https://github.com/AlanWalk/Markdown-TOC と完全に一致しない
Plug 'mzlogin/vim-markdown-toc'
let g:vmt_auto_update_on_save = 0
let g:vmt_list_item_char = '-'

" 行番号指定で開く
Plug 'bogado/file-line'

" zencoding
" <c-y>,で展開
Plug 'mattn/emmet-vim'
" reactjsのclassName補完(.zzzでclassName="zzz")
" TODO: あとで個人的な補完を追加する
let g:user_emmet_settings = 1

" 末尾半角スペースの可視化(:FixWhitespace で削除)
" ntpeters/vim-better-whitespace が高機能だがssh経由で赤色が出ない
" 色設定を調整するのが面倒なのでvim-trailing-whitespaceを使う
Plug 'bronson/vim-trailing-whitespace'
" uniteで赤くなるため無効にする"
"let g:extra_whitespace_ignored_filetypes = ['unite']


" :help ctrlp-options
Plug 'ctrlpvim/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:30,results:30'

" tab周り
Plug 'DavidEGx/ctrlp-smarttabs'
let g:ctrlp_extensions = ['smarttabs']
nnoremap ,t :CtrlPSmartTabs<CR>

" 過去のyank一覧
Plug 'LeafCage/yankround.vim'
nnoremap ,p :CtrlPYankRound<CR>


" ステータスラインのカスタマイズ
Plug 'w0rp/ale'
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'

let g:lightline = {
  \ 'component_expand': {
  \   'linter_checking': 'lightline#ale#checking',
  \   'linter_warnings': 'lightline#ale#warnings',
  \   'linter_errors': 'lightline#ale#errors',
  \   'linter_ok': 'lightline#ale#ok',
  \ },
  \ 'component_function': {
  \   'gitbranch': 'fugitive#statusline',
  \ },
  \ 'component_type': {
  \   'linter_checking': 'left',
  \   'linter_warnings': 'warning',
  \   'linter_errors': 'error',
  \   'linter_ok': 'left',
  \ },
  \ 'active': {
  \   'left': [
  \     ['mode', 'paste'],
  \     ['relativepath', 'modified', 'readonly', 'gitbranch'],
  \     ['linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok'],
  \   ],
  \ },
  \ 'inactive': {
  \   'left': [
  \     ['relativepath', 'modified'],
  \   ],
  \ },
  \ }


" 括弧の補完
Plug 'MetalPhaeton/easybracket-vim'

" 括弧囲み
" v選択後 S" で "囲み
" ds" で "削除
Plug 'tpope/vim-surround'

" ウインドウのリサイズ
" <C-e>で変更モード
" FIXME: 複数タブを開くとサイズが別タブへ移動でリセットされているように見えるので確認する
Plug 'simeji/winresizer'


" 複数のハイライト検索
Plug 't9md/vim-quickhl'
" ハイライトを付ける
nmap <Space>m <Plug>(quickhl-manual-this)
xmap <Space>m <Plug>(quickhl-manual-this)
" ハイライトをリセット
nmap <Space>M <Plug>(quickhl-manual-reset)
xmap <Space>M <Plug>(quickhl-manual-reset)

" ビジュアルモード中に * で検索対象になる
Plug 'thinca/vim-visualstar'

" いろいろ非同期にする
Plug 'Shougo/vimproc.vim', {'do' : 'make'}

if v:version > 703 && has('lua')
  " +luaのvimで有効になる補完
  Plug 'Shougo/neocomplete'
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

  " Disable AutoComplPop.
  let g:acp_enableAtStartup = 0

  " Set minimum syntax keyword length.
  let g:neocomplete#sources#syntax#min_keyword_length = 3

  " Define dictionary.
  let g:neocomplete#sources#dictionary#dictionaries = {
      \ 'default' : '',
      \ 'vimshell' : $HOME.'/.vimshell_hist',
      \ 'go' : $HOME.'/dev/bin/gocode'
      \ }

  " luaなしのときはneocomplcacheが使えるが、vimをコンパイルした方がよい"
endif


" bats
Plug 'vim-scripts/bats.vim'

" gvimのフォントを+拡大、-縮小
Plug 'thinca/vim-fontzoom'

"
" 以下は言語特有のプラグイン
"
" --------------------------------------------------------------------------------
" ruby
"
" rspec
Plug 'keith/rspec.vim'

" yamlでドット区切りでジャンプできる
" Moving to the parent node ( :YamlGoToParent ),
" Getting the full path to the current element ( :YamlGetFullPath ),
" Moving to an element, given the path ( :YamlGoToKey )
Plug 'lmeijvogel/vim-yaml-helper'
noremap <C-y> :YamlGetFullPath<CR>
let g:vim_yaml_helper#always_get_root = 1
let g:vim_yaml_helper#auto_display_path = 0

" 標準のyamlハイライトより速いらしい
Plug 'stephpy/vim-yaml'

" rubyでend補完
Plug 'tpope/vim-endwise'

" --------------------------------------------------------------------------------
" typescript
"
" Plug 'Quramy/tsuquyomi'
" 追加でインストールが必要 npm -g install typescript
" Plug 'jason0x43/vim-js-indent'
" Plug 'leafgarland/typescript-vim'

" --------------------------------------------------------------------------------
" javascript

" 8スペースなどインデントがおかしくなるので使わない
" Plug 'jiangmiao/simple-javascript-indenter'
Plug 'othree/yajs.vim'
Plug 'othree/es.next.syntax.vim'

Plug 'pangloss/vim-javascript'
" es6だとインデントがおかしくなるので自分で対応する
" Plug 'mtscout6/vim-cjsx'
" Plug 'MaxMEllon/vim-jsx-pretty'
" let g:jsx_ext_required = 1        " ファイルタイプがjsxのとき読み込む
" let g:jsx_pragma_required = 0     " @から始まるプラグマでは読み込まない

" typescriptのように補完が効くらしい
" インストール後実行権限を付ける必要あり
" npm install -g flow-bin
" chmod +x ~/.ndenv/versions/v8.4.0/lib/node_modules/flow-bin/flow-linux64-v0.54.0/flow
Plug 'flowtype/vim-flow'
" 1のとき保存時にウインドウ分割で結果がでるがaleでチェックするため0にする
let g:flow#enable = 0

"" jestの定義をインストールする例
" yarn init -y	# npm init と同じ
" yarn add --dev flow-bin flow-typed
" yarn run flow init
" yarn run flow-typed install jest@20
let g:flow#flowpath = 'node_modules/.bin/flow'

" 既存のものをまでフォーマットしてしまうため使用しない
" " javascriptのフォーマッタ
" " yarn add -D eslint prettier-eslint prettier-eslint-cli しておく
" " http://qiita.com/kiida/items/405bb07c4b52bfee0219
" Plug 'sbdchd/neoformat'
" let g:neoformat_javascript_prettiereslint = {
"       \ 'exe': './node_modules/.bin/prettier-eslint',
"       \ 'args': ['--stdin'],
"       \ 'stdin': 1,
"       \ }
" augroup fmt
"   autocmd!
"   autocmd BufWritePre * Neoformat
" augroup END
" let g:neoformat_enabled_javascript = ['prettiereslint']

Plug 'kchmck/vim-coffee-script'

" --------------------------------------------------------------------------------
" golang

" gdで定義へ飛ぶ
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'mdempsky/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }

" importしていないものも補完する
" gocode set unimported-packages true も実行する
let g:go_gocode_unimported_packages = 1

" 保存時にimport補完
let g:go_fmt_command = "goimports"

" 色付け
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

Plug 'pearofducks/ansible-vim'
Plug 'cespare/vim-toml'

" %で飛ぶ括弧の対応を見やすくする
Plug 'andymass/vim-matchup'
let g:loaded_matchit = 1

" 対になる括弧の補完(標準機能より少し高機能)
Plug 'cohama/lexima.vim'

" TODO: README通りでは補完が効かない
Plug 'elmcast/elm-vim'
let g:elm_setup_keybindings = 0

call plug#end()
" ================================================================================


syntax on

" デフォルトの\ではなく,を使う
let mapleader=","

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


" 2バイト文字の記号が崩れなくなるが対応するitem2設定を入れるとtmux分割時に残像が残るため使用しない
" set ambiwidth=double

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



" 行、列のハイライト表示する
set cursorline
set cursorcolumn

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
set guifont=Ricty\ Diminished\ Discord\ 12

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
  autocmd BufNewFile,BufRead .pryrc  set filetype=ruby  et sw=2 ts=2 sts=2 nocindent autoindent

  " coffee-script
  autocmd BufNewFile,BufRead *.coffee set filetype=coffee sw=2 ts=2 sts=2 et nocindent autoindent

  " typescript
  autocmd BufNewFile,BufRead *.ts set filetype=typescript sw=2 ts=2 sts=2 et

  " python settings
  autocmd BufNewFile,BufRead *.py set filetype=python et sw=4 ts=4 sts=4 nocindent autoindent

  " java(android) settings
  autocmd BufNewFile,BufRead *.aidl set filetype=java

  " javascript settings
  autocmd BufNewFile,BufRead *.js set filetype=javascript sw=2 ts=2 sts=2 et ai cin
  autocmd BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery

  " markdown
  autocmd BufNewFile,BufRead *.md,*.markdown setlocal filetype=markdown.gfm

  " rest
  autocmd BufNewFile,BufRead *.rst set  filetype=rest expandtab sw=2 ts=2 sts=2
  autocmd BufNewFile,BufRead *.rest set filetype=rest expandtab sw=2 ts=2 sts=2
  autocmd BufNewFile,BufRead *.page set filetype=rest expandtab sw=2 ts=2 sts=2

  " yml(dotcloud)
  autocmd BufNewFile,BufRead *.yml  set filetype=yaml autoindent expandtab sw=2 ts=2 sts=2
  autocmd BufNewFile,BufRead *.yaml set filetype=yaml autoindent expandtab sw=2 ts=2 sts=2

  " ios(objective-c)
  autocmd BufNewFile,BufRead *.h set filetype=objc sw=4 ts=4 sts=4 cindent autoindent

  " golang
  autocmd BufNewFile,BufRead *.go set filetype=go sw=2 ts=2 sts=2 cindent autoindent smartindent noet

  " bats
  autocmd BufNewFile,BufRead *.bats set filetype=sh sw=2 ts=2 sts=2 et nocindent autoindent

  " 保存時に末尾の半角スペースを強制削除する(既存ソースのものも消してしまいdiff多くなる)
  "autocmd BufWritePre * FixWhitespace

  " direnv
  autocmd BufNewFile,BufRead .envrc  set filetype=sh  et sw=2 ts=2 sts=2 nocindent autoindent

  " rspec
  autocmd BufNewFile,BufRead *_spec.rb  set filetype=rspec  et sw=2 ts=2 sts=2 nocindent autoindent

  " jasmine
  autocmd BufNewFile,BufRead *_spec.js  set filetype=jasmine.javascript et sw=2 ts=2 sts=2 nocindent autoindent

  " kapacitor
  " syntaxなどが見つからないが、jsに似ているため
  autocmd BufNewFile,BufRead *.tick  set filetype=javascript et sw=2 ts=2 sts=2 nocindent autoindent

  " boshのspec
  autocmd BufNewFile,BufRead spec  set filetype=yaml et sw=2 ts=2 sts=2 nocindent autoindent

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
  \ '\.git$',
  \ '\.DS_Store$'
  \ ]

" 0は半角文字(1は全角文字(三角など)は階層がわかりづらい)
let g:NERDTreeDirArrows = 0

" 隠しファイルも表示する
let g:NERDTreeShowHidden = 1

" bashのsyntaxを有効にする
let g:is_bash = 1

" Move tabpage
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

" ------------------------------------------------------------------------------
" 使い方メモ
" ------------------------------------------------------------------------------

" drawitの操作
" \di 線の開始
" \ds 線の停止


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

" タグジャンプ時にタブで開く
nnoremap <C-]> :<C-u>tab stj <C-R>=expand('<cword>')<CR><CR>

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

" ビジュアルモードの選択部分のみ置換する
" 通常の s ではなく :s とする
" 1. 選択する
" 2. '<,'>:s/\%Vaaa/bbb/g

" gitgutter
" 変更箇所へ飛ぶ
" nnoremap ,g :GitGutterToggle<CR>
"nnoremap ,n :GitGutterNextHunk<CR>
"nnoremap ,p :GitGutterPrevHunk<CR>

" カーソルのハイライト
"nnoremap ,c :set cursorcolumn!<CR>
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


""""""""""""""""""""""""""""""

" markdownのtodo
" todoリストを簡単に入力する
abbreviate tl - [ ]

" todoリストのon/offを切り替える
nnoremap <silent> <buffer> ,do :call ToggleCheckbox()<CR>

function! ToggleCheckbox()
  let l:line = getline('.')
  if l:line =~ '^\-\s\[\s\]'
    let l:result = substitute(l:line, '^-\s\[\s\]', '- [x]', '')
    call setline('.', l:result)
  elseif l:line =~ '^\-\s\[x\]'
    let l:result = substitute(l:line, '^-\s\[x\]', '- [ ]', '')
    call setline('.', l:result)
  end
endfunction

""""""""""""""""""""""""""""""

" vim-easy-align
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

function! GFM()
  let langs = ['ruby', 'yaml', 'vim', 'c']

  for lang in langs
    unlet b:current_syntax
    silent! exec printf("syntax include @%s syntax/%s.vim", lang, lang)
    exec printf("syntax region %sSnip matchgroup=Snip start='```%s' end='```' contains=@%s",
                \ lang, lang, lang)
  endfor
  let b:current_syntax='mkd'

  syntax sync fromstart
endfunction

""""""""""""""""""""""""""""""

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

" hybridは設定が必要
let g:hybrid_custom_term_colors = 1
let g:hybrid_reduced_contrast = 1 " Remove this line if using the default palette.
set background=dark
colorscheme hybrid

" colorscheme iceberg

" hybridだと現在の行がわかりづらいため
highlight CursorLine cterm=underline gui=underline

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

" terminalで端末ノーマルモード(yankできるが編集不可)に切り替える <C-w>N
" 端末ジョブモード(通常のターミナル)に切り替えるには i や a
