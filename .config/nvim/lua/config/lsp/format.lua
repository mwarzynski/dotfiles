-- Format the source code on leader-f
vim.keymap.set("v", "<leader>f", function()
	vim.lsp.buf.format()
end)

local null_ls = require("null-ls")

local M = {}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

function M.setup(on_attach)
	null_ls.setup({
		sources = {
			-- Python
			null_ls.builtins.formatting.isort,
			null_ls.builtins.formatting.black.with({
				extra_args = function(params)
					local default_args = { "--fast" }
					local project_root =
						vim.fs.find({ "pyproject.toml", ".git" }, { upward = true, path = params.bufname })[1]
					local pyproject_toml_path = nil

					if project_root then
						pyproject_toml_path = project_root .. "/pyproject.toml"
					end

					if pyproject_toml_path and vim.fn.filereadable(pyproject_toml_path) == 1 then
						return default_args
					else
						-- No pyproject.toml found (or no project root found),
						-- so use the Neovim default line length of 120.
						return vim.list_extend(vim.deepcopy(default_args), { "-l", "120" })
					end
				end,
			}),

			-- Typescript (prettier)
			null_ls.builtins.formatting.prettierd,

			-- C / C++
			null_ls.builtins.formatting.clang_format,

			-- Lua
			null_ls.builtins.formatting.stylua,
		},
		on_attach = function(client, bufnr)
			if client.supports_method("textDocument/formatting") then
				vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
				vim.api.nvim_create_autocmd("BufWritePre", {
					group = augroup,
					buffer = bufnr,
					callback = function()
						-- Check the global flag before formatting
						if vim.g.auto_save_modifications_enabled ~= false then
							vim.lsp.buf.format({ bufnr = bufnr, timeout_ms = 2000 }) -- [cite: 22]
						end
					end,
				})
			end

			if on_attach then
				on_attach(client, bufnr)
			end
		end,
	})
end

return M
