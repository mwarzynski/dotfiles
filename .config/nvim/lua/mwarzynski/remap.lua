vim.g.mapleader = " "

vim.keymap.set("n", "<C-n>", vim.cmd.Ex)

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "Q", "<nop>")

-- LSP actions
vim.api.nvim_set_keymap('n', '<C-j>', ':lua vim.diagnostic.goto_next()<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', ':lua vim.diagnostic.goto_prev()<CR>', { silent = true })
vim.api.nvim_set_keymap('n', 'gf', ':lua vim.lsp.buf.code_action()<CR>', { silent = false })
vim.api.nvim_set_keymap('n', 'gr', ':lua vim.lsp.buf.rename()<CR>', { silent = false })
vim.keymap.set("v", "<leader>f", function()
    vim.lsp.buf.format()
end)
