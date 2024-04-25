require('telescope').setup{
    defaults = {
        file_ignore_patterns = {
            "vendor"
        }
    }
}

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<C-e>', builtin.find_files, {})
vim.keymap.set('n', '<C-g>', builtin.live_grep, {})
-- vim.keymap.set('n', '<C-e>', builtin.git_files, {})
-- vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
-- vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

local telescope = require('telescope')
telescope.load_extension('project')

vim.keymap.set(
        'n',
        '<C-p>',
        ":lua require'telescope'.extensions.project.project{}<CR>",
        {noremap = true, silent = true}
)
