call plug#begin('~/.vim/plugged')

" Find files / grep project.
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Nice panel at the bottom.
Plug 'itchyny/lightline.vim'

" Color schemas according to base16.
Plug 'RRethy/nvim-base16'

" GIT status of the current file -- shows changed/added lines.
Plug 'airblade/vim-gitgutter'

" Python linter.
Plug 'psf/black', { 'branch': 'stable' }

" Python improved syntax highlighting.
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }

" Go development plugin
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" " Rainbow parentheses highlighter.
" Plug 'frazrepo/vim-rainbow'

" Autocompletion -- fast as fuck.
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}

" " Autocompletion -- slow, but likely more comprehensive.
" Plug 'neovim/nvim-lspconfig'
" Plug 'hrsh7th/cmp-nvim-lsp'
" Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
" Plug 'hrsh7th/cmp-buffer'
" Plug 'hrsh7th/cmp-path'
" Plug 'hrsh7th/cmp-cmdline'
" Plug 'hrsh7th/nvim-cmp'
" " For vsnip users.
" Plug 'hrsh7th/cmp-vsnip'
" Plug 'hrsh7th/vim-vsnip', {'branch': 'main'}

call plug#end()

