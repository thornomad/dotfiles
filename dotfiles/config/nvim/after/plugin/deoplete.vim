" --------------------------------------------------------------------------------
" DEOPLETE
" --------------------------------------------------------------------------------

if ! exists('g:loaded_deoplete')
  finish
endif

" raise ultisnips ranks
call deoplete#custom#source('ultisnips', 'rank', 1000)
