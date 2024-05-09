local wezterm = require 'wezterm';
return {
  -- What to set the TERM variable to
  term = "xterm-256color",

  use_ime = true,

  audible_bell = "Disabled",

  -- font
  font = wezterm.font("UDEV Gothic NF", {bold=true, italic=false}),
  font_size = 16.0,

  -- https://github.com/mbadolato/iTerm2-Color-Schemes#screenshots
  -- color_scheme = "Gruvbox Dark",
  -- color_scheme = "Hybrid",
  -- color_scheme = "Monokai (terminal.sexy)",
  -- color_scheme = "Neon (terminal.sexy)",
  -- color_scheme = "PencilDark",
  -- color_scheme = "Sakura",
  color_scheme = "tokyonight",
  -- color_scheme = "Urple",
  -- color_scheme = "WildCherry",

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

  -- キーバインド変更
  -- FIXME SUPERはpoposのウインドウ切り替えと被るので変更したい
  -- https://wezfurlong.org/wezterm/config/keys.html#default-shortcut--key-binding-assignments
  -- SUPER == command
  -- https://wezfurlong.org/wezterm/config/lua/keyassignment/index.html
  keys = {
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
  },
}
