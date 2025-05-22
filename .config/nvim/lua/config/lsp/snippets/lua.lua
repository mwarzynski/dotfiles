local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local fmt = require("luasnip.extras.fmt").fmt

return {
	-- Module definition
	s(
		"module",
		fmt(
			[[
local M = {{}}

function M.{}()
  {}
end

return M
]],
			{ i(1, "func_name"), i(0) }
		)
	),

	-- Local function
	s(
		"lfun",
		fmt(
			[[
local function {}({})
  {}
end
]],
			{ i(1, "function_name"), i(2, "params"), i(0) }
		)
	),

	-- Require module
	s("req", fmt([[local {} = require("{}")]], { i(2, "module_name"), i(1, "module_path") })),

	-- Protected call
	s(
		"pcall",
		fmt(
			[[
local ok, {} = pcall(require, "{}")
if not ok then
  vim.notify("Error loading {}: " .. tostring({}), vim.log.levels.ERROR)
  return
end
]],
			{
				i(1, "module_var"),
				i(2, "module_name"),
				i(3, "module_name_display", { alias = "module_name" }),
				i(0, "", { hidden = true, alias = "module_var" }),
			}
		)
	),
}
