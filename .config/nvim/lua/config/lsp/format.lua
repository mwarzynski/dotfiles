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
                extra_args = { "--fast", "-l", "120" },
            }),
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

            if on_attach then
                on_attach(client, bufnr)
            end
        end,
    })
end

return M
