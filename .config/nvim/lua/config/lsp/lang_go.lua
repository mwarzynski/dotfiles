local M = {}

function M.setup(on_attach_func, capabilities_table)
	vim.lsp.config("gopls", {
		on_attach = on_attach_func,
		capabilities = capabilities_table,
		settings = {
			gopls = {
				completeUnimported = true,
				usePlaceholders = true,
				analyses = {
					unusedparams = true,
				},
			},
		},
	})
end

return M
