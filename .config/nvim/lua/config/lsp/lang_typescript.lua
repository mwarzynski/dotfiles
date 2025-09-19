local M = {}

function M.setup(on_attach_func, capabilities_table)
	vim.lsp.config("ts_ls", {
		capabilities = capabilities_table,
		filetypes = {
			"javascript",
			"javascriptreact",
			"javascript.jsx",
			"typescript",
			"typescriptreact",
			"typescript.tsx",
		},
		on_attach = function(client, bufnr)
			-- Disable document formatting capabilities from ts_ls
			-- This ensures null-ls (with Prettier) is the primary formatter
			client.server_capabilities.documentFormattingProvider = false
			client.server_capabilities.documentRangeFormattingProvider = false

			-- Now call the original shared on_attach function
			-- (This function sets up keymaps, highlights, etc.
			-- It also tries to set up auto-formatting on save[cite: 6, 7],
			-- but it won't for ts_ls if documentFormattingProvider is false)
			if on_attach_func then
				on_attach_func(client, bufnr)
			end
		end,
	})

	-- Enable ESLint as a separate LSP for richer diagnostics
	vim.lsp.config("eslint", {
		on_attach = on_attach_func,
		capabilities = capabilities_table,
		filetypes = { -- Ensure it runs on all relevant filetypes
			"javascript",
			"javascriptreact",
			"javascript.jsx",
			"typescript",
			"typescriptreact",
			"typescript.tsx",
		},
		settings = {
			-- Ensure ESLint uses the project's .eslintrc.js, .eslintrc.json etc.
			workingDirectories = { mode = "auto" },
		},
	})

	-- Enable Tailwind
	vim.lsp.config("tailwindcss", {
		on_attach = on_attach_func,
		capabilities = capabilities_table,
		filetypes = { "html", "css", "javascriptreact", "typescriptreact", "vue" },
	})
end

return M
