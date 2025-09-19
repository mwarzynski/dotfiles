local M = {}

function M.setup(original_on_attach_func, capabilities_table)
	vim.lsp.config("clangd", {
		capabilities = capabilities_table,
		filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "cc", "cxx", "h", "hpp", "hxx" }, -- Comprehensive filetype list
		cmd = {
			"clangd",
			"--fallback-style=llvm", -- Or 'google', 'webkit', 'mozilla', or your preferred style
			-- "--query-driver=/usr/bin/**/g++*", -- Example: help clangd find compiler for system headers
			-- "--compile-commands-dir=build", -- Specify directory of compile_commands.json (relative to project root)
			-- "--clang-tidy",                -- Enable clang-tidy diagnostics (requires .clang-tidy config)
			-- "-j=4",                        -- Number of workers
			-- "--header-insertion=iwyu",     -- Use 'include-what-you-use' for header insertion
		},
		-- For clangd to work effectively on projects, a 'compile_commands.json' file is usually necessary.
		-- This file helps clangd understand your project's build flags, include paths, and defines.
		-- CMake and other build systems can generate this file.
		-- For single files or simple projects, clangd might work without it but may show false errors.

		on_attach = function(client, bufnr)
			-- If you plan to use null-ls with clang-format for formatting (recommended for consistency),
			-- disable clangd's native document formatting capabilities.
			client.server_capabilities.documentFormattingProvider = false
			client.server_capabilities.documentRangeFormattingProvider = false

			-- Call the original shared on_attach function for other LSP setups (keymaps, etc.)
			if original_on_attach_func then
				original_on_attach_func(client, bufnr)
			end
		end,
	})
end

return M
