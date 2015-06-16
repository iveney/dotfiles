local application = require "mjolnir.application"
local window = require "mjolnir.window"
local fnutils = require "mjolnir.fnutils"
local alert = require "mjolnir.alert"
local hotkey = require "mjolnir.hotkey"
local grid = require "mjolnir.sd.grid"
local tiling = require "mjolnir.tiling"
local geometry = require "mjolnir.geometry"

local mash = {"ctrl", "alt", "cmd"}
local delta = 80

-- Tiling

hotkey.bind(mash, "c", function() tiling.cyclelayout() end)
hotkey.bind(mash, ".", function() tiling.cycle(1) end)
hotkey.bind(mash, ",", function() tiling.cycle(-1) end)
hotkey.bind(mash, "space", function() tiling.promote() end)

-- reload config

hotkey.bind(mash, "R", function()
  mjolnir.reload()
end)

local move = function(dx, dy)
	return function()
		  local win = window.focusedwindow()
		  local f = win:frame()
		  f.x = f.x + dx
		  f.y = f.y + dy
		  win:setframe(f)
	end
end

local resize = function(dx, dy)
	return function()
		  local win = window.focusedwindow()
		  -- alert.show(geometry.rect(1,2,3,4))
		  local frame = win:frame()
		  frame.x = frame.x - dx/2
		  frame.w = frame.w + dx
		  frame.y = frame.y - dy/2
		  frame.h = frame.h + dy
		  win:setframe(frame)
	end
end	

-- move the window
hotkey.bind(mash, "Left", move(-delta, 0))
hotkey.bind(mash, "Right", move(delta, 0))
hotkey.bind(mash, "Up", move(0, -delta))
hotkey.bind(mash, "Down", move(0, delta))

-- expand/shrink the window
hotkey.bind(mash, '=', resize(delta, delta))
hotkey.bind(mash, '-', resize(-delta, -delta))
hotkey.bind(mash, '[', resize(-delta, 0))
hotkey.bind(mash, ']', resize(delta, 0))
hotkey.bind(mash, ';', resize(0, -delta))
hotkey.bind(mash, '\'', resize(0, delta))

-- snap the window

grid.MARGINX = 0
grid.MARGINY = 0
grid.GRIDWIDTH = 2
grid.GRIDHEIGHT = 2

-- a helper function that returns another function that resizes the current window
-- to a certain grid size.
local gridset = function(x, y, w, h)
    return function()
        cur_window = window.focusedwindow()
        grid.set(
            cur_window,
            {x=x, y=y, w=w, h=h},
            cur_window:screen()
        )
    end
end

hotkey.bind(mash, 'n', grid.pushwindow_nextscreen)
hotkey.bind(mash, 'j', gridset(0, 0, 1, 2)) -- left half
hotkey.bind(mash, 'l', gridset(1, 0, 1, 2)) -- right half
hotkey.bind(mash, 'i', gridset(0, 0, 2, 1)) -- up half
hotkey.bind(mash, 'k', gridset(0, 1, 2, 1)) -- bottom half
hotkey.bind(mash, 'm', grid.maximize_window)-- maximize
