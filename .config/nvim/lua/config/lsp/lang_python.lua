-- TODO: Move the python3_host_prog to another place with the basic Neovim configuration?
vim.g.python3_host_prog = "~/.vim/venv/bin/python"

local M = {}

function M.setup(on_attach_func, capabilities_table)
	require("lspconfig").pyright.setup({
		on_attach = on_attach_func,
		capabilities = capabilities_table,
		settings = {
			python = {
				analysis = {
					typeCheckingMode = "basic",
					diagnosticMode = "workspace",
					autoSearchPaths = true,
					useLibraryCodeForTypes = true,
					ignore = { "**/venv/**", "**/.venv/**", "**/__pycache__/**" },
				},
			},
		},
	})
end

return M
