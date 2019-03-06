" --------------------------------------------------------------------------------
" GITGUTTER
" --------------------------------------------------------------------------------

if ! exists('g:gitgutter_max_signs')
  finish
endif

" run git gutter whenever we enter or leave a buffer
" (upon staging, it often doesn't update when we come back)
augroup MyGitGutter
  autocmd!
  autocmd BufEnter,BufLeave * GitGutter
augroup END
