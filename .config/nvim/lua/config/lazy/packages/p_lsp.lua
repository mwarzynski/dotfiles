return {
    -- Syntax hightlighting
    "nvim-treesitter/nvim-treesitter",

    -- LSP
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",

    -- Autocompletion
    { 'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp', -- LSP source
            'hrsh7th/cmp-buffer',    -- Buffer source
            'hrsh7th/cmp-path',      -- File path completion
            'L3MON4D3/LuaSnip',      -- Snippet engine
            'saadparwaiz1/cmp_luasnip' -- Snippet completion
        }
    },

    -- Python
    "psf/black",
}