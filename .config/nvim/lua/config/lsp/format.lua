-- Format the source code on leader-f
vim.keymap.set("v", "<leader>f", function()
    vim.lsp.buf.format()
end)
