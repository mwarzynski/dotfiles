vim.g.python3_host_prog = "~/.vim/venv/bin/python"
vim.g.black_use_virtualenv = false
vim.g.black_linelength = 120

vim.api.nvim_command("autocmd BufWritePre *.py silent! Black")
