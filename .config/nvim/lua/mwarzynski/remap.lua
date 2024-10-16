vim.g.mapleader = " "

vim.keymap.set("n", "<C-n>", vim.cmd.Ex)

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("v", "<leader>f", function()
    vim.lsp.buf.format()
end)

-- Diagnostic information
vim.api.nvim_set_keymap('n', '<C-j>', ':lua vim.diagnostic.goto_next()<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', ':lua vim.diagnostic.goto_prev()<CR>', { silent = true })
vim.api.nvim_set_keymap('n', 'ga', ':lua vim.lsp.buf.code_action()<CR>', { silent = false })

