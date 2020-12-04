local wezterm = require 'wezterm';
return {
  -- What to set the TERM variable to
  term = "xterm-256color",

  -- 日本語変換途中の文字が見えないので長文は厳しい
  -- 日本語のカーソル移動もおかしい気がする
  use_ime = true,

  -- font
  font = wezterm.font("Cica", {bold=true, italic=false}),
  font_size = 14.0,

  -- https://github.com/mbadolato/iTerm2-Color-Schemes#screenshots
  color_scheme = "Molokai",

  -- デフォルトのショートカット
  -- https://wezfurlong.org/wezterm/config/keys.html#default-shortcut--key-binding-assignments
}
