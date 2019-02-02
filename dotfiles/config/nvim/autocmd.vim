augroup MyTerm
  autocmd!
  autocmd BufWinEnter,WinEnter term://* startinsert
"  autocmd BufLeave term://* stopinsert
augroup END

augroup es6_transpiling
  autocmd!
  " treat es6 files like javascript files
  au BufNewFile,BufRead *.es6 set filetype=javascript
  autocmd BufWritePost,FileWritePost *.es6 :silent !babel <afile> -o <afile>:r.js
augroup END
