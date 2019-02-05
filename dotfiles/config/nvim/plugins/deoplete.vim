" --------------------------------------------------------------------------------
" DEOPLETE
" --------------------------------------------------------------------------------

" turns on deoplete
let g:deoplete#enable_at_startup = 1

" do not show suggestions by default (must trigger them manually)
let g:deoplete#disable_auto_complete = 1

" before <TAB>
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ deoplete#mappings#manual_complete()
function! s:check_back_space() abort "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}
