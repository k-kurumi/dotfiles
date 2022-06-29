-- パッケージマネージャを先にインストールする必要あり https://github.com/tani/vim-jetpack
-- curl -fLo ~/.config/nvim/autoload/jetpack.vim --create-dirs https://raw.githubusercontent.com/tani/vim-jetpack/master/autoload/jetpack.vim
-- curl -fLo ~/.config/nvim/lua/jetpack.lua --create-dirs https://raw.githubusercontent.com/tani/vim-jetpack/master/lua/jetpack.lua

-- https://github.com/tani/vim-jetpack#packer-style
vim.cmd('runtime */jetpack.vim')
require('jetpack').startup(function(use)

  -- ステータスライン
  use 'https://github.com/nvim-lualine/lualine.nvim'
  use 'https://github.com/kyazdani42/nvim-web-devicons'

  -- colorscheme
  use 'https://github.com/ellisonleao/gruvbox.nvim'
  use 'https://github.com/joshdick/onedark.vim'
  use 'https://github.com/rebelot/kanagawa.nvim'

  -- telescope
  use 'https://github.com/nvim-lua/plenary.nvim'
  use 'https://github.com/nvim-telescope/telescope.nvim'
  -- 開いたファイルの履歴を表示
  use 'https://github.com/nvim-telescope/telescope-frecency.nvim'

  -- telescopeでクリップボードマネージャ
  use 'https://github.com/AckslD/nvim-neoclip.lua'
  use 'https://github.com/tami5/sqlite.lua'

  -- treesitter syntax color
  use {'https://github.com/nvim-treesitter/nvim-treesitter', run = 'TSUpdate'}

  -- treesitterで対応していないシンタックスは個別に追加する
  use 'https://github.com/raimon49/requirements.txt.vim'

  -- 閉じ括弧部分に対応するコードを表示
  use 'https://github.com/haringsrob/nvim_context_vt'

  -- 括弧のマッチ
  use 'https://github.com/andymass/vim-matchup'

  -- html閉じタグの追加
  use 'https://github.com/windwp/nvim-ts-autotag'

  -- コードの階層を表示する
  use 'https://github.com/SmiteshP/nvim-gps'

  -- 閉じ括弧の追加
  use 'https://github.com/windwp/nvim-autopairs'

  -- 括弧の囲み
  use 'https://github.com/tpope/vim-surround'

  -- 括弧の色付け
  use 'https://github.com/p00f/nvim-ts-rainbow'

  -- タブの可視化
  use 'https://github.com/lukas-reineke/indent-blankline.nvim'

  -- git ui
  use 'https://github.com/airblade/vim-gitgutter'
  -- git commitのレイアウト変更
  use 'https://github.com/rhysd/committia.vim'

  -- :G でgitクライアント
  use 'https://github.com/tpope/vim-fugitive'

  -- 末尾スペースを赤く表示
  use 'https://github.com/ntpeters/vim-better-whitespace'

  -- 検索ワードの位置表示
  use 'https://github.com/kevinhwang91/nvim-hlslens'

  -- 行数指定で開く
  use 'https://github.com/bogado/file-line'

  -- markの拡張
  -- dm<space> 全てのmarkを削除
  use 'https://github.com/chentoast/marks.nvim'

  -- quickfixにプレビュー表示
  use 'https://github.com/kevinhwang91/nvim-bqf'

  -- gc コメント, gb ブロックコメント
  use 'https://github.com/numToStr/Comment.nvim'

  -- カーソルの文字列を強調する
  use 'https://github.com/itchyny/vim-cursorword'

  -- キーワードをハイライトする
  -- <space>h ハイライト
  -- <space>H ハイライト解除
  -- <space>r ハイライト全解除
  use 'https://github.com/t9md/vim-quickhl'

  -- ウインドウのリサイズ <C-e>
  use 'https://github.com/simeji/winresizer'

  -- prettier
  use {'https://github.com/prettier/vim-prettier', run = 'npm install'}

  -- 組み込みlspは設定が煩雑なのでcocを使う
  use {'https://github.com/neoclide/coc.nvim', branch = 'release'}

  -- RustFmtなど
  use 'https://github.com/rust-lang/rust.vim'

  -- RustPaly(playgroundにソース転送)に必要
  use 'https://github.com/mattn/webapi-vim'

  -- *で検索対象に指定
  use 'https://github.com/thinca/vim-visualstar'

  -- vscodeのマルチカーソル
  -- ビジュアルモード時に \\-c で範囲分のカーソル出現
  -- TODO 離れた場所にカーソルを作る方法を調べる
  use 'https://github.com/mg979/vim-visual-multi'

  -- 見える場所にジャンプしやすくする easymotion系
  -- s<文字> で使う
  use 'https://github.com/phaazon/hop.nvim'

  -- :MundoToggleでundoをツリー表示
  use 'https://github.com/simnalamburt/vim-mundo'

  -- :Linediff で特定の部分同士のdiff
  use 'https://github.com/AndrewRadev/linediff.vim'

  -- luaformatter は次のようにビルドする
  -- brew install luarocks
  -- luarocks install --server=https://luarocks.org/dev luaformatter
  -- :call LuaFormat() でフォーマットする
  use 'https://github.com/andrejlevkovitch/vim-lua-format'

end)

