-- [爆速！デスクトップアプリの切り替え！（Mac対象）](https://zenn.dev/yokojp/articles/a4939e92c3fc31)
function toggleApp(appName, key1, key2)
  hs.hotkey.bind({key1}, key2, function()
    local app = hs.application.get(appName)
    if app == nil then
      hs.application.launchOrFocus("/Applications/" .. appName .. ".app")
    elseif app:isFrontmost() then
      app:hide()
    else
      hs.application.launchOrFocus("/Applications/" .. appName .. ".app")
    end
  end)
end

-- toggleApp("Alacritty", "ctrl", ";")
toggleApp("WezTerm", "ctrl", ";")
toggleApp("Alacritty", "ctrl", "'")
toggleApp("Google Chrome", "option", "c")
