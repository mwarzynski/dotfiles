require("telescope").setup({
	defaults = {
		file_ignore_patterns = {
			"vendor",
			"venv",
			"node_modules",
		},
	},
})

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<C-e>", builtin.find_files, {})
vim.keymap.set("n", "<C-f>", builtin.live_grep, {})
