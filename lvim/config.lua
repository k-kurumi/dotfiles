-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

vim.opt.clipboard = ''
vim.opt.virtualedit = 'all'
vim.opt.wrapscan = false

-- jjでコマンドモードに戻る
vim.api.nvim_set_keymap('i', 'jj', '<ESC>', {noremap=true, silent=true})

-- wrap状態でも1行ごとに移動
vim.api.nvim_set_keymap('n', 'j', 'gj', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', 'k', 'gk', {noremap=true, silent=true})

-- bufferの切り替え
vim.api.nvim_set_keymap('n', 'th', ':bp<ENTER>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', 'tl', ':bn<ENTER>', {noremap=true, silent=true})

lvim.plugins = {
  {
    -- sやfでeasymotion風の移動
    "ggandor/lightspeed.nvim",
    opts = {},
  },
  {
    -- 特定文字で囲み
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
      event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
          -- Configuration here, or leave empty to use defaults
          })
    end
  },
  {
    -- カーソルに滑らかな残像が残るようになる
    "sphamba/smear-cursor.nvim",
    opts = {},
  },
}

-- 背景透過処理
lvim.transparent_window = true
