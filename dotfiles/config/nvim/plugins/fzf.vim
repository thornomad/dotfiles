" --------------------------------------------------------------------------------
" FZF - settings
" see: https://github.com/junegunn/fzf.vim
" --------------------------------------------------------------------------------
let g:fzf_action = { 'ctrl-l': 'vsplit', 'ctrl-x': 'split' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~10%' }

" use the theme colors
let g:fzf_colors = {
  \ 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

