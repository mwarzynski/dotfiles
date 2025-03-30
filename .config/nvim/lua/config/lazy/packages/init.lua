return {
	"folke/which-key.nvim",
	{ "folke/neoconf.nvim", cmd = "Neoconf" },
	"RRethy/nvim-base16",
	"mbbill/undotree",
	{ "nvim-telescope/telescope.nvim", tag = "0.1.8", dependencies = { "nvim-lua/plenary.nvim" } },
	"folke/todo-comments.nvim",

	require("config.lazy.packages.p_git"),
	require("config.lazy.packages.p_lsp"),
	require("config.lazy.packages.p_ai"),
}
