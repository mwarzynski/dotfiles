let mapleader = " "

" Save file with <leader>s
nnoremap <leader>s <cmd>w<cr>

" Allow to copy to the system register with <leader>y
xnoremap <silent> <leader>y y:call system("wl-copy", @")<cr>
