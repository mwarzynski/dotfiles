local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local fmt = require("luasnip.extras.fmt").fmt

return {
	-- Main guard
	s(
		"ifmain",
		fmt(
			[[
if __name__ == "__main__":
    {}
]],
			{ i(0) }
		)
	),

	-- Try/except block
	s(
		"try",
		fmt(
			[[
try:
    {}
except {} as e:
    {}
]],
			{ i(1, "pass"), i(2, "Exception"), i(0) }
		)
	),

	-- Formatted string
	s("fstr", fmt([[f"{{{}}}"]], { i(1, "variable") })),

	-- Shebang
	s(
		"shebang",
		t({
			"#!/usr/bin/env python3",
			"# -*- coding: utf-8 -*-",
		})
	),
}