--------------------------------------------------------------------------------
--
-- プラグインの設定
--
--------------------------------------------------------------------------------
require('nvim-treesitter.configs').setup {
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  },
  autotag = {
    enable = true,
  }
}
require('nvim-autopairs').setup()
require('neoclip').setup({
  history = 1000,
  -- ~/.local/share/nvim/databases/neoclip.sqlite3 に保存
  enable_persistent_history = true
})

require('nvim-gps').setup({
  disable_icons = true,
})
local gps = require("nvim-gps")
require('lualine').setup{
  sections = {
    lualine_c = {
    {
      'filename',
      file_status = true,      -- Displays file status (readonly status, modified status)
      path = 1,                -- 0: Just the filename
                               -- 1: Relative path
                               -- 2: Absolute path

      shorting_target = 40,    -- Shortens path to leave 40 spaces in the window
                               -- for other components. (terrible name, any suggestions?)
      symbols = {
        modified = '[+]',      -- Text to show when the file is modified.
        readonly = '[-]',      -- Text to show when the file is non-modifiable or readonly.
        unnamed = '[No Name]', -- Text to show for unnamed buffers.
      }
    },
      { gps.get_location, cond = gps.is_available },
    }
  },
  options = {
    theme = 'gruvbox'
  }
}

-- live_grepはrgを使用しているため隠しファイルや.env系も表示できるようにオプションを追加
-- https://github.com/nvim-telescope/telescope.nvim/blob/master/lua/telescope/config.lua
require('telescope').setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      '--hidden',
      '--no-ignore',
      '--glob',
      '!.git/',
      '--glob',
      '!venv/',
      '--glob',
      '!node_modules/',
      '--glob',
      '!target/',
      '--glob',
      '!.idea/',
    }
  },
  extensions = {
    frecency = {
      ignore_patterns = { "*.git/*" }
    }
  }
}
require('telescope').load_extension("frecency")

require('marks').setup({})

require('Comment').setup()

-- ウインドウリサイズの移動量
vim.g.winresizer_vert_resize  = 1
vim.g.winresizer_horiz_resize = 1

-- keymap
vim.api.nvim_set_keymap("n", "th", ":tabprevious<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "tl", ":tabnext<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "tq", ":tabclose<CR>", {noremap = true, silent = true})

-- telescope
-- 1行に長くなるのでカンマで連結
rg_find = {
  "rg",
  "--files",
  "--no-ignore",
  "--hidden",
  "--glob",
  "!.git/",
  "--glob",
  "!venv/",         -- python
  "--glob",
  "!node_modules/", -- node
  "--glob",
  "!target/",       -- rust
  "--glob",
  "!.idea/",        -- intellij
}
vim.api.nvim_set_keymap("n", ",f", ":Telescope find_files find_command=" .. table.concat(rg_find, ",") .. "<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", ",g", ":Telescope live_grep<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", ",b", ":Telescope buffers<CR>", {noremap = true, silent = true})
-- コピーバッファ(ペースト入るようにunnamedを指定する)
vim.api.nvim_set_keymap("n", ",p", ":Telescope neoclip unnamed<CR>", {noremap = true, silent = true})
-- 開いたファイルの履歴
vim.api.nvim_set_keymap("n", ",F", ":Telescope frecency<CR>", {noremap = true, silent = true})

