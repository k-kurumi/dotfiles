" vim
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"
" neovim
" sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'

" コード整形
Plug 'junegunn/vim-easy-align'

" undo履歴を可視化する python不要
Plug 'mbbill/undotree'

" markを表示
Plug 'kshenoy/vim-signature'

" nerdtreeの代わりに使う(nnnの追加インストールが必要)
" ,nでフローティングウインドウで表示する
" nnnのキーバインド参照
" https://github.com/jarun/nnn/wiki/Usage#keyboard-mouse
Plug 'mcchrish/nnn.vim'
" Opens the nnn window in a split
let g:nnn#layout = 'new' " or vnew, tabnew etc.
" Or pass a dictionary with window size
let g:nnn#layout = { 'left': '~20%' } " or right, up, down
" Floating window (neovim latest and vim with patch 8.2.191)
let g:nnn#layout = { 'window': { 'width': 0.9, 'height': 0.6, 'highlight': 'Debug' } }
let g:nnn#action = {
  \ '<c-t>': 'tab split',
  \ '<c-s>': 'split',
  \ '<c-v>': 'vsplit' }

" :SaveSession, :LoadSession, :DeleteSessionでウインドウ状態を保存
" nerdtreeと併用できない
Plug 'skanehira/vsession'
let g:vsession_use_fzf = 1

" bashのsyntaxを有効にする
let g:is_bash = 1

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


" 文頭に張り付くコメントでいまいち
" Plug 'scrooloose/nerdcommenter'
" 途中の空行にコメント記号が入らなくて抜けて見えてしまう
" Plug 'tpope/vim-commentary'
"
" 途中の空行にもコメント記号が入る
" gcでコメントトグル
Plug 'tomtom/tcomment_vim'

" githubを開く
" :OpenGithubFile
Plug 'tyru/open-browser.vim'
Plug 'tyru/open-browser-github.vim'

" アスキーアート作成
" ほとんど使わないため必要になったら有効にする
" \di 線の開始
" \ds 線の停止
" Plug 'vim-scripts/DrawIt'

" インデント表示
" conceallevel=2が設定されてjsonの"が表示されない
" 見づらいため使用しないようにする
" Plug 'Yggdroot/indentLine'

" concealを使わないインデント色付け
" ,ig で表示切り替え(,はleader)
" Plug 'nathanaelkane/vim-indent-guides'
" let g:indent_guides_enable_on_vim_startup = 0
" let g:indent_guides_start_level = 1
" let g:indent_guides_guide_size = 1
" let g:indent_guides_auto_colors = 0
" autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=black
" autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=darkgrey

" カーソルの文字列を下線で協調する
Plug 'itchyny/vim-cursorword'

" colorscheme
Plug 'w0ng/vim-hybrid'
Plug 'cocopon/iceberg.vim'
Plug 'dracula/vim', { 'as': 'dracula'  }
Plug 'rakr/vim-one'

" カラフルなカラーテーマ
Plug 'fatih/molokai'
let g:rehash256 = 1
let g:molokai_original = 1

" gitの差分をmark部分に表示
Plug 'airblade/vim-gitgutter'

" git周りのGblameなどが使える
Plug 'tpope/vim-fugitive'

" 括弧の色分け
Plug 'luochen1990/rainbow'
let g:rainbow_active = 1

" :TableFormatがインデント状態のテーブルでうまく動かない
" vim-gfm-syntax + vim-table-mode の方が使いやすい
" Plug 'godlygeek/tabular'
" Plug 'plasticboy/vim-markdown'
" let g:vim_markdown_folding_disabled = 1
" let g:vim_markdown_new_list_item_indent = 2

" github flavored markdown
Plug 'rhysd/vim-gfm-syntax'

" markdownの目次を :GenTocGFM などで作成
Plug 'mzlogin/vim-markdown-toc'
let g:vmt_auto_update_on_save = 0

" markdownのテーブル用
Plug 'dhruvasagar/vim-table-mode'
let g:table_mode_corner = '|'
let g:table_mode_header_fillchar = '-'

" 行番号指定で開く(vim a.txt:20のような感じ)
Plug 'bogado/file-line'

