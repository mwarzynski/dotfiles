vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    -- Base16 colorschemes.
    use "RRethy/nvim-base16"
    -- Nice panel at the bottom.
    use "itchyny/lightline.vim"
    -- GIT status of the current file -- shows changed/added lines.
    use "airblade/vim-gitgutter"

    -- Python linter.
    use "psf/black"

    -- Golang language plugin.
    use "fatih/vim-go"

    -- Autocompletion -- fast as fuck.
    use {'ms-jpq/coq_nvim', branch = 'coq'}
    use {'ms-jpq/coq.artifacts', branch = 'artifacts'}
    use {'folke/which-key.nvim'}
    use {
      "neovim/nvim-lspconfig",
      opt = true,
      event = "BufReadPre",
      wants = { "nvim-lsp-installer" },
      config = function()
        require("config.lsp").setup()
      end,
      requires = {
        "williamboman/nvim-lsp-installer",
      },
    }
end)