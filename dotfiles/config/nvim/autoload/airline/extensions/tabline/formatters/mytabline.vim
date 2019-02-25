" --------------------------------------------------------------------------------
" AIRLINE - settings
" --------------------------------------------------------------------------------

function! airline#extensions#tabline#formatters#mytabline#format(tab_nr_type, nr)
  let spc=g:airline_symbols.space
  let cwd=fnamemodify(getcwd(1, a:nr), ":t")
  let txt=split(cwd,"-")
  return spc. a:nr. '-'. txt[-1]
endfunction
