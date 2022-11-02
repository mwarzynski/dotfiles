let g:python3_host_prog = expand('/home/mwarzynski/.vim/venv/bin/python3')

augroup black_on_save
  autocmd!
  autocmd BufWritePre *.py Black
augroup end
