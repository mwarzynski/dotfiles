require('telescope').setup{
    defaults = {
        file_ignore_patterns = {
            "vendor",
            "venv"
        }
    }
}

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-e>', builtin.find_files, {})
