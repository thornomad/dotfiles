" --------------------------------------------------------------------------------
" DEOPLETE
" See: after/plugin/deoplete.vim as well
" --------------------------------------------------------------------------------

" turns on deoplete
let g:deoplete#enable_at_startup = 1

" do not show suggestions by default (must trigger them manually)
let g:deoplete#disable_auto_complete = 1

" TODO - move this to a call because it's been deprecated
"        as well as get all the sources in order please!
let g:deoplete#ignore_sources = {'_': ['around']}

" use <C-Space> to trigger deoplete
inoremap <silent><expr> <C-Space>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ deoplete#mappings#manual_complete()
function! s:check_back_space() abort "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

