local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local f = ls.function_node
local fmt = require("luasnip.extras.fmt").fmt

return {
	-- Date
	s("date", {
		f(function()
			return os.date("%Y-%m-%d")
		end, {}),
	}),

	-- Timestamp
	s("datetime", {
		f(function()
			return os.date("%Y-%m-%d %H:%M:%S")
		end, {}),
	}),

	-- Simple Lorem Ipsum
	s("lorem", {
		t({
			"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
		}),
		i(0),
	}),

	-- UUID
	s("uuid", {
		f(function()
			-- Basic pseudo-UUID for snippet purposes. For real UUIDs, use a proper library if available in context.
			local template = "xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx"
			return string.gsub(template, "[xy]", function(c)
				local v = (c == "x") and math.random(0, 0xf) or math.random(8, 0xb)
				return string.format("%x", v)
			end)
		end, {}),
	}),
}
