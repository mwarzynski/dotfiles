local autocmd = vim.api.nvim_create_autocmd 
autocmd('BufRead', {
    pattern = "*.go",
    command = "autocmd BufWritePre <buffer> lua vim.lsp.buf.format()"
})
