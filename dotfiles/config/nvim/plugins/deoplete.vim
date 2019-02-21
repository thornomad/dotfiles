" --------------------------------------------------------------------------------
" DEOPLETE
" --------------------------------------------------------------------------------

" turns on deoplete
let g:deoplete#enable_at_startup = 1

" do not show suggestions by default (must trigger them manually)
let g:deoplete#disable_auto_complete = 1

"let g:deoplete#ignore_sources = {'_': ['tag']}

" autocmd User call deoplete#custom#source('_', 'sorters', ['sorter_word'])
" autocmd User call deoplete#custom#source('ultisnip', 'rank', 9999)
"
" autocmd User call deoplete#custom#option('ignore_sources', {
"   \ '_': ['tag'],
"   \ })


" use <C-Space> to trigger deoplete
inoremap <silent><expr> <C-Space>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ deoplete#mappings#manual_complete()

function! s:check_back_space() abort "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

