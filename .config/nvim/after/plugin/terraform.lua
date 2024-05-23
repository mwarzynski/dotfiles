local autocmd = vim.api.nvim_create_autocmd 
autocmd('BufRead', {
    pattern = "*.tf",
    command = "autocmd BufWritePre <buffer> lua vim.lsp.buf.format()"
})

