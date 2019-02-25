" --------------------------------------------------------------------------------
" AIRLINE - my buffer formatting
" --------------------------------------------------------------------------------

function! airline#extensions#tabline#formatters#mybuffer#format(bufnr, buffers)
  let name = fnamemodify(bufname(a:bufnr), ':t')
  if empty(name)
    let name = '[None]'
  endif
  return name
endfunction
