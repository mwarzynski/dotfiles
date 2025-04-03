vim.api.nvim_create_autocmd('BufRead', {
    pattern = "*.tsx",
    command = "autocmd BufWritePre <buffer> lua vim.bo.shiftwidth = 2"
})
vim.api.nvim_create_autocmd('BufRead', {
    pattern = "*.tsx",
    command = "autocmd BufWritePre <buffer> lua vim.lsp.buf.format()"
})
