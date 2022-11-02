vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    -- Base16 colorschemes.
    use "RRethy/nvim-base16"
    -- Nice panel at the bottom.
    use "itchyny/lightline.vim"
    -- GIT status of the current file -- shows changed/added lines.
    use "airblade/vim-gitgutter"
    -- Telescope (easy access to files)
    use {
      'nvim-telescope/telescope.nvim', tag = '0.1.0',
      requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- Autocompletion -- conquer of completion
    use {'neoclide/coc.nvim', branch = 'release'}
    -- Autocompletion -- fast as fuck.
    -- use {'ms-jpq/coq_nvim', branch = 'coq'}
    -- use {'ms-jpq/coq.artifacts', branch = 'artifacts'}

    -- Python linter.
    use "psf/black"

    -- Golang language plugin.
    use "fatih/vim-go"

    -- Rust
    use "rust-lang/rust.vim"
end)
