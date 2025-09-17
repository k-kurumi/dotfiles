local wezterm = require 'wezterm';

-- -- 表示できている範囲をlvimで開くので普通にコピーモード(shift+ctrl+x)したほうが便利な気がする
-- wezterm.on("trigger-nvim-with-scrollback", function(window, pane)
-- 	local scrollback = pane:get_lines_as_text()
-- 	local name = os.tmpname()
-- 	local f = io.open(name, "w+")
-- 	f:write(scrollback)
-- 	f:flush()
-- 	f:close()
-- 	window:perform_action(
-- 		wezterm.action({ SpawnCommandInNewTab = {
--       -- zshのPATHではなく /usr/bin などの最低限のPATHしか認識していないため
--       -- sudo ln -sf /opt/homebrew/bin/nvim /usr/local/bin/nvim しておく必要あり
-- 			args = { wezterm.home_dir .. '/.local/bin/lvim', name },
-- 		} }),
-- 		pane
-- 	)
-- 	wezterm.sleep_ms(1000)
-- 	os.remove(name)
-- end)

-- キーバインド変更
-- https://wezfurlong.org/wezterm/config/keys.html#default-shortcut--key-binding-assignments
-- https://wezfurlong.org/wezterm/config/lua/keyassignment/index.html

-- OS判定
-- https://wezfurlong.org/wezterm/config/lua/wezterm/target_triple.html
-- x86_64-pc-windows-msvc - Windows
-- x86_64-apple-darwin - macOS (Intel)
-- aarch64-apple-darwin - macOS (Apple Silicon)
-- x86_64-unknown-linux-gnu - Linux
local my_keys = {}
if wezterm.target_triple == 'x86_64-unknown-linux-gnu' then
  my_keys = {
    -- alt+h 左のタブを表示する
    { key = "h", mods = "ALT", action = wezterm.action{ActivateTabRelative = -1} },
    -- alt+l 右のタブを表示する
    { key = "l", mods = "ALT", action = wezterm.action{ActivateTabRelative = 1} },

    -- alt+n タブを開く
    { key = "n", mods = "ALT", action = wezterm.action{SpawnTab = "CurrentPaneDomain"} },

    -- alt+H タブを左に移動する
    { key = "H", mods = "ALT", action = wezterm.action{MoveTabRelative = -1} },
    -- alt+L タブを右に移動する
    { key = "L", mods = "ALT", action = wezterm.action{MoveTabRelative = 1} },

    -- ズーム周り
    { key = "=", mods = "ALT", action = wezterm.action.IncreaseFontSize },
    { key = "-", mods = "ALT", action = wezterm.action.DecreaseFontSize },
    { key = "0", mods = "ALT", action = wezterm.action.ResetFontSize },

    -- {key = "E", mods = "ALT", action = wezterm.action{ EmitEvent = "trigger-nvim-with-scrollback" }},
  }
elseif wezterm.target_triple == 'aarch64-apple-darwin' or wezterm.target_triple == 'x86_64-apple-darwin' then
  my_keys = {
    -- cmd+h 左のタブを表示する
    { key = "h", mods = "CMD", action = wezterm.action{ActivateTabRelative = -1} },
    -- cmd+l 右のタブを表示する
    { key = "l", mods = "CMD", action = wezterm.action{ActivateTabRelative = 1} },

    -- cmd+n タブを開く
    { key = "n", mods = "CMD", action = wezterm.action{SpawnTab = "CurrentPaneDomain"} },

    -- cmd+H タブを左に移動する
    { key = "H", mods = "CMD", action = wezterm.action{MoveTabRelative = -1} },
    -- cmd+L タブを右に移動する
    { key = "L", mods = "CMD", action = wezterm.action{MoveTabRelative = 1} },

    -- ズーム周り
    { key = "=", mods = "CMD", action = wezterm.action.IncreaseFontSize },
    { key = "-", mods = "CMD", action = wezterm.action.DecreaseFontSize },
    { key = "0", mods = "CMD", action = wezterm.action.ResetFontSize },

    -- {key = "e", mods = "CMD", action = wezterm.action{ EmitEvent = "trigger-nvim-with-scrollback" }},
  }
end

-- 接続先によって背景色を変える
-- https://github.com/wez/wezterm/issues/1680

return {
  -- What to set the TERM variable to
  term = "xterm-256color",

  use_ime = true,

  audible_bell = "Disabled",

  -- font
  font = wezterm.font("UDEV Gothic NF", {bold=true, italic=false}),
  font_size = 20.0,

  -- https://github.com/mbadolato/iTerm2-Color-Schemes#screenshots
  -- color_scheme = "Dark Pastel",
  -- color_scheme = "Grey-green",
  -- color_scheme = "Sakura",
  -- color_scheme = "Cobalt2",
  color_scheme = "Dracula",

  -- 背景透過 1.0が不透過
  window_background_opacity = 1.0,

  keys = my_keys,

  -- wezterm connect um790 で接続するとtmuxのようにセッションが回復する
  -- ただ1セッションしかないようにみえる
  -- 今のところForwardAgentが効かないので使いづらい
  -- ssh_domains = {
  --   {
  --     name = 'um790',
  --     remote_address = '192.168.10.200',
  --     username = 'kurumi',
  --     ssh_option = {
  --       ForwardAgent = "yes",
  --     }
  --   }
  -- }

}
