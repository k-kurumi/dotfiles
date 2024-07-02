local wezterm = require 'wezterm';

-- キーバインド変更
-- https://wezfurlong.org/wezterm/config/keys.html#default-shortcut--key-binding-assignments
-- https://wezfurlong.org/wezterm/config/lua/keyassignment/index.html

-- OS判定
-- https://wezfurlong.org/wezterm/config/lua/wezterm/target_triple.html
-- x86_64-pc-windows-msvc - Windows
-- x86_64-apple-darwin - macOS (Intel)
-- aarch64-apple-darwin - macOS (Apple Silicon)
-- x86_64-unknown-linux-gnu - Linux
if wezterm.target_triple == 'x86_64-unknown-linux-gnu' then
  MY_KEYS = {
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
  }
end

if wezterm.target_triple == 'aarch64-apple-darwin' or wezterm.target_triple == 'x86_64-apple-darwin' then
  MY_KEYS = {
    -- cmd+h 左のタブを表示する
    { key = "h", mods = "SUPER", action = wezterm.action{ActivateTabRelative = -1} },
    -- cmd+l 右のタブを表示する
    { key = "l", mods = "SUPER", action = wezterm.action{ActivateTabRelative = 1} },

    -- cmd+n タブを開く
    { key = "n", mods = "SUPER", action = wezterm.action{SpawnTab = "CurrentPaneDomain"} },

    -- cmd+H タブを左に移動する
    { key = "H", mods = "SUPER", action = wezterm.action{MoveTabRelative = -1} },
    -- cmd+L タブを右に移動する
    { key = "L", mods = "SUPER", action = wezterm.action{MoveTabRelative = 1} },

    -- ズーム周り
    { key = "=", mods = "SUPER", action = wezterm.action.IncreaseFontSize },
    { key = "-", mods = "SUPER", action = wezterm.action.DecreaseFontSize },
    { key = "0", mods = "SUPER", action = wezterm.action.ResetFontSize },
  }
end

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
  color_scheme = "Monokai Vivid",
  -- color_scheme = "Sakura",

  -- background = {
  --   {
  --     source = {
  --       -- ~は使えない
  --       File = os.getenv("HOME") .. "/dotfiles/images/stained-glass.jpg",
  --     },
  --     -- sourceは改行しても固定
  --     attachment = "Fixed",
  --     -- sourceの明度
  --     hsb =  { brightness = 0.005 },
  --     -- 背景透過 0に近いほど透過する
  --     opacity = 1.0,
  --     horizontal_offset = 0,
  --     vertical_offset = 0,
  --   },
  -- },

  -- 背景透過 1.0が不透過
  window_background_opacity = 0.95,

  keys = MY_KEYS,
}
