" --------------------------------------------------------------------------------
" ALE - File linting
" --------------------------------------------------------------------------------
let g:ale_sign_column_always = 1 " always show the gutter!
let g:airline#extensions#ale#enabled = 1 " integrate with airline

nmap <Leader>af <Plug>(ale_fix)
nmap <silent> <Leader>ap <Plug>(ale_previous_wrap)
nmap <silent> <Leader>an <Plug>(ale_next_wrap)
" add default fixer for ALE with javascript
" 'prettier_eslint'
let g:ale_fixers = {
\   'javascript': [
\       'eslint',
\   ],
\   'ruby': [
\       'rubocop',
\   ],
\}


