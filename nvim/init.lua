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
  'https://github.com/EdenEast/nightfox.nvim',

  -- telescope
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/nvim-telescope/telescope.nvim',
  -- 開いたファイルの履歴を表示
  'https://github.com/nvim-telescope/telescope-frecency.nvim',

  -- telescopeでクリップボードマネージャ
  'https://github.com/AckslD/nvim-neoclip.lua',
  'https://github.com/tami5/sqlite.lua',

  -- treesitter syntax color
  {'https://github.com/nvim-treesitter/nvim-treesitter', run = 'TSUpdate'},

  -- 閉じ括弧部分に対応するコードを表示
  'https://github.com/haringsrob/nvim_context_vt',

  -- 括弧のマッチ
  'https://github.com/andymass/vim-matchup',

  -- html閉じタグの追加
  'https://github.com/windwp/nvim-ts-autotag',

  -- コードの階層を表示する
  'https://github.com/SmiteshP/nvim-gps',

  -- 閉じ括弧の追加
  'https://github.com/windwp/nvim-autopairs',

  -- 括弧の囲み
  'https://github.com/tpope/vim-surround',

  -- 括弧の色付け
  'https://github.com/p00f/nvim-ts-rainbow',

  -- タブの可視化
  'https://github.com/lukas-reineke/indent-blankline.nvim',

  -- git ui
  'https://github.com/airblade/vim-gitgutter',
  -- git commitのレイアウト変更
  'https://github.com/rhysd/committia.vim',

  -- :G でgitクライアント
  'https://github.com/tpope/vim-fugitive',

  -- 末尾スペースを赤く表示
  'https://github.com/ntpeters/vim-better-whitespace',

  -- 検索ワードの位置表示
  'https://github.com/kevinhwang91/nvim-hlslens',
  -- スクロールバー
  'https://github.com/petertriho/nvim-scrollbar',

  -- 行数指定で開く
  'https://github.com/bogado/file-line',

  -- markの拡張
  -- dm<space> 全てのmarkを削除
  'https://github.com/chentau/marks.nvim',

  -- quickfixにプレビュー表示
  'https://github.com/kevinhwang91/nvim-bqf',

  -- gc コメント, gb ブロックコメント
  'https://github.com/numToStr/Comment.nvim',

  -- カーソルの文字列を強調する
  'https://github.com/itchyny/vim-cursorword',

  -- キーワードをハイライトする
  -- <space>h ハイライト
  -- <space>H ハイライト解除
  -- <space>r ハイライト全解除
  'https://github.com/t9md/vim-quickhl',

  -- ウインドウのリサイズ <C-e>
  'https://github.com/simeji/winresizer',

  -- prettier
  {'https://github.com/prettier/vim-prettier', run = 'npm install'},

  -- 組み込みlspは設定が煩雑なのでcocを使う
  {'https://github.com/neoclide/coc.nvim', branch = 'release'},

  -- *で検索対象に指定
  'https://github.com/thinca/vim-visualstar',

  -- vscodeのマルチカーソル
  -- ビジュアルモード時に \\-c で範囲分のカーソル出現
  -- TODO 離れた場所にカーソルを作る方法を調べる
  'https://github.com/mg979/vim-visual-multi',

  -- 見える場所にジャンプしやすくする
  -- s<文字> で使う
  'https://github.com/ggandor/lightspeed.nvim',

  -- :MundoToggleでundoをツリー表示
  'https://github.com/simnalamburt/vim-mundo',

  -- :Linediff で特定の部分同士のdiff
  'https://github.com/AndrewRadev/linediff.vim',

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
    theme = 'kanagawa'
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
      '!node_modules/'
    }
  },
  extensions = {
    frecency = {
      ignore_patterns = { "*.git/*" }
    }
  }
}
require('telescope').load_extension("frecency")

require("scrollbar").setup()

-- TODO コピペしただけなので修正する
require('marks').setup {
  -- whether to map keybinds or not. default true
  default_mappings = true,
  -- which builtin marks to show. default {}
  builtin_marks = { ".", "<", ">", "^" },
  -- whether movements cycle back to the beginning/end of buffer. default true
  cyclic = true,
  -- whether the shada file is updated after modifying uppercase marks. default false
  force_write_shada = false,
  -- how often (in ms) to redraw signs/recompute mark positions.
  -- higher values will have better performance but may cause visual lag,
  -- while lower values may cause performance penalties. default 150.
  refresh_interval = 250,
  -- sign priorities for each type of mark - builtin marks, uppercase marks, lowercase
  -- marks, and bookmarks.
  -- can be either a table with all/none of the keys, or a single number, in which case
  -- the priority applies to all marks.
  -- default 10.
  sign_priority = { lower=10, upper=15, builtin=8, bookmark=20 },
  -- disables mark tracking for specific filetypes. default {}
  excluded_filetypes = {},
  -- marks.nvim allows you to configure up to 10 bookmark groups, each with its own
  -- sign/virttext. Bookmarks can be used to group together positions and quickly move
  -- across multiple buffers. default sign is '!@#$%^&*()' (from 0 to 9), and
  -- default virt_text is "".
  bookmark_0 = {
    sign = "⚑",
    virt_text = "hello world"
  },
  mappings = {}
}

require('Comment').setup()

-- ウインドウリサイズの移動量
vim.g.winresizer_vert_resize  = 1
vim.g.winresizer_horiz_resize = 1

-- keymap
vim.api.nvim_set_keymap("n", "th", ":tabprevious<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "tl", ":tabnext<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "tq", ":tabclose<CR>", {noremap = true, silent = true})

-- telescope
-- .git/以外の隠しファイルを表示する
vim.api.nvim_set_keymap("n", ",f", ":Telescope find_files find_command=rg,--files,--no-ignore,--hidden,--glob,!.git/,--glob,!venv/,--glob,!node_modules/<CR>", {noremap = true, silent = true})
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

-- ハイライト
vim.cmd [[
  nmap <Space>h <Plug>(quickhl-manual-this)
  xmap <Space>h <Plug>(quickhl-manual-this)
  nmap <Space>H <Plug>(quickhl-manual-clear)
  vmap <Space>H <Plug>(quickhl-manual-clear)
  nmap <Space>r <Plug>(quickhl-manual-reset)
  xmap <Space>r <Plug>(quickhl-manual-reset)
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
vim.g.gruvbox_material_background = 'hard'
vim.cmd [[
  try
    colorscheme kanagawa
  catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme desert
    set background=dark
  endtry
]]
vim.cmd [[set iskeyword+=-]]
