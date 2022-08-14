" === VIM built-in settings ===
set nocompatible
filetype plugin indent on
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" turn backup off (you should probably use git to control the code)
set nobackup
set nowb
set noswapfile
set undodir=~/.vim/undodir
set undofile
set hidden

set mouse=a

" use spaces instead of tabs
set expandtab
set smarttab
set smartindent

" 1 tab == 4 spaces by default
set shiftwidth=4
set softtabstop=4
set tabstop=4

" linebreak on 500 characters
set lbr
set tw=500
set ai   "Auto indent
set si   "Smart indent
set wrap "Wrap lines

" require 8 lines of space while scrolling to the end
set scrolloff=8

" show line numbers
set number
set nu
set relativenumber

" searching should try to be smart about cases
set smartcase

" makes search act like search in modern browsers
set incsearch

" don't redraw while executing macros (performance issue)
set lazyredraw

" for regular expressions turn magic on
set magic

" show matching brackets when text indicator is over them
set showmatch

" disable sounds
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" column
set colorcolumn=120
set signcolumn=yes

" enable syntax highlighting
let base16colorspace=256
syntax enable

" set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" utf8 as defualt encoding
set encoding=utf8

" use Unix as the standard file type
set ffs=unix,dos,mac


" Delete trailing white spaces

func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc

augroup MUTEX
    autocmd!
    autocmd BufWritePre * :call DeleteTrailingWS()
augroup END

let mapleader = " "
