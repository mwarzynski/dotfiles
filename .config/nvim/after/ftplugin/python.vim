" Do not wrap Python source code.
set nowrap
set sidescroll=5
set sidescrolloff=2
set colorcolumn=120

" For delimitMate
let b:delimitMate_matchpairs = "(:),[:],{:}"

" Don't highlight nodes as it is distracting.
let g:semshi#mark_selected_nodes = 0

" Linter should treat lines with width up to 120 characters as correct.
let g:black_linelength = 120

" Automatically format Python code on save.
augroup black_on_save
  autocmd!
  autocmd BufWritePre *.py Black
augroup end
