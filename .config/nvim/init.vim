set nocompatible
filetype off


call plug#begin('~/.vim/plugged')

" Universal set of defaults that (hopefully) everyone can agree on
Plug 'tpope/vim-sensible'

" File Tree
" Plug 'preservim/nerdtree'

" Fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Show GIT changes
Plug 'airblade/vim-gitgutter'

" Pretty statusbar
Plug 'itchyny/lightline.vim'

" A collection of language packs for Vim
Plug 'sheerun/vim-polyglot'

" Colorschemes
Plug 'flazz/vim-colorschemes'

" Auto Completion
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Copilot
" Plug 'github/copilot.vim'

" Python linter Black
" Plug 'psf/black'


call plug#end()


" Plugin config.

" ENV
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

let g:copilot_enable = 0

" Run deoplete.nvim automatically
" let g:deoplete#enable_at_startup = 1

" autocmd BufWritePost *.py execute ':Black'
" let g:black_quiet = 1

" General settings.

" show line numbers
set number

" sets how many lines of history VIM has to remember
set history=500

set colorcolumn=160

" enable filetype plugins
filetype plugin on
filetype indent on

" set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","





" Shortcuts

" map NERDTree to Ctrl + N
map <C-n> :NERDTreeToggle<enter>

" map CTRL + d to quit
map <C-d> :q<enter>

" map CTRL + s to write (save)
map <C-s> :w<enter>

" Map CTRL + e to open files with FZF.
map <C-e> :Files<enter>
" Map CTRL + b to switch buffers.
map <C-b> :Buffers<enter>




" User interface.

" set 7 lines to the cursor - when moving vertically using j/k
set so=7

" ignore compiled files
set wildignore=*.o,*~,*.pyc
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store

" always show current position
set ruler

" height of the command bar
set cmdheight=1

" a buffer becomes hidden when it is abandoned
set hid

" searching should try to be smart about cases
set smartcase

" highlight search results
set hlsearch

" makes search act like search in modern browsers
set incsearch

" don't redraw while executing macros (performance issue)
set lazyredraw

" for regular expressions turn magic on
set magic

" show matching brackets when text indicator is over them
set showmatch

" how many tenths of a second to blink when matching brackets
set mat=2

" disable sounds
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" add a bit extra margin to the left
set foldcolumn=1



" Colors and Fonts

" enable syntax highlighting
let base16colorspace=256

colorscheme PaperColor

syntax enable
set background=dark

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



" Files, backups and undo

" turn backup off (you should probably use git to control the code)
set nobackup
set nowb
set noswapfile





" Text, tab and indent related

" use spaces instead of tabs
set expandtab
set smarttab

" 1 tab == 4 spaces by default
set shiftwidth=4
set tabstop=4

" linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines





" Moving around, tabs, windows and buffers

" Make things clickable (tabs)
set mouse=a

" useful mappings for managing tabs
nnoremap <C-PageDown> :tabprevious<CR>
nnoremap <C-PageUp>   :tabnext<CR>
nnoremap <C-t>        :tabnew<CR>

" opens a new tab with the current buffer's path
" super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" return to last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif





" Delete trailing white spaces

func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc

autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.yml :call DeleteTrailingWS()
autocmd BufWrite *.c :call DeleteTrailingWS()
autocmd BufWrite *.cpp :call DeleteTrailingWS()
autocmd BufWrite *.cc :call DeleteTrailingWS()
autocmd BufWrite *.h :call DeleteTrailingWS()
autocmd BufWrite *.rs :call DeleteTrailingWS()
autocmd BufWrite *.tex :call DeleteTrailingWS()




" Misc

" remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm





" Helper functions

function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ag \"" . l:pattern . "\" " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


" returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

if has('nvim')
 nmap <BS> <C-W>h
endif

