local M = {}

function M.setup(on_attach_func, capabilities_table)
	require("lspconfig").bashls.setup({
		on_attach = on_attach_func,
		capabilities = capabilities_table,
		filetypes = { "sh", "bash" },
	})
end

return M
