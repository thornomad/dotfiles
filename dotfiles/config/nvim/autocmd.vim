augroup MyTerm
  autocmd!
  autocmd BufWinEnter,WinEnter term://* startinsert
"  autocmd BufLeave term://* stopinsert
augroup END

augroup es6_transpiling
  autocmd!
  " treat es6 files like javascript files
  autocmd BufNewFile,BufRead *.es6 set filetype=javascript
  autocmd BufWritePost,FileWritePost *.es6 :silent !babel <afile> -o <afile>:r.js
augroup END

" --------------------------------------------------------------------------------
" FIX TRAILING WHITESPACE ON SAVE
" --------------------------------------------------------------------------------
function! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun

augroup fix_trailing_whitespace
  autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
augroup END


