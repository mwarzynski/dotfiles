set nocompatible
filetype off


call plug#begin('~/.local/share/nvim/plugged')

" Universal set of defaults that (hopefully) everyone can agree on
Plug 'tpope/vim-sensible'

" Mappings to easily delete, change and add such surroundings in pairs
Plug 'tpope/vim-surround'

" Show GIT changes
Plug 'airblade/vim-gitgutter'

" File tree view
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'

" Pretty statusbar
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" A collection of language packs for Vim
Plug 'sheerun/vim-polyglot'

" Colorschemes
Plug 'flazz/vim-colorschemes'

" C completion
Plug 'roxma/nvim-completion-manager'
Plug 'roxma/ncm-clang'

" Autocompletion
Plug 'Shougo/deoplete.nvim'

" Python completion
Plug 'zchee/deoplete-jedi'

" Syntastic plugin (for checking syntax)
Plug 'vim-syntastic/syntastic'

" Go plugin
"Plug 'fatih/vim-go'

call plug#end()





" Plugin config.

let g:airline_powerline_fonts = 1
let g:airline_theme='dark'

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#close_symbol = '×'
let g:airline#extensions#tabline#show_close_button = 0

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = { 'mode': '', 'passive_filetypes': ['asm'] }

let g:syntastic_c_no_default_include_dirs = 1
let g:syntastic_c_compiler_options = ''


let g:clang_library_path='/usr/lib'
au FileType c,cpp  nmap gd <Plug>(clang_complete_goto_declaration)

let g:deoplete#enable_at_startup = 1

let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'

autocmd CompleteDone * pclose!





" ENV
let $NVIM_TUI_ENABLE_TRUE_COLOR=1





" General settings.

" show line numbers
set number

" sets how many lines of history VIM has to remember
set history=500

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
map <C-n> :NERDTreeToggle<CR>

" map CTRL + d to quit
map <C-d> :q<CR>






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

" move vertically visually
nnoremap k gj
nnoremap j gk

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






" Misc

" remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>






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

