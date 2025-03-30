local M = {}

function M.clean_whitespace()
	if vim.g.auto_save_modifications_enabled == false then
		return
	end

	-- Delete trailing whitespace
	vim.cmd([[%s/\s\+$//e]])
	-- Remove multiple newlines at EOF
	vim.cmd([[%s/\(\n\)\+\%$//e]])
end

vim.api.nvim_create_augroup("LSPAutoCleanWhitespace", { clear = true })

vim.api.nvim_create_autocmd("BufWritePre", {
	group = "LSPAutoCleanWhitespace",
	pattern = "*",
	callback = M.clean_whitespace,
})
