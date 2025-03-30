local M = {}

function M.setup(on_attach_func, capabilities_table)
	require("lspconfig").rust_analyzer.setup({
		on_attach = on_attach_func, -- Use the shared on_attach function
		capabilities = capabilities_table, -- Use the shared capabilities table

		settings = {
			-- rust-analyzer specific settings
			-- https://rust-analyzer.github.io/manual.html#configurations
			["rust-analyzer"] = {
				-- Example: Enable clippy checks on save
				-- checkOnSave = {
				--   command = "clippy"
				-- },
				diagnostics = {
					enable = true,
					disabled = { "inactive-code" }, -- example: disable specific warnings
				},
				-- hover actions: enable all hover actions
				hoverActions = {
					enable = true,
					implementations = true,
					run = true,
					debug = true,
					gotoTypeDef = true,
				},
				-- Inlay hints (optional, can be a bit verbose for some)
				inlayHints = {
					chainingHints = true,
					closingBraceHints = true,
					closureCaptureHints = true,
					lifetimeElisionHints = true,
					maxLength = 25,
					parameterHints = true,
					reborrowHints = true,
					typeHints = true,
				},
				cargo = {
					-- features = "all", -- or specify certain features
					loadOutDirsFromCheck = true,
					runBuildScripts = true,
				},
				procMacro = {
					enable = true,
					ignored = {},
				},
			},
		},
	})
end

return M
