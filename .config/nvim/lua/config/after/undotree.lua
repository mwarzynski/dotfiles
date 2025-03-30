vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.api.nvim_set_keymap("n", "<leader>u", ":UndotreeShow<CR>", { noremap = true, silent = true })
