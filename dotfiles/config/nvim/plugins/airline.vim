" --------------------------------------------------------------------------------
" AIRLINE - settings
" --------------------------------------------------------------------------------
let g:airline#extensions#tabline#enabled = 1

" show the tab number instead of the buffer/window count
let g:airline#extensions#tabline#tab_nr_type = 1

" show index of buffers
let g:airline#extensions#tabline#buffer_idx_mode = 1

let g:airline#extensions#tabline#formatter = 'mybuffer'
let g:airline#extensions#tabline#tabnr_formatter = 'mytabline'

" hide secion y
let g:airline_section_y = ''

" only show the precentage of the file
let g:airline_section_z = '%p%% %l:%c'


" https://vi.stackexchange.com/questions/13512/limit-buffer-list-to-current-tab
" https://dmerej.info/blog/post/vim-cwd-and-neovim/
"
