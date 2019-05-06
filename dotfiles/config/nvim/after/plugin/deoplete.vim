" --------------------------------------------------------------------------------
" DEOPLETE
" --------------------------------------------------------------------------------

if ! exists('g:loaded_deoplete')
  finish
endif

call deoplete#custom#option({
\ 'auto_complete': v:false,
\ 'ignore_sources': {'_': ['around']},
\ })

call deoplete#custom#source('ultisnips', 'rank', 1000)