-- coc
vim.api.nvim_set_keymap("n", "[g", "<Plug>(coc-diagnostic-prev)", {noremap = false, silent = true})
vim.api.nvim_set_keymap("n", "]g", "<Plug>(coc-diagnostic-next)", {noremap = false, silent = true})
vim.api.nvim_set_keymap("n", "gd", "<Plug>(coc-definition)", {noremap = false, silent = true})
vim.api.nvim_set_keymap("n", "gy", "<Plug>(coc-type-definition)", {noremap = false, silent = true})
vim.api.nvim_set_keymap("n", "gi", "<Plug>(coc-implementation)", {noremap = false, silent = true})
vim.api.nvim_set_keymap("n", "gr", "<Plug>(coc-references)", {noremap = false, silent = true})
-- [Goto Definition in Vsplit? · Issue #1249 · neoclide/coc.nvim](https://github.com/neoclide/coc.nvim/issues/1249#issuecomment-539803007)
vim.api.nvim_set_keymap("n", "gs", ":call CocAction('jumpDefinition', 'split')<cr>", {noremap = false, silent = true})
vim.api.nvim_set_keymap("n", "gt", ":call CocAction('jumpDefinition', 'tabe')<cr>", {noremap = false, silent = true})

-- ファイルエクスプローラの開閉
vim.api.nvim_set_keymap("n", ",e", ":CocCommand explorer<CR>", {noremap = true, silent = true})
-- 事前にインストールするextension
-- coc-jediは対応が遅いので使用しない(matchへの対応など)
vim.g.coc_global_extensions = {
  'coc-docker',
  'coc-explorer',
  'coc-go',
  'coc-json',
  'coc-markdown-preview-enhanced',
  'coc-pairs',
  'coc-rust-analyzer',
  'coc-sh',
  'coc-snippets',
  'coc-sumneko-lua',
  'coc-toml',
  'coc-webview',
  'coc-yaml',
}

-- coc-snippets
vim.cmd [[
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
]]

--------------------------------------------------------------------------------
--
-- オプション設定(プラグイン以外の本体側)
--
--------------------------------------------------------------------------------

local vim = vim
vim.o.number = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.expandtab = true
vim.o.virtualedit = 'all'
vim.o.inccommand = 'split'
vim.o.updatetime = 100
vim.o.background = 'dark'
vim.o.wrapscan = false
vim.o.listchars = 'eol:$,tab:>_'
vim.o.cursorline = true
vim.o.cursorcolumn = true

-- 検索周り
vim.api.nvim_set_keymap("n", "n", "nzz", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "N", "Nzz", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "*", "*zz", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "#", "#zz", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "*", "*N",  {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "#", "#N",  {noremap = true, silent = true})

-- 折り返し行の移動を見た目通りにする
vim.api.nvim_set_keymap("n", "j", "gj",  {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "k", "gk",  {noremap = true, silent = true})

-- ハイライト
vim.cmd [[
  nmap <Space>h <Plug>(quickhl-manual-this)
  xmap <Space>h <Plug>(quickhl-manual-this)
  nmap <Space>H <Plug>(quickhl-manual-clear)
  vmap <Space>H <Plug>(quickhl-manual-clear)
  nmap <Space>r <Plug>(quickhl-manual-reset)
  xmap <Space>r <Plug>(quickhl-manual-reset)
]]

require('hop').setup {
  keys = 'etovxqpdygfblzhckisuran',
}
vim.api.nvim_set_keymap('n', 's', "<cmd>lua require'hop'.hint_char1()<cr>", {})

-- for goneovim (gui)
vim.cmd [[
  set guifont=UDEV\ Gothic\ NF:h18:b

  " https://github.com/akiyosi/goneovim/issues/163
  nnoremap <D-v> a<C-r>+<Esc>
  inoremap <D-v> <C-r>+
  cnoremap <D-v> <C-r>+
]]

-- terminalからescで抜ける設定 tnoremap <C-[> <C-\><C-n> では入れ子のnvim(git-commitなど)を
-- 起動したとき抜けられなくなるためデフォルト設定を利用すること
vim.cmd [[
  autocmd TermOpen * startinsert
  nnoremap ,tt :tabedit<cr>:terminal<cr>
  nnoremap ,ts :split<cr>:terminal<cr>
  nnoremap ,tv :vsplit<cr>:terminal<cr>
]]

-- coc-go golang
vim.cmd [[
  autocmd BufNewFile,BufRead *.go   set filetype=go  noet sw=4 ts=4 sts=4 cindent autoindent
  autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')
  autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.formatDocument')
]]

--------------------------------------------------------------------------------
--
-- 設定を反映するため最後にテーマを指定する
--
--------------------------------------------------------------------------------

-- termguicolorsの違いで色合いが変わる
if vim.fn.has('termguicolors') then
  vim.o.termguicolors = true
end
vim.cmd [[
  try
    colorscheme gruvbox
  catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme desert
    set background=dark
  endtry
]]
vim.cmd [[set iskeyword+=-]]
