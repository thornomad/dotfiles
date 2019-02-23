" fish filetype
" https://github.com/dag/vim-fish

if exists('b:undo_ftplugin')
  let b:undo_ftplugin .= ' | '
else
  let b:undo_ftplugin = ''
endif

" Set up :make to use fish for syntax checking.
compiler fish

" Set this to have long lines wrap inside comments.
" setlocal textwidth=79

" Enable folding of block structures in fish.
setlocal foldmethod=expr
