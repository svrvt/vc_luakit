------------------------------------------------------------------------
-- Add some convenient keybindings back.                              --
------------------------------------------------------------------------
local settings = require("settings")
local modes = require("modes")

local add_binds = modes.add_binds

add_binds("normal", {
	{
		"b",
		"Back",
		function(w, m)
			w:back(m.count)
		end,
		{ count = 1 },
	},
	{
		"<Mod1-Page_Up>",
		"Reorder tabs",
		function(w, m)
			w.tabs:reorder(w.view, w.tabs:current() - m.count)
		end,
		{ count = 1 },
	},
	{
		"<Mod1-Page_Down>",
		"Reorder tabs",
		function(w, m)
			w.tabs:reorder(w.view, (w.tabs:current() + m.count) % w.tabs:count())
		end,
		{ count = 1 },
	},
})

add_binds("normal", {
	{
		"<Control-c>",
		"Copy selected text.",
		function()
			luakit.selection.clipboard = luakit.selection.primary
		end,
	},
})

add_binds("all", {
	{
		"<Scroll>",
		"Scroll the current page.",
		function(w, o)
			w:scroll({ yrel = settings.window.scroll_step * o.dy })
		end,
	},
})

-- -- Creates new bindings from old ones.
-- modes.remap_binds(
-- 	"normal", -- This is the mode in which the bindings are active.
-- 	{
-- 		--  new     old     removes the old binding (defaults to false)
-- 		{ "O", "t", true },
-- 		-- define as many as you wish
-- 		{ "Control-=", "zi" },
-- 		...,
-- 	}
-- )
-- return _M

-- vim: et:sw=4:ts=8:sts=4:tw=80
