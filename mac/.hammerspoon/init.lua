-- http://shtaxxx.hatenablog.com/entry/2017/01/22/141831
-- https://qiita.com/naoya@github/items/81027083aeb70b309c14
local function keyCode(key, modifiers)
   modifiers = modifiers or {}
   return function()
      hs.eventtap.event.newKeyEvent(modifiers, string.lower(key), true):post()
      hs.timer.usleep(1000)
      hs.eventtap.event.newKeyEvent(modifiers, string.lower(key), false):post()
   end
end

local function remapKey(modifiers, key, keyCode)
   hs.hotkey.bind(modifiers, key, keyCode, nil, keyCode)
end

local function disableAllHotkeys()
   for k, v in pairs(hs.hotkey.getHotkeys()) do
      v['_hk']:disable()
   end
end

local function enableAllHotkeys()
   for k, v in pairs(hs.hotkey.getHotkeys()) do
      v['_hk']:enable()
   end
end

local function handleGlobalAppEvent(name, event, app)
   if event == hs.application.watcher.activated then
      -- hs.alert.show(name)
      -- if name == "Microsoft Word" then
      if string.find(name, "Microsoft") then
         enableAllHotkeys()
      else
         disableAllHotkeys()
      end
   end
end

appsWatcher = hs.application.watcher.new(handleGlobalAppEvent)
appsWatcher:start()

remapKey({'ctrl'}, 'p', keyCode('up'))
remapKey({'ctrl'}, 'n', keyCode('down'))
remapKey({'ctrl'}, 'b', keyCode('left'))
remapKey({'ctrl'}, 'f', keyCode('right'))

remapKey({'ctrl'}, 'a', keyCode('home'))
remapKey({'ctrl'}, 'e', keyCode('end'))

remapKey({'ctrl'}, 'h', keyCode('delete')) -- backspace
remapKey({'ctrl'}, 'd', keyCode('forwarddelete')) -- delete
