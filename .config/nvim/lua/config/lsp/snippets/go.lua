local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

return {
	s(
		"ife",
		fmt(
			[[
if err != nil {{
    return fmt.Errorf("{}%w", err)
}}
]],
			{ i(1, "error message") }
		)
	),
}
