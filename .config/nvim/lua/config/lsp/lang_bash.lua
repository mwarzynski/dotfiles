local M = {}

function M.setup(on_attach_func, capabilities_table)
	vim.lsp.config("bashls", {
		on_attach = on_attach_func,
		capabilities = capabilities_table,
		filetypes = { "sh", "bash" },
	})
end

return M
