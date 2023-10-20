local autocmd = vim.api.nvim_create_autocmd
autocmd('BufRead', {
    pattern = "*.tsx",
    command = "autocmd BufWritePre <buffer> lua vim.bo.shiftwidth = 2"
})
autocmd('BufRead', {
    pattern = "*.tsx",
    command = "autocmd BufWritePre <buffer> lua vim.lsp.buf.format()"
})