" zencoding
" <c-y>,で展開
" Plug 'mattn/emmet-vim'

" 末尾半角スペースの可視化(:FixWhitespace で削除)
" ntpeters/vim-better-whitespace が高機能だがssh経由で赤色が出ない
" 色設定を調整するのが面倒なのでvim-trailing-whitespaceを使う
Plug 'bronson/vim-trailing-whitespace'

" ctrlpより速いらしい
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" https://github.com/junegunn/fzf.vim#advanced-customization
" Filesで常にプレビュー表示
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
" Agで?押すとプレビュー
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)
" Rgで?押すとプレビュー
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number -- '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)
" 補完系にfzfを使う
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)
" ctrlp風のキーバインド
nmap <c-p> :Files<CR>

" ステータスラインのカスタマイズ
Plug 'w0rp/ale'
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'

" 文字数取得
" ghosttextではScratchのため文字数が0になる(実ファイルがないとカウントできないように見える)
" :'<,'>s/./&/gn で文字を元の文字で置換すれば確認はできる(matchesのところ)
Plug 'anekos/char-counter-vim'

let g:lightline = {
  \ 'component_expand': {
  \   'linter_checking': 'lightline#ale#checking',
  \   'linter_warnings': 'lightline#ale#warnings',
  \   'linter_errors': 'lightline#ale#errors',
  \   'linter_ok': 'lightline#ale#ok',
  \ },
  \ 'component_function': {
  \   'gitbranch':  'fugitive#statusline',
  \   'ccc': 'CCC',
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
  \   'right': [
  \     ['lineinfo'],
  \     ['percent'],
  \     ['charvaluehex', 'ccc', 'fileformat', 'fileencoding', 'filetype'],
  \   ],
  \ },
  \ 'component': {
  \   'charvaluehex': '0x%B',
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
" Plug 'Shougo/vimproc.vim', {'do' : 'make'}

" gvimのフォントを+拡大、-縮小
" Plug 'thinca/vim-fontzoom'

" htmlなどの閉じタグ補完
Plug 'alvan/vim-closetag'

" golang
" デバッグ用
" :DlvAddBreakPoint して :DlvDebug から実行する
Plug 'benmills/vimux'
Plug 'sebdah/vim-delve'
" terminalではなくtmuxのペインで開く
let g:delve_use_vimux = 1

" 補完はlsp使う方が便利"
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'mattn/vim-goimports'

" aleなどのワーニング文字が入力文字と同じ行に表示されるが
" colorschemeによっては見づらいので無効にする
let g:lsp_diagnostics_enabled = 0

Plug 'cespare/vim-toml'

" ansibleというよりyamlの改行時インデントを調整するために使う
Plug 'stephpy/vim-yaml'
Plug 'pearofducks/ansible-vim'
let g:ansible_unindent_after_newline = 1
let g:ansible_yamlKeyName = 'yamlKey'
let g:ansible_attribute_highlight = "ob"
let g:ansible_name_highlight = 'd'
let g:ansible_extra_keywords_highlight = 1
let g:ansible_normal_keywords_highlight = 'Constant'
let g:ansible_with_keywords_highlight = 'Constant'


" " 対になる括弧の補完(標準機能より少し高機能)
" [  ]のようにスペースが2入って使いづらいので使用しない
" Plug 'cohama/lexima.vim'

Plug 'glidenote/memolist.vim'
let g:memolist_path = '$HOME/Dropbox/memo'
let g:memolist_memo_suffix = "md"
let g:memolist_filename_prefix_none = 1

" terraform
Plug 'hashivim/vim-terraform'
let g:terraform_fmt_on_save = 1

" yankringなどはキーバインドを書き換えすぎるので使用しない
" "でレジスタを表示できる
Plug 'junegunn/vim-peekaboo'

" markdownで使うよりvimwikiフォーマットのまま使う方がリンクなど扱いやすい
Plug 'vimwiki/vimwiki'
let g:vimwiki_list = [{
  \ 'path': '~/vimwiki',
  \ 'path_html': '~/vimwiki_html'
  \ }]
" 実際のコードと見た目が乖離して使いづらいので無効にする
let g:vimwiki_conceallevel = 0
" ブラウザで開く(サーバ不要)
nnoremap ,b :Vimwiki2HTMLBrowse<CR>

" terminalなどで使う(terminalは <c-\><c-n> でノーマルモード切替)
" <space>h, j, k, l で選択した部分を指定したウインドウに貼り付け
Plug 'karoliskoncevicius/vim-sendtowindow'

" terminalをフローティングウインドウで開く
Plug 'Shougo/deol.nvim'
nnoremap <silent> ,t :<C-u>Deol -split=floating -winheight=60 -winwidth=130<CR>

if has('nvim')
  " ghosttext
  " nvimを別で起動して :GhostStart しておく
  Plug 'raghur/vim-ghost', {'do': ':GhostInstall'}
endif

" ruby, rails
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-rails'

call plug#end()
" -------------------------------------------------------------------------------

" neovim固有の設定
if has('nvim')
  " インタラクティブな置換
  set inccommand=split
endif

syntax on

" デフォルトの\ではなく,を使う
let mapleader=","

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


" 間違って押しやすいから
inoremap <C-@> <ESC>

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

  " jira
  autocmd BufNewFile,BufRead *.jira setlocal filetype=confluencewiki nowrap paste

  " rest
  autocmd BufNewFile,BufRead *.rst set  filetype=rest expandtab sw=2 ts=2 sts=2
  autocmd BufNewFile,BufRead *.rest set filetype=rest expandtab sw=2 ts=2 sts=2
  autocmd BufNewFile,BufRead *.page set filetype=rest expandtab sw=2 ts=2 sts=2

  " yml
  " indentkeysを空にすると改行時にインデントが入らない
  autocmd BufNewFile,BufRead *.yml  set filetype=yaml.ansible expandtab sw=2 ts=2 sts=2 indentkeys=
  autocmd BufNewFile,BufRead *.yaml set filetype=yaml.ansible expandtab sw=2 ts=2 sts=2 indentkeys=

  " ios(objective-c)
  autocmd BufNewFile,BufRead *.h set filetype=objc sw=4 ts=4 sts=4 cindent autoindent

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

  " 保存したときHTMLを生成する
  autocmd BufWritePost *.wiki VimwikiAll2HTML
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
" 使い方メモ
" ------------------------------------------------------------------------------



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

" terminalのノーマルインサート切り替え(vimとneoで違う)
" neo: <c-\><c-n>
" vim: <c-w>N
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

if has('gui_running')
  " フォント設定
  if has('mac')
    set guifont=Cica-Regular:h18
  elseif has('unix')
    set guifont=Cica\ Bold\ 12
  endif

  set background=dark
  colorscheme one
  set termguicolors
  " set nowrap

  " ウインドウサイズ lines:縦 columns:横
  set lines=100
  set columns=220

  " ウインドウ表示位置
  "winpos 10 0
  " winsize 150 40
else
  " hybridは設定が必要
  let g:hybrid_custom_term_colors = 1
  let g:hybrid_reduced_contrast = 1 " Remove this line if using the default palette.
  set background=dark
  colorscheme molokai

  " hybridだと現在の行がわかりづらいため
  highlight CursorLine cterm=underline gui=underline
endif

" https://github.com/psycofdj/yaml-path をインストールして呼び出す
" :Yamlpath でpath表示
if !exists('g:yamlpath_sep')
  let g:yamlpath_sep = '/'
endif

if !exists('g:yamlpath_auto')
  let g:yamlpath_auto = 0
endif

function! Yamlpath(...)
  let sep = a:0 ? a:1 : g:yamlpath_sep
  let clean = systemlist('yaml-path --sep=' . sep . ' --line ' . line('.') . ' --col ' . string(col('.')-1), join(getline(1,'$') , "\n"))[0]
  redraw!
  echom clean
endfunction

command! -nargs=? Yamlpath call Yamlpath(<args>)

if has("autocmd") && g:yamlpath_auto
  au FileType yaml :autocmd CursorMoved * call Yamlpath()
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" yankした文字一覧を確認する
" :registers
" "3p のように貼り付ける
