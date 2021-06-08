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
" Plug 'mbbill/undotree'
"
"" python依存だがundotreeにできない差分プレビューがある
Plug 'simnalamburt/vim-mundo'
  let g:mundo_width = 30
  let g:mundo_preview_height = 30
  let g:mundo_preview_bottom = 1

" markを表示
Plug 'kshenoy/vim-signature'

" :SaveSession, :LoadSession, :DeleteSessionでウインドウ状態を保存
" nerdtreeと併用すると表示が崩れる
Plug 'skanehira/vsession'
  let g:vsession_use_fzf = 1

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
  let g:hybrid_custom_term_colors = 1
Plug 'cocopon/iceberg.vim'
Plug 'dracula/vim', { 'as': 'dracula'  }
Plug 'rakr/vim-one'
Plug 'morhetz/gruvbox'
Plug 'NLKNguyen/papercolor-theme'
Plug 'tomasr/molokai'
  let g:rehash256 = 1
  " 背景色をオリジナルに書き換えるためか起動時にもたつく感じがするのでオフにする
  let g:molokai_original = 0

" hunkは差分の塊のこと
" 次のhunkに移動 ]c
" 前のhunkに移動 [c
" hankをプレビュー <leader>hp
" hunkをgit的に元に戻す <leader>hu
" hunkをgit addする <leader>hs
Plug 'airblade/vim-gitgutter'
  " hankはフローティングより別ウインドウの方がわかりやすい
  let g:gitgutter_preview_win_floating = 0
  function! GitStatus()
    let [a,m,r] = GitGutterGetHunkSummary()
    return printf('+%d ~%d -%d', a, m, r)
  endfunction
  set statusline+=%{GitStatus()}

" git以外のvscにも対応しているらしい(gitしか使わないのでvim-gitgutterを使うことにする)
" 削除行数が表示されたりしてvim-gitgutterよりよい部分もある
" Plug 'mhinz/vim-signify'
"
"   function! s:sy_stats_wrapper()
"     let [added, modified, removed] = sy#repo#get_stats()
"     let symbols = ['+', '-', '~']
"     let stats = [added, removed, modified]  " reorder
"     let statline = ''
"
"     for i in range(3)
"       if stats[i] > 0
"         let statline .= printf('%s%s ', symbols[i], stats[i])
"       endif
"     endfor
"
"     if !empty(statline)
"       let statline = printf('[%s]', statline[:-2])
"     endif
"
"     return statline
"   endfunction
"   " statusline表示用
"   function! MySignify()
"     return s:sy_stats_wrapper()
"   endfunction

" git周りのGblameなどが使える
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" gitのコミットログブラウザ gbで:Gbrowse(githubを開く)
" :GV to open commit browser
" :GV! will only list commits that affected the current file
" :GV? fills the location list with the revisions of the current file
Plug 'junegunn/gv.vim'

" 括弧の色分け
Plug 'luochen1990/rainbow'
  let g:rainbow_active = 1


" 行番号指定で開く(vim a.txt:20のような感じ)
Plug 'bogado/file-line'

" zencoding
" <C-y>,で展開
Plug 'mattn/emmet-vim'

" 末尾スペースを赤く表示する
" :StripWhitespace で末尾スペースを削除
Plug 'ntpeters/vim-better-whitespace'
  " 表示しないfiletype
  let g:better_whitespace_filetypes_blacklist = [
        \ 'coc-explorer',
        \ 'diff',
        \ 'git',
        \ 'gitcommit',
        \ 'help',
        \ 'qf',
        \ ]

" ctrlpより速いらしい
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
  " プレビュー表示の切り替え
  let g:fzf_preview_window = ['right:50%', 'ctrl-/']

  " https://github.com/junegunn/fzf.vim#advanced-customization
  " Filesで常にプレビュー表示
  command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

  " ファイルの中身で絞り込み
  " https://qiita.com/uji_/items/9eac71096f2549003880
  command! -bang -nargs=* Ag
    \ call fzf#vim#grep(
    \   'ag --hidden --column --numbers --noheading --color --smart-case '.shellescape(<q-args>), 1,
    \   fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0)

  command! -bang -nargs=* Rg
    \ call fzf#vim#grep(
    \   'rg --hidden --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
    \   fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0)

  command! -bang -nargs=* GGrep
    \ call fzf#vim#grep(
    \   'git grep --line-number -- '.shellescape(<q-args>), 0,
    \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)

  " 補完系にfzfを使う
  imap <C-x><C-k> <plug>(fzf-complete-word)
  imap <C-x><C-f> <plug>(fzf-complete-path)
  imap <C-x><C-j> <plug>(fzf-complete-file-ag)
  imap <C-x><C-l> <plug>(fzf-complete-line)

  " ,Fは隠しファイルなども表示する($FZF_DEFAULT_COMMANDに依存する)
  nnoremap <silent> ,f  :Files<CR>
  nnoremap <silent> ,gf :GFile<CR>
  nnoremap <silent> ,gs :GFile?<CR>
  nnoremap <silent> ,gc :Commits<CR>
  nnoremap <silent> ,b  :Buffers<CR>
  nnoremap <silent> ,w  :Windows<CR>

