local wezterm = require 'wezterm';
return {
  -- What to set the TERM variable to
  term = "xterm-256color",

  -- 日本語変換途中の文字が見えないので長文は厳しい
  -- 日本語のカーソル移動もおかしい気がする
  use_ime = true,

  -- font
  font = wezterm.font("UDEV Gothic NF", {bold=true, italic=false}),
  font_size = 18.0,

  -- https://github.com/mbadolato/iTerm2-Color-Schemes#screenshots
  color_scheme = "Gruvbox Dark",

  -- 背景透過 1.0が不透過 キー入力の度に点滅するので使わない
  -- window_background_opacity = 0.9,

  -- キーバインド変更
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
    { key = "h", mods = "SHIFT|SUPER", action = wezterm.action{MoveTabRelative = -1} },
    -- cmd+L タブを右に移動する
    { key = "l", mods = "SHIFT|SUPER", action = wezterm.action{MoveTabRelative = 1} },

    -- 基本US配列なのか key = "+",mods = "SUPER" では効かない
    -- cmd++ フォントを大きくする
    -- {key = "+", mods = "SHIFT|SUPER", action = "IncreaseFontSize"},
    { key = "+", mods = "SHIFT|SUPER", action = wezterm.action.IncreaseFontSize },
    { key = "-", mods = "SUPER", action = wezterm.action.DecreaseFontSize },
    { key = "0", mods = "SUPER", action = wezterm.action.ResetFontSize },
  },
}
