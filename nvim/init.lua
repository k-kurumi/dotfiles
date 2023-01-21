-- パッケージマネージャを先にインストールする必要あり https://github.com/tani/vim-jetpack
-- curl -fLo ~/.config/nvim/autoload/jetpack.vim --create-dirs https://raw.githubusercontent.com/tani/vim-jetpack/master/autoload/jetpack.vim
-- curl -fLo ~/.config/nvim/lua/jetpack.lua --create-dirs https://raw.githubusercontent.com/tani/vim-jetpack/master/lua/jetpack.lua

-- https://github.com/tani/vim-jetpack#packer-style
vim.cmd('runtime */jetpack.vim')
require('jetpack.packer').startup(function(use)

  -- ステータスライン
  use 'https://github.com/nvim-lualine/lualine.nvim'
  use 'https://github.com/kyazdani42/nvim-web-devicons'

  -- colorscheme
  use 'https://github.com/ellisonleao/gruvbox.nvim'
  use 'https://github.com/joshdick/onedark.vim'
  use 'https://github.com/rebelot/kanagawa.nvim'

  use 'https://github.com/kartikp10/noctis.nvim'
  use 'https://github.com/rktjmp/lush.nvim'

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

  -- treesitterがcue対応していないため
  use 'https://github.com/jjo/vim-cue'

  -- earthly
  use 'https://github.com/earthly/earthly.vim'

  -- コード整形
  use 'https://github.com/junegunn/vim-easy-align'
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

require('hlslens').setup()

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

-- FIXME cocの設定を別ファイルにする

local keyset = vim.keymap.set
-- Autocomplete
function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

-- Use Tab for trigger completion with characters ahead and navigate
-- NOTE: There's always a completion item selected by default, you may want to enable
-- no select by setting `"suggest.noselect": true` in your configuration file
-- NOTE: Use command ':verbose imap <tab>' to make sure Tab is not mapped by
-- other plugins before putting this into your config
local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
keyset("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
keyset("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)

-- Make <CR> to accept selected completion item or notify coc.nvim to format
-- <C-g>u breaks current undo, please make your own choice
keyset("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)

-- Use <c-j> to trigger snippets
keyset("i", "<c-j>", "<Plug>(coc-snippets-expand-jump)")
-- Use <c-space> to trigger completion
keyset("i", "<c-space>", "coc#refresh()", {silent = true, expr = true})

-- Use `[g` and `]g` to navigate diagnostics
-- Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
keyset("n", "[g", "<Plug>(coc-diagnostic-prev)", {silent = true})
keyset("n", "]g", "<Plug>(coc-diagnostic-next)", {silent = true})

-- GoTo code navigation
keyset("n", "gd", "<Plug>(coc-definition)", {silent = true})
keyset("n", "gy", "<Plug>(coc-type-definition)", {silent = true})
keyset("n", "gi", "<Plug>(coc-implementation)", {silent = true})
keyset("n", "gr", "<Plug>(coc-references)", {silent = true})


-- Use K to show documentation in preview window
function _G.show_docs()
    local cw = vim.fn.expand('<cword>')
    if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
        vim.api.nvim_command('h ' .. cw)
    elseif vim.api.nvim_eval('coc#rpc#ready()') then
        vim.fn.CocActionAsync('doHover')
    else
        vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
    end
end
keyset("n", "K", '<CMD>lua _G.show_docs()<CR>', {silent = true})

-- Highlight the symbol and its references on a CursorHold event(cursor is idle)
vim.api.nvim_create_augroup("CocGroup", {})
vim.api.nvim_create_autocmd("CursorHold", {
    group = "CocGroup",
    command = "silent call CocActionAsync('highlight')",
    desc = "Highlight symbol under cursor on CursorHold"
})


-- Symbol renaming
keyset("n", "<leader>rn", "<Plug>(coc-rename)", {silent = true})


-- Formatting selected code
keyset("x", "<leader>f", "<Plug>(coc-format-selected)", {silent = true})
keyset("n", "<leader>f", "<Plug>(coc-format-selected)", {silent = true})


-- Setup formatexpr specified filetype(s)
vim.api.nvim_create_autocmd("FileType", {
    group = "CocGroup",
    pattern = "typescript,json",
    command = "setl formatexpr=CocAction('formatSelected')",
    desc = "Setup formatexpr specified filetype(s)."
})

-- Update signature help on jump placeholder
vim.api.nvim_create_autocmd("User", {
    group = "CocGroup",
    pattern = "CocJumpPlaceholder",
    command = "call CocActionAsync('showSignatureHelp')",
    desc = "Update signature help on jump placeholder"
})

-- Apply codeAction to the selected region
-- Example: `<leader>aap` for current paragraph
local opts = {silent = true, nowait = true}
keyset("x", "<leader>a", "<Plug>(coc-codeaction-selected)", opts)
keyset("n", "<leader>a", "<Plug>(coc-codeaction-selected)", opts)

-- Remap keys for apply code actions at the cursor position.
keyset("n", "<leader>ac", "<Plug>(coc-codeaction-cursor)", opts)
-- Remap keys for apply code actions affect whole buffer.
keyset("n", "<leader>as", "<Plug>(coc-codeaction-source)", opts)
-- Remap keys for applying codeActions to the current buffer
keyset("n", "<leader>ac", "<Plug>(coc-codeaction)", opts)
-- Apply the most preferred quickfix action on the current line.
keyset("n", "<leader>qf", "<Plug>(coc-fix-current)", opts)

-- Remap keys for apply refactor code actions.
keyset("n", "<leader>re", "<Plug>(coc-codeaction-refactor)", { silent = true })
keyset("x", "<leader>r", "<Plug>(coc-codeaction-refactor-selected)", { silent = true })
keyset("n", "<leader>r", "<Plug>(coc-codeaction-refactor-selected)", { silent = true })

-- Run the Code Lens actions on the current line
keyset("n", "<leader>cl", "<Plug>(coc-codelens-action)", opts)


-- Map function and class text objects
-- NOTE: Requires 'textDocument.documentSymbol' support from the language server
keyset("x", "if", "<Plug>(coc-funcobj-i)", opts)
keyset("o", "if", "<Plug>(coc-funcobj-i)", opts)
keyset("x", "af", "<Plug>(coc-funcobj-a)", opts)
keyset("o", "af", "<Plug>(coc-funcobj-a)", opts)
keyset("x", "ic", "<Plug>(coc-classobj-i)", opts)
keyset("o", "ic", "<Plug>(coc-classobj-i)", opts)
keyset("x", "ac", "<Plug>(coc-classobj-a)", opts)
keyset("o", "ac", "<Plug>(coc-classobj-a)", opts)


-- Remap <C-f> and <C-b> to scroll float windows/popups
---@diagnostic disable-next-line: redefined-local
local opts = {silent = true, nowait = true, expr = true}
keyset("n", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts)
keyset("n", "<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts)
keyset("i", "<C-f>",
       'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(1)<cr>" : "<Right>"', opts)
keyset("i", "<C-b>",
       'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(0)<cr>" : "<Left>"', opts)
keyset("v", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts)
keyset("v", "<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts)


-- Use CTRL-S for selections ranges
-- Requires 'textDocument/selectionRange' support of language server
keyset("n", "<C-s>", "<Plug>(coc-range-select)", {silent = true})
keyset("x", "<C-s>", "<Plug>(coc-range-select)", {silent = true})


-- Add `:Format` command to format current buffer
vim.api.nvim_create_user_command("Format", "call CocAction('format')", {})

-- " Add `:Fold` command to fold current buffer
vim.api.nvim_create_user_command("Fold", "call CocAction('fold', <f-args>)", {nargs = '?'})

-- Add `:OR` command for organize imports of the current buffer
vim.api.nvim_create_user_command("OR", "call CocActionAsync('runCommand', 'editor.action.organizeImport')", {})

-- Add (Neo)Vim's native statusline support
-- NOTE: Please see `:h coc-status` for integrations with external plugins that
-- provide custom statusline: lightline.vim, vim-airline
vim.opt.statusline:prepend("%{coc#status()}%{get(b:,'coc_current_function','')}")

-- Mappings for CoCList
-- code actions and coc stuff
---@diagnostic disable-next-line: redefined-local
local opts = {silent = true, nowait = true}
-- Show all diagnostics
keyset("n", "<space>a", ":<C-u>CocList diagnostics<cr>", opts)
-- Manage extensions
keyset("n", "<space>e", ":<C-u>CocList extensions<cr>", opts)
-- Show commands
keyset("n", "<space>c", ":<C-u>CocList commands<cr>", opts)
-- Find symbol of current document
keyset("n", "<space>o", ":<C-u>CocList outline<cr>", opts)
-- Search workspace symbols
keyset("n", "<space>s", ":<C-u>CocList -I symbols<cr>", opts)
-- Do default action for next item
keyset("n", "<space>j", ":<C-u>CocNext<cr>", opts)
-- Do default action for previous item
keyset("n", "<space>k", ":<C-u>CocPrev<cr>", opts)
-- Resume latest coc list
keyset("n", "<space>p", ":<C-u>CocListResume<cr>", opts)

-- coc ここまで

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
vim.o.cursorcolumn = false
vim.o.signcolumn = "yes"
vim.o.mouse = ""

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

-- terminal内でnvimを起動すると<C-[>ではコマンドモードに戻れない jj で戻る
vim.cmd [[
  autocmd TermOpen * startinsert
  nnoremap ,tt :tabedit<cr>:terminal<cr>
  nnoremap ,ts :split<cr>:terminal<cr>
  nnoremap ,tv :vsplit<cr>:terminal<cr>

  " terminalでターミナルモードから抜ける
  tnoremap <Esc> <C-\><C-n>

  " ウインドウ移動
  tnoremap <C-w> <C-\><C-n><C-w>

  " terminal上で起動したnvimからコマンドモードに戻るため
  inoremap <silent> jj <ESC>

  " ポップアップの透過 100に近いほど透明
  set pumblend=30
  " ウインドウの透過
  set winblend=30
]]

-- coc-go golang
vim.cmd [[
  autocmd BufNewFile,BufRead *.go   set filetype=go  noet sw=4 ts=4 sts=4 cindent autoindent
  autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')
  autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.formatDocument')
]]

-- cuelang
vim.cmd [[
  autocmd BufNewFile,BufRead *.cue  set filetype=cue  noet sw=4 ts=4 sts=4 cindent autoindent
]]

-- direnv
vim.cmd [[
  autocmd BufNewFile,BufRead .envrc   set filetype=sh et sw=2 ts=2 sts=2 cindent autoindent
]]

-- earthly
vim.cmd [[
  au BufRead,BufNewFile Earthfile set filetype=Earthfile
  au BufRead,BufNewFile build.earth set filetype=Earthfile
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