" シンタックスチェッカー
Plug 'dense-analysis/ale'

" ステータスラインのカスタマイズ
Plug 'itchyny/lightline.vim'
" \ 'colorscheme': 'gruvbox', を指定するとINSERTの配色が分かりづらいのでデフォルトで使用する
Plug 'maximbaz/lightline-ale'
  let g:lightline = {
    \ 'component_expand': {
    \   'linter_checking': 'lightline#ale#checking',
    \   'linter_warnings': 'lightline#ale#warnings',
    \   'linter_errors': 'lightline#ale#errors',
    \   'linter_ok': 'lightline#ale#ok',
    \ },
    \ 'component_function': {
    \   'gitbranch':  'fugitive#statusline',
    \   'cocstatus': 'coc#status',
    \   'signify': 'GitStatus',
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
    \     ['signify'],
    \     ['linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok'],
    \     ['cocstatus'],
    \   ],
    \   'right': [
    \     ['lineinfo'],
    \     ['percent'],
    \     ['charvaluehex', 'fileformat', 'fileencoding', 'filetype'],
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


" 括弧やクォートの補完
Plug 'jiangmiao/auto-pairs'

" 括弧囲み
" v選択後 S" で "囲み
" ds" で "削除
Plug 'tpope/vim-surround'

" ウインドウのリサイズ
" <C-e>で変更モード hjkl でサイズ変更
" nnoremap <Up> :resize +1<CR>
" nnoremap <Down> :resize -1<CR>
" nnoremap <Left> :vertical resize +1<CR>
" nnoremap <Right> :vertical resize -1<CR>
" でもリサイズできるが
" ウインドウの配置によっては直感的でないリサイズになる
Plug 'simeji/winresizer'
  let g:winresizer_vert_resize  = 1
  let g:winresizer_horiz_resize = 1

" 文字にハイライトを付ける(検索やビジュアルモードで選択する)
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
  " filenames like *.xml, *.html, *.xhtml, ...
  " These are the file extensions where this plugin is enabled.
  "
  let g:closetag_filenames = '*.html,*.xhtml,*.phtml'

  " filenames like *.xml, *.xhtml, ...
  " This will make the list of non-closing tags self-closing in the specified files.
  "
  let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

  " filetypes like xml, html, xhtml, ...
  " These are the file types where this plugin is enabled.
  "
  let g:closetag_filetypes = 'html,xhtml,phtml'

  " filetypes like xml, xhtml, ...
  " This will make the list of non-closing tags self-closing in the specified files.
  "
  let g:closetag_xhtml_filetypes = 'xhtml,jsx'

  " integer value [0|1]
  " This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
  "
  let g:closetag_emptyTags_caseSensitive = 1

  " dict
  " Disables auto-close if not in a "valid" region (based on filetype)
  "
  let g:closetag_regions = {
      \ 'typescript.tsx': 'jsxRegion,tsxRegion',
      \ 'javascript.jsx': 'jsxRegion',
      \ 'typescriptreact': 'jsxRegion,tsxRegion',
      \ 'javascriptreact': 'jsxRegion',
      \ }

  " Shortcut for closing tags, default is '>'
  "
  let g:closetag_shortcut = '>'

  " Add > at current position without closing the current tag, default is ''
  "
  let g:closetag_close_shortcut = '<leader>>'


Plug 'cespare/vim-toml'

" yamlの改行時インデントを調整するために使う
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

" geでリンクへジャンプする
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
  let g:vim_markdown_folding_disabled = 1
  let g:vim_markdown_new_list_item_indent = 2

  let g:vim_markdown_autowrite = 1
  let g:vim_markdown_edit_url_in = 'tab'

" github固有のmarkdown要素に色づけする
Plug 'rhysd/vim-gfm-syntax'
  let g:gfm_syntax_enable_filetypes = ['markdown']

" markdownの目次を :GenTocGFM などで作成
Plug 'mzlogin/vim-markdown-toc'
  let g:vmt_auto_update_on_save = 0

" markdownのテーブル用
Plug 'dhruvasagar/vim-table-mode'
  let g:table_mode_corner = '|'
  let g:table_mode_header_fillchar = '-'

" gripと違いリアルタイムでブラウザを更新できる :MarkdownPreview
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" カラーコードの色付け
" Plug 'norcalli/nvim-colorizer.lua'
" 他のプラグインはもたつく
" Plug 'lilydjwg/colorizer'
" Plug 'gko/vim-coloresque'

" terminalなどで使う(terminalは <C-\><C-n> でノーマルモード切替)
" <space>h, j, k, l で選択した部分を指定したウインドウに貼り付け
Plug 'karoliskoncevicius/vim-sendtowindow'

" deolより使いやすいフローティングウインドウ
" https://github.com/voldikss/vim-floaterm
Plug 'voldikss/vim-floaterm'
  let g:floaterm_width = 0.7
  let g:floaterm_width = 0.7
  let g:floaterm_opener = 'tabe'
  " 基本は1つのターミナルを再利用する
  nnoremap <silent> ,t :FloatermToggle<CR>
  " 追加で新しいターミナルが必要になったときのため
  nnoremap <silent> ,T :FloatermNew<CR>
  " fzfなど全てのterminalで::すると閉じる"
  tnoremap <silent> :: <C-\><C-n>:q<CR>
  " nerdtreeの代替
  nnoremap <silent> ,l :FloatermNew lf<CR>

" vim-floatermの起動が遅くなる気がするので使用しない
" " 標準の:terminalより扱いやすいターミナル
" Plug 'kassio/neoterm'
"   " 上下に分割する
"   let g:neoterm_default_mod = 'botright'
"   " 入力できる状態のターミナルを表示する(<C-w>jiはフォーカスの移動など)
"   nnoremap <silent> ,T :Ttoggle<CR><C-w>ji


Plug 'neoclide/jsonc.vim'

if has('nvim')
  " ghosttext
  " nvimを別で起動して :GhostStart しておく
  Plug 'raghur/vim-ghost', {'do': ':GhostInstall'}

  " lsp nvimとvimで別のものを使う(cocにはnodeなど必要になるため)
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " GoTo code navigation.
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)

    let g:coc_global_extensions = [
      \ 'coc-explorer',
      \ 'coc-json',
      \ 'coc-lua',
      \ 'coc-prettier',
      \ 'coc-pyright',
      \ 'coc-sh',
      \ 'coc-snippets',
      \ 'coc-solargraph',
      \ 'coc-tsserver',
      \ 'coc-yaml',
      \ 'coc-yank',
      \ ]

    " yamlなどは保存時に適用しない(:CocConfig)が :CocCommand prettier.formatFile で適用できる

    " yankring的な使い方
    nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>

    " nerdtreeのような表示(細かい設定は:CocConfigで指定する)
    nnoremap <silent> ,e :CocCommand explorer<CR>

  " golang
  Plug 'darrikonn/vim-gofmt'
    " 保存時にフォーマットする
    autocmd BufWritePre *.go GoFmt
  " :DlvAddBreakPoint して :DlvDebug から実行する
  Plug 'sebdah/vim-delve'
else
  " lsp nvimとvimで別のものを使う(cocにはnodeなど必要になるため)
  Plug 'prabirshrestha/async.vim'
  Plug 'prabirshrestha/asyncomplete.vim'
  Plug 'prabirshrestha/asyncomplete-lsp.vim'
  Plug 'prabirshrestha/vim-lsp'
  Plug 'mattn/vim-lsp-settings'
  Plug 'mattn/vim-goimports'
  " " vimからtmuxのペインを開く
  " Plug 'benmills/vimux'
  " let g:delve_use_vimux = 1
  " :DlvAddBreakPoint して :DlvDebug から実行する
  Plug 'sebdah/vim-delve'

  " aleなどのワーニング文字が入力文字と同じ行に表示されるが
  " colorschemeによっては見づらいので無効にする
  let g:lsp_diagnostics_enabled = 0
endif

" ruby, rails
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-rails'
" :Dispatch <command> でtmuxペインを使って実行結果をquickfixに表示できる
" (docker使っているから？)quickfixから飛べないので普通にtmux切り替えて実行すればいいような気もする
Plug 'tpope/vim-dispatch'
Plug 'vim-test/vim-test'
  let test#strategy = 'dispatch'
  " FIXME プロジェクトごとに別のコマンドを実行したい
  let test#ruby#rails#executable = 'docker-compose run --rm api bundle exec rails test -b'
Plug 'ruby-formatter/rufo-vim'
  let g:rufo_auto_formatting = 1

" bashのオートフォーマット(shellcheckはale任せ)
Plug 'z0mbix/vim-shfmt', {'for':'sh'}
  if executable('shfmt')
    let &l:formatprg='shfmt -i ' . &l:shiftwidth . ' -ln posix -sr -ci -s'
  endif
  " https://github.com/mvdan/sh/blob/master/cmd/shfmt/shfmt.1.scd#printer-flags
  " 割とバグってて効いてないようなオプションがあるので :Shfmt で手動実行にする
  let g:shfmt_extra_args = '-i 2 -bn -ci -sr -kp'

" プロジェクトごとの設定ファイル
Plug 'LucHermitte/lh-vim-lib'
Plug 'LucHermitte/local_vimrc'
  let g:local_vimrc = ['.vimrc_local.vim', '_vimrc_local.vim']

" スペルチェック(popup-menuがなければ下にウインドウが出る)
" ZN, ZP: ジャンプ
" Zl: 候補を表示して置き換え(1カ所だけ)
" ZL: 候補を表示して置き換え(全て)
" Zg: 正しい文字として辞書に追加(:SpelunkerAddAllで全て追加)
" 辞書は ~/.config/nvim/spell/en.utf-8.add (デフォルト)
" Plug 'kamykn/spelunker.vim'
" " Plug 'kamykn/popup-menu.nvim'
"   set nospell

" " prettierで整形する coc-prettierに切り替えた
" Plug 'prettier/vim-prettier', {
"   \ 'do': 'yarn install',
"   \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
" " when running at every change you may want to disable quickfix
" let g:prettier#quickfix_enabled = 0
" autocmd TextChanged,InsertLeave *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

" javascript
Plug 'pangloss/vim-javascript'
" flow.js
Plug 'maxmellon/vim-jsx-pretty'
" typescript
Plug 'HerringtonDarkholme/yats.vim'
" react.js
Plug 'maxmellon/vim-jsx-pretty'

" pythonのblackでオートフォーマット
Plug 'psf/black'
  autocmd BufWritePre *.py execute ':Black'


" インサートモードから抜けるときimeを英数に切り替え
" https://github.com/daipeihust/im-select のインストールが必要
Plug 'brglng/vim-im-select'
  if executable('im-select')
    if has('mac')
      " 他はデフォルト値で動きそう
      let g:im_select_default = 'com.justsystems.inputmethod.atok32.Roman'
    elseif has('unix')
      " pass
    endif
  endif


" curlを使ってリクエスト実行するもの
" <c-j>で実行
Plug 'diepm/vim-rest-console'

" :StartupTime で読み込み時間を表示
Plug 'tweekmonster/startuptime.vim'

" カーソル移動補助
Plug 'easymotion/vim-easymotion'
  " s{char}{char} to move to {char}{char}
  nmap ,s <Plug>(easymotion-overwin-f2)
  " Move to word
  map  ,w <Plug>(easymotion-bd-w)
  nmap ,w <Plug>(easymotion-overwin-w)

call plug#end()
" -------------------------------------------------------------------------------

" neovim固有の設定
if has('nvim')
  " インタラクティブな置換
  set inccommand=split

  " ポップアップとウインドウの透過(100に近いほど透明)
  " 枠がないので透過しすぎるとわかりづらい
  set pumblend=10
  set winblend=10

  if has('termguicolors')
    set termguicolors
  endif
endif

syntax on

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
  autocmd BufNewFile,BufRead .envrc  set filetype=sh  et sw=2 ts=2 sts=2 nocindent autoindent

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

if has('gui_running')
  " フォント設定
  if has('mac')
    set guifont=Cica-Regular:h18
  elseif has('unix')
    set guifont=Cica\ Bold\ 12
  endif

  set background=dark
  colorscheme one
  " set nowrap

  " ウインドウサイズ lines:縦 columns:横
  set lines=100
  set columns=220

  " ウインドウ表示位置
  "winpos 10 0
  " winsize 150 40
else
  set background=dark
  colorscheme gruvbox
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

" UntiSnipsのスニペットをcoc-snippetsから利用する(UltiSnips自体は使用しない)
  " Use <C-l> for trigger snippet expand.
  imap <C-l> <Plug>(coc-snippets-expand)

  " Use <C-j> for select text for visual placeholder of snippet.
  vmap <C-j> <Plug>(coc-snippets-select)

  " Use <C-j> for jump to next placeholder, it's default of coc.nvim
  let g:coc_snippet_next = '<c-j>'

  " Use <C-k> for jump to previous placeholder, it's default of coc.nvim
  let g:coc_snippet_prev = '<c-k>'

  " Use <C-j> for both expand and jump (make expand higher priority.)
  imap <C-j> <Plug>(coc-snippets-expand-jump)

  " Use <leader>x for convert visual selected code to snippet
  xmap <leader>x  <Plug>(coc-convert-snippet)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" yankした文字一覧を確認する
" :registers
" "3p のように貼り付ける

" ファイルの文字数取得について
"  g<C-g> して確認する
" または :'<,'>s/./&/gn で文字を元の文字で置換すれば確認はできる(matchesのところ)
