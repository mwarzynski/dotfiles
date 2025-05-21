-- TODO: Move the python3_host_prog to another place with the basic Neovim configuration?
vim.g.python3_host_prog = "~/.vim/venv/bin/python"

local M = {}

function M.setup(on_attach_func, capabilities_table)

    local null_ls = require("null-ls")
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

    null_ls.setup({
        sources = {
            null_ls.builtins.formatting.black,
        },
        on_attach = function(client, bufnr)
            if client.supports_method("textDocument/formatting") then
                vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                vim.api.nvim_create_autocmd("BufWritePre", {
                    group = augroup,
                    buffer = bufnr,
                    callback = function()
                        vim.lsp.buf.format({ bufnr = bufnr })
                    end,
                })
            end

            -- Also call your original on_attach if passed
            if on_attach then
                on_attach(client, bufnr)
            end
        end,
    })

    -- Pyright LSP Server Setup
    require('lspconfig').pyright.setup({
        on_attach = on_attach_func,
        capabilities = capabilities_table,
        settings = {
            python = {
                analysis = {
                    typeCheckingMode = 'basic',
                    diagnosticMode = 'workspace',
                    autoSearchPaths = true,
                    useLibraryCodeForTypes = true,
                    ignore = { "**/venv/**", "**/.venv/**", "**/__pycache__/**" },
                },
            },
        },
    })
end

return M
