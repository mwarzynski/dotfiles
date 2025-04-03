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

-- Gen (Ollama)
vim.keymap.set({ 'n', 'v' }, '<C-a>', ':Gen<CR>')

-- Diagnostic information
vim.api.nvim_set_keymap('n', '<C-j>', ':lua vim.diagnostic.goto_next()<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', ':lua vim.diagnostic.goto_prev()<CR>', { silent = true })
vim.api.nvim_set_keymap('n', 'ga', ':lua vim.lsp.buf.code_action()<CR>', { silent = false })

-- Shortcut for the LLM module
vim.keymap.set('v', '<C-a>', ':Gen<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-a>', ':Gen<CR>', { noremap = true, silent = true })

vim.g.copilot_enabled = 0
-- Accept Copilot suggestion with Ctrl+l
vim.api.nvim_set_keymap('i', '<C-l>', 'copilot#Accept("<CR>")', { silent = true, expr = true })
-- Cycle through Copilot suggestions with Ctrl+n and Ctrl+p
vim.api.nvim_set_keymap('i', '<C-0>', 'copilot#Next()', { silent = true, expr = true })
vim.api.nvim_set_keymap('i', '<C-9>', 'copilot#Previous()', { silent = true, expr = true })

