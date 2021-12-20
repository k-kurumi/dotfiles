-- paq package manager https://github.com/savq/paq-nvim
local install_path = vim.fn.stdpath('data') .. '/site/pack/paqs/start/paq-nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.system({'git', 'clone', '--depth=1', 'https://github.com/savq/paq-nvim.git', install_path})
end
vim.cmd [[packadd paq-nvim]]
local paq = require('paq-nvim').paq

-- ステータスライン
paq 'nvim-lualine/lualine.nvim'
paq 'kyazdani42/nvim-web-devicons'

-- colorscheme
paq 'sainnhe/gruvbox-material'
paq 'rakr/vim-one'
paq 'folke/tokyonight.nvim'

-- telescope
paq 'nvim-lua/plenary.nvim'
paq 'nvim-telescope/telescope.nvim'

-- telescopeでクリップボードマネージャ
paq 'AckslD/nvim-neoclip.lua'
paq 'tami5/sqlite.lua'

-- treesitter syntax color
paq 'nvim-treesitter/nvim-treesitter'

-- 閉じ括弧の追加
paq 'windwp/nvim-autopairs'

-- 括弧の囲み
paq 'blackCauldron7/surround.nvim'

-- 括弧の色付け
paq 'p00f/nvim-ts-rainbow'

-- git diffの行表示
paq 'airblade/vim-gitgutter'

-- :G でgitクライアント
paq 'tpope/vim-fugitive'

-- 末尾スペースを赤く表示
paq 'ntpeters/vim-better-whitespace'

-- 行数指定で開く
paq 'bogado/file-line'

-- markの表示
paq 'kshenoy/vim-signature'

-- gvでコメント化
paq 'tomtom/tcomment_vim'

-- カーソルの文字列を強調する
paq 'itchyny/vim-cursorword'

-- 非同期のlint
paq 'dense-analysis/ale'

-- ウインドウのリサイズ <C-e>
paq 'simeji/winresizer'

-- prettier
paq {'prettier/vim-prettier', run = 'npm install'}

-- 組み込みlspは設定が煩雑なのでcocを使う
paq {'neoclide/coc.nvim', branch = 'release'}

-- *で検索対象に指定
paq 'thinca/vim-visualstar'

--------------------------------------------------------------------------------
--
-- プラグインの設定
--
--------------------------------------------------------------------------------

-- require('lualine').setup()
require('lualine').setup{
  options = {
    theme = 'gruvbox-material'
  }
}
require('nvim-treesitter.configs').setup {
  ensure_installed = "maintained",
  ignore_install = {},
  highlight = {
    enable = true,
    disable = {},
    additional_vim_regex_highlighting = false,
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil
  }
}
require('nvim-autopairs').setup()
require('surround').setup{
  mapping_style = "sandwich"
}
require('neoclip').setup({
  history = 1000,
  -- ~/.local/share/nvim/databases/neoclip.sqlite3 に保存
  enable_persistant_history = true
})
-- ウインドウリサイズの移動量
vim.g.winresizer_vert_resize  = 1
vim.g.winresizer_horiz_resize = 1

-- keymap
vim.api.nvim_set_keymap("n", "th", ":tabprevious<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "tl", ":tabnext<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "tq", ":tabclose<CR>", {noremap = true, silent = true})

-- telescope
vim.api.nvim_set_keymap("n", ",f", ":Telescope find_files<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", ",g", ":Telescope live_grep<CR>", {noremap = true, silent = true})
-- コピーバッファ
vim.api.nvim_set_keymap("n", ",p", ":Telescope neoclip star<CR>", {noremap = true, silent = true})

-- coc
vim.api.nvim_set_keymap("n", "[g", "<Plug>(coc-diagnostic-prev)", {noremap = false, silent = true})
vim.api.nvim_set_keymap("n", "]g", "<Plug>(coc-diagnostic-next)", {noremap = false, silent = true})
vim.api.nvim_set_keymap("n", "gd", "<Plug>(coc-definition)", {noremap = false, silent = true})
vim.api.nvim_set_keymap("n", "gy", "<Plug>(coc-type-definition)", {noremap = false, silent = true})
vim.api.nvim_set_keymap("n", "gi", "<Plug>(coc-implementation)", {noremap = false, silent = true})
vim.api.nvim_set_keymap("n", "gr", "<Plug>(coc-references)", {noremap = false, silent = true})

-- ファイルエクスプローラの開閉
vim.api.nvim_set_keymap("n", ",e", ":CocCommand explorer<CR>", {noremap = true, silent = true})
-- 事前にインストールするextension
vim.g.coc_global_extensions = {
  'coc-docker',
  'coc-explorer',
  'coc-go',
  'coc-jedi',
  'coc-json',
  'coc-lua',
  'coc-pairs',
  'coc-sh',
  'coc-snippets',
  'coc-solargraph',
  'coc-toml',
  'coc-tsserver',
  'coc-yaml',
}

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

--------------------------------------------------------------------------------
--
-- 設定を反映するため最後にテーマを指定する
--
--------------------------------------------------------------------------------

-- termguicolorsの違いで色合いが変わる
if vim.fn.has('termguicolors') then
  vim.o.termguicolors = true
end
vim.g.gruvbox_material_background = 'hard'
vim.cmd [[colorscheme gruvbox-material]]
