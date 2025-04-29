vim.diagnostic.config({
    virtual_text = true,     -- Enables inline diagnostic messages
    signs = true,            -- Shows signs in the gutter
    underline = true,        -- Underlines the problematic text
    update_in_insert = true, -- Prevents updates while in insert mode
})

require("mason").setup()
require("mason-lspconfig").setup({})
require("mason-lspconfig").setup_handlers({
    function(server_name)
      require("lspconfig")[server_name].setup({})
    end,
})

require("config.lsp.completion")
require("config.lsp.format")
require("config.lsp.format_whitespace")

require("config.lsp.lang_python")
require("config.lsp.lang_go")

vim.api.nvim_set_keymap('n', 'gd', ':lua vim.lsp.buf.definition()<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<C-h>', ':lua vim.lsp.buf.hover()<CR>', { silent = true })
vim.keymap.set('i', '<C-h>', function() vim.lsp.buf.signature_help() end, { silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', ':lua vim.diagnostic.goto_next()<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', ':lua vim.diagnostic.goto_prev()<CR>', { silent = true })
vim.api.nvim_set_keymap('n', 'gf', ':lua vim.lsp.buf.code_action()<CR>', { silent = false })
vim.api.nvim_set_keymap('n', 'gr', ':lua vim.lsp.buf.rename()<CR>', { silent = false })

vim.keymap.set('n', 'gl', function()
    vim.diagnostic.setloclist()  -- Populate the location list with diagnostics
    vim.cmd('lopen')  -- Open the location list window
  end, { silent = true })
