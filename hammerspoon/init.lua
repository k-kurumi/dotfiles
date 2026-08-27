-- https://qiita.com/mishiwata1015/items/5031f0ca55621301b800
local app_map = {}
local mash = {"cmd", "ctrl"}

local function registerAppLauncer(modifier, app)
  table.insert(app_map, string.lower(modifier) .. " - " .. app)
  hs.hotkey.bind(mash, modifier, function ()
    -- hs.alert.show('Cmd + Ctrl + '..modifier, 2) -- 動作確認用
    local app_name = hs.application.get(app)
    if app_name ~= nil and app_name:isFrontmost() then
      app_name:hide()
    else
      hs.application.launchOrFocus(app)
    end
  end)
end

-- ショートカットキーとアプリの紐付け設定
-- browser
registerAppLauncer("G", "Google Chrome")

-- editor
registerAppLauncer("V", "Visual Studio Code")
registerAppLauncer("Z", "Zed")
registerAppLauncer("O", "Obsidian")

-- terminal
registerAppLauncer(";", "Ghostty")
registerAppLauncer("W", "WezTerm")
