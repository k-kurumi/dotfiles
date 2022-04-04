-- パッケージマネージャを先にインストールする必要あり https://github.com/tani/vim-jetpack
-- curl -fLo ~/.config/nvim/autoload/jetpack.vim --create-dirs https://raw.githubusercontent.com/tani/vim-jetpack/master/autoload/jetpack.vim
-- curl -fLo ~/.config/nvim/lua/jetpack.lua --create-dirs https://raw.githubusercontent.com/tani/vim-jetpack/master/lua/jetpack.lua

require('jetpack').setup {

  -- ステータスライン
  'https://github.com/nvim-lualine/lualine.nvim',
  'https://github.com/kyazdani42/nvim-web-devicons',

  -- colorscheme
  'https://github.com/sainnhe/gruvbox-material',
  'https://github.com/rakr/vim-one',
  'https://github.com/folke/tokyonight.nvim',
  'https://github.com/rebelot/kanagawa.nvim',

  -- telescope
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/nvim-telescope/telescope.nvim',

  -- telescopeでクリップボードマネージャ
  'https://github.com/AckslD/nvim-neoclip.lua',
  'https://github.com/tami5/sqlite.lua',

  -- treesitter syntax color
  {'https://github.com/nvim-treesitter/nvim-treesitter', run = 'TSUpdate'},

  -- コードの階層を表示する
  'https://github.com/SmiteshP/nvim-gps',

  -- 閉じ括弧の追加
  'https://github.com/windwp/nvim-autopairs',

  -- 括弧の囲み
  'https://github.com/tpope/vim-surround',

  -- 括弧の色付け
  'https://github.com/p00f/nvim-ts-rainbow',

  -- git diffの行表示
  'https://github.com/airblade/vim-gitgutter',

  -- :G でgitクライアント
  'https://github.com/tpope/vim-fugitive',

  -- 末尾スペースを赤く表示
  'https://github.com/ntpeters/vim-better-whitespace',

  -- 行数指定で開く
  'https://github.com/bogado/file-line',

  -- markの表示
  'https://github.com/kshenoy/vim-signature',

  -- gvでコメント化
  'https://github.com/tomtom/tcomment_vim',

  -- カーソルの文字列を強調する
  'https://github.com/itchyny/vim-cursorword',

  -- 非同期のlint
  'https://github.com/dense-analysis/ale',

  -- ウインドウのリサイズ <C-e>
  'https://github.com/simeji/winresizer',

  -- prettier
  {'https://github.com/prettier/vim-prettier', run = 'npm install'},

  -- 組み込みlspは設定が煩雑なのでcocを使う
  {'https://github.com/neoclide/coc.nvim', branch = 'release'},

  -- *で検索対象に指定
  'https://github.com/thinca/vim-visualstar',

  -- deno ghosttext
  'https://github.com/vim-denops/denops.vim',
  'https://github.com/vim-denops/denops-helloworld.vim',
  'https://github.com/gamoutatsumi/dps-ghosttext.vim',
}


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
    theme = 'gruvbox-material'
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
      '!.venv/',
      '--glob',
      '!node_modules/'
    }
  }
}

-- ウインドウリサイズの移動量
vim.g.winresizer_vert_resize  = 1
vim.g.winresizer_horiz_resize = 1

-- keymap
vim.api.nvim_set_keymap("n", "th", ":tabprevious<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "tl", ":tabnext<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "tq", ":tabclose<CR>", {noremap = true, silent = true})

-- telescope
-- .git/以外の隠しファイルを表示する
vim.api.nvim_set_keymap("n", ",f", ":Telescope find_files find_command=rg,--files,--no-ignore,--hidden,--glob,!.git/,--glob,!.venv/,--glob,!node_modules/<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", ",g", ":Telescope live_grep<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", ",b", ":Telescope buffers<CR>", {noremap = true, silent = true})
-- コピーバッファ(ペースト入るようにunnamedを指定する)
vim.api.nvim_set_keymap("n", ",p", ":Telescope neoclip unnamed<CR>", {noremap = true, silent = true})

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
-- coc-jediは対応が遅いので使用しない(matchへの対応など)
vim.g.coc_global_extensions = {
  'coc-docker',
  'coc-explorer',
  'coc-go',
  'coc-json',
  'coc-pairs',
  'coc-rust-analyzer',
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
vim.api.nvim_set_keymap("n", "*", "*N",  {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "#", "#N",  {noremap = true, silent = true})

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
vim.cmd [[set iskeyword+=-]]
