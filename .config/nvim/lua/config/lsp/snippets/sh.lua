local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local fmt = require("luasnip.extras.fmt").fmt
local c = ls.choice_node

return {
	-- Shebang
	s(
		"shebang",
		c(1, {
			t("#!/bin/bash"),
			t("#!/usr/bin/env bash"),
			t("#!/bin/sh"),
		})
	),

	-- Basic if block
	s(
		"if",
		fmt(
			[[
if [ {} ]; then
    {}
fi
]],
			{ i(1, "condition"), i(0) }
		)
	),

	-- If-else block
	s(
		"ife",
		fmt(
			[[
if [ {} ]; then
    {}
else
    {}
fi
]],
			{ i(1, "condition"), i(2, "then_block"), i(0) }
		)
	),

	-- For loop (C-style)
	s(
		"for",
		fmt(
			[[
for (( i = 0; i < {}; i++ )); do
    {}
done
]],
			{ i(1, "count"), i(0) }
		)
	),

	-- While loop
	s(
		"while",
		fmt(
			[[
while [ {} ]; do
    {}
done
]],
			{ i(1, "condition"), i(0) }
		)
	),

	-- Function
	s(
		"sfunc",
		fmt(
			[[
{}() {{
    {}
}}
]],
			{ i(1, "function_name"), i(0) }
		)
	),
}
