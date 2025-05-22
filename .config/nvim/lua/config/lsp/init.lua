-- ----------------------------------------------------
-- 1. LSP Diagnostics Configuration
-- ----------------------------------------------------
vim.diagnostic.config({
    virtual_text = true,       -- Enables inline diagnostic messages
    signs = true,              -- Shows signs in the gutter
    underline = true,          -- Underlines the problematic text
    update_in_insert = true,   -- Prevents updates while in insert mode
    severity_sort = true,      -- Sort diagnostics by severity
})

-- ----------------------------------------------------
-- 2. Define shared 'on_attach' function
-- ----------------------------------------------------
local on_attach = function(client, bufnr)
    -- Enable completion for the buffer (if you're using built-in or cmp source for LSP)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Buffer-local keymaps for common LSP actions
    local buf_set_keymap = vim.api.nvim_buf_set_keymap -- This is 'vim.api.nvim_buf_set_keymap'
    local opts = { noremap = true, silent = true }

    buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap(bufnr, 'n', 'gl', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap(bufnr, 'n', 'ga', '<cmd> vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap(bufnr, 'n', 'gr', '<cmd> vim.lsp.buf.rename()<CR>', opts)

    buf_set_keymap(bufnr, 'n', '<C-h>', '<cmd> vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap(bufnr, 'n', '<C-j>', '<cmd> vim.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd> vim.diagnostic.goto_prev()<CR>', opts)

    -- Optional: Auto-format on save if the client supports it
    if client.supports_method("textDocument/formatting") then
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = vim.api.nvim_create_augroup("LspFormatting." .. bufnr, {}),
            buffer = bufnr,
            callback = function()
                vim.lsp.buf.format({ bufnr = bufnr })
            end,
        })
    end
end

vim.keymap.set('n', 'gs', function()
        vim.diagnostic.setloclist()  -- Populate the location list with diagnostics
        vim.cmd('lopen')  -- Open the location list window
    end,
    { silent = true }
)

-- ----------------------------------------------------
-- 3. Define shared 'capabilities' for nvim-cmp integration
-- ----------------------------------------------------
-- This enhances Neovim's default LSP client capabilities for nvim-cmp
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- ----------------------------------------------------
-- 4. Setup Mason and Mason-LSPconfig
-- ----------------------------------------------------
require("mason").setup()
require("mason-lspconfig").setup({
    automatic_enable = true,
    -- ensure_installed = { "lua_ls", "python_ls", "gopls", "dockerls" },
})

-- ----------------------------------------------------
-- 5. Load other LSP related configurations
--    Pass 'on_attach' and 'capabilities' to them.
-- ----------------------------------------------------
-- Assuming each 'lang_*.lua' module is now a function that accepts these arguments.
require("config.lsp.completion")
require("config.lsp.format").setup(on_attach)
require("config.lsp.format_whitespace")

require("config.lsp.lang_python").setup(on_attach, capabilities)
require("config.lsp.lang_go").setup(on_attach, capabilities)
require("config.lsp.lang_docker").setup(on_attach, capabilities)
