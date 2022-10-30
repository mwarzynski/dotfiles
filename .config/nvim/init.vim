lua require('plugins')

let s:core_conf_files = [
      \ 'general.vim',
      \ 'colorscheme.vim',
      \ 'mappings.vim',
      \ 'telescope.vim',
      \ 'go.vim',
      \ 'python.vim',
      \ 'rust.vim'
      \ ]

for s:fname in s:core_conf_files
  execute printf('source %s/core/%s', stdpath('config'), s:fname)
endfor
