set autoindent    " Auto indention should be on
set number 	  " line numbers
syntax enable     " highlight stuff

" default spacing and tabs
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent

filetype plugin on
filetype plugin indent on

set backspace=indent,eol,start  " more powerful backspacing

" allow dash-based-names to be considered one word
set iskeyword+=-

" https://stackoverflow.com/questions/16082991/vim-switching-between-files-rapidly-using-vanilla-vim-no-plugins/16084326#16084326
" set path=.,**
" nnoremap <leader>f :find *
" nnoremap <leader>s :sfind *
" nnoremap <leader>v :vert sfind *
" nnoremap <leader>t :tabfind *
"let mapleader="<space>"

" remap the keys for changing buffers to ctrl-
" nnoremap <C-J> <C-W><C-J>
" nnoremap <C-K> <C-W><C-K>
" nnoremap <C-L> <C-W><C-L>
" nnoremap <C-H> <C-W><C-H>
" 
" " open splits at bottom and right
" set splitbelow
" set splitright
" 
" 
" " --------------------------------------------------------------------------------
" " CTRL-P specific settings
" " --------------------------------------------------------------------------------
" 
" " open ctrp split vertically by default ? 
" let g:ctrlp_prompt_mappings = {
"     \ 'AcceptSelection("e")': ['<c-v>', '<2-LeftMouse>'],
"     \ 'AcceptSelection("v")': ['<cr>', '<RightMouse>'],
"     \ }
" 
" 
" " this allows for ctrlp to accept spaces when doing fuzzy search
" let g:ctrlp_abbrev = {
"   \ 'gmode': 'i',
"   \ 'abbrevs': [
"     \ {
"       \ 'pattern': ' ',
"       \ 'expanded': '',
"       \ 'mode': 'pfrz',
"     \ },
"     \ ]
"   \ }
" 
