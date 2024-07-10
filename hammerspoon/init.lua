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
toggleApp("Google Chrome", "option", "c")
toggleApp("Obsidian", "option", "o")
toggleApp("1Password", "option", "1")
toggleApp("KeePassXC", "option", "k")

-- 英かなアプリの代わりに左右のcmdで英かな切り替え
-- https://zenn.dev/ytk6565/articles/hammerspoon-switch-input-source
local map = hs.keycodes.map
local keyDown = hs.eventtap.event.types.keyDown
local flagsChanged = hs.eventtap.event.types.flagsChanged
local keyStroke = hs.eventtap.keyStroke

local isCmdAsModifier = false

local function switchInputSourceEvent(event)
    local eventType = event:getType()
    local keyCode = event:getKeyCode()
    local flags = event:getFlags()
    local isCmd = flags['cmd']

    if eventType == keyDown then
        if isCmd then
            isCmdAsModifier = true
        end
    elseif eventType == flagsChanged then
        if not isCmd then
            if isCmdAsModifier == false then
                if keyCode == map['cmd'] then
                    keyStroke({}, 0x66, 0) -- 英数キー
                elseif keyCode == map['rightcmd'] then
                    keyStroke({}, 0x68, 0) -- かなキー
                end
            end
            isCmdAsModifier = false
        end
    end
end

eventTap = hs.eventtap.new({keyDown, flagsChanged}, switchInputSourceEvent)
eventTap:start()
