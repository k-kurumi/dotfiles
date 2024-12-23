// Future versions of Hyper may add additional config options,
// which will not automatically be merged into this file.
// See https://hyper.is#cfg for all currently supported options.

module.exports = {
  config: {
    // Choose either "stable" for receiving highly polished,
    // or "canary" for less polished but more frequent updates
    updateChannel: "stable",

    // default font size in pixels for all tabs
    fontSize: 20,

    // font family with optional fallbacks
    // fontFamily: "Cica",
    // fontFamily: "HackGenNerd Console",
    fontFamily: "UDEV Gothic NF",

    // default font weight: 'normal' or 'bold'
    fontWeight: "bold",

    // font weight for bold characters: 'normal' or 'bold'
    fontWeightBold: "bold",

    // line height as a relative unit
    lineHeight: 1,

    // letter spacing as a relative unit
    letterSpacing: 1,

    // terminal cursor background color and opacity (hex, rgb, hsl, hsv, hwb or cmyk)
    cursorColor: "rgba(248,28,229,0.8)",

    // `BEAM` for |, `UNDERLINE` for _, `BLOCK` for █
    cursorShape: "BLOCK",

    // set to true for blinking cursor
    cursorBlink: false,

    // color of the text
    foregroundColor: "#fff",

    // terminal background color
    backgroundColor: "#000",

    // border color (window, tabs)
    borderColor: "#333",

    // custom css to embed in the main window
    css: "",

    // custom css to embed in the terminal window
    termCSS: "",

    // set to `true` (without backticks) if you're using a Linux setup that doesn't show native menus
    // default: `false` on Linux, `true` on Windows (ignored on macOS)
    showHamburgerMenu: "",

    // set to `false` if you want to hide the minimize, maximize and close buttons
    // additionally, set to `'left'` if you want them on the left, like in Ubuntu
    // default: `true` on windows and Linux (ignored on macOS)
    showWindowControls: "",

    // custom padding (css format, i.e.: `top right bottom left`)
    padding: "0px 0px 0px 0px",

    // the full list. if you're going to provide the full color palette,
    // including the 6 x 6 color cubes and the grayscale map, just provide
    // an array here instead of a color map object
    colors: {
      black: "#000000",
      red: "#ff0000",
      green: "#33ff00",
      yellow: "#ffff00",
      blue: "#0066ff",
      magenta: "#cc00ff",
      cyan: "#00ffff",
      white: "#d0d0d0",
      lightBlack: "#808080",
      lightRed: "#ff0000",
      lightGreen: "#33ff00",
      lightYellow: "#ffff00",
      lightBlue: "#0066ff",
      lightMagenta: "#cc00ff",
      lightCyan: "#00ffff",
      lightWhite: "#ffffff",
    },

    // the shell to run when spawning a new session (i.e. /usr/local/bin/fish)
    // if left empty, your system's login shell will be used by default
    //
    // Windows
    // - Make sure to use a full path if the binary name doesn't work
    // - Remove `--login` in shellArgs
    //
    // Bash on Windows
    // - Example: `C:\\Windows\\System32\\bash.exe`
    //
    // Powershell on Windows
    // - Example: `C:\\WINDOWS\\System32\\WindowsPowerShell\\v1.0\\powershell.exe`
    shell: "",

    // for setting shell arguments (i.e. for using interactive shellArgs: ['-i'])
    // by default ['--login'] will be used
    shellArgs: ["--login"],

    // for environment variables
    env: { LANG: "ja_JP.UTF-8" },

    // set to false for no bell
    bell: false,

    // if true, selected text will automatically be copied to the clipboard
    copyOnSelect: true,

    // if true, on right click selected text will be copied or pasted if no
    // selection is present (true by default on Windows)
    // quickEdit: true

    // URL to custom bell
    // bellSoundURL: 'http://example.com/bell.mp3',

    // for advanced config flags please refer to https://hyper.is/#cfg
    //

    // 透過率 1 に近いほど透過なし
    opacity: {
      focus: 0.95,
      blur: 0.8,
    },

    summon: {
      hideDock: true,
      hideOnBlur: false,
      hotkey: "Ctrl+;",
    },

    // overlay: {
    //   animate: false,
    //   hotkeys: ["Ctrl+;"],
    //   size: 0.4,
    //   unique: true,
    // },

  },

  // a list of plugins to fetch and install from npm
  // format: [@org/]project[#version]
  // examples:
  //   `hyperpower`
  //   `@company/project`
  //   `project#1.0.1`
  plugins: [
    // https://github.com/bnb/awesome-hyper
    // 複数行の貼り付け時に確認ウインドウを出す
    "hyperterm-safepaste",

    // 背景透過
    'hyper-opacity',

    // color theme
    // "hyper-gruvbox",
    // "hyper-dracula",
    "hyper-flat",

    // カーソルを目立たせる
    'hyperpower',

    // タブをマウスで移動できる
    "hyper-dnd-tabs",

    // タブをクリックしてリネームできる
    "hyper-rename-tab",

    // 現在のタブにマークが表示される
    "hyper-active-tab",

    // 色付きの枠
    "hyperborder",

    // 最前面に表示
    // "hyper-always-on-top",

    // ショートカットキーでウインドウ表示非表示切り替え
    // hyperterm-overlayとキーを取り合うため同時に使えない
    "hyperterm-summon",

    // guake風のターミナル(hyperterm-summonに比べて表示位置の自由度が低い)
    // forkされたhyper-overlayは表示がおかしくなるため使用しない
    // "hyperterm-overlay",

    // ウインドウ枠を消す(ドラッグできなくてウインドウ移動しづらい)
    // "hyperminimal",
    //
    // フルスクリーン
    // "hyperfull",
    //
    // ワークスペースを1つ占有するタイプ
    // "hyperfullscreen",
  ],

  gruvboxTheme: {
    style: "dark",
    contrast: "normal",
  },

  // in development, you can create a directory under
  // `~/.hyper_plugins/local/` and include it here
  // to load it and avoid it being `npm install`ed
  localPlugins: [],

  keymaps: {
    // https://github.com/zeit/hyper/blob/canary/app/keymaps/darwin.json
    "tab:new": "command+n",
    "tab:prev": "command+h",
    "tab:next": "command+l",
  },
};
