" --------------------------------------------------------------------------------
" MAPPINGS
" --------------------------------------------------------------------------------

" change the mapleader from \ to ,
let mapleader=" "
" since , is the reverse of ; remap it so we can use it if needed
nnoremap \ ,

" D deletes to end of line, I keep thinking Y will yank to end of line so now
" it does
nnoremap Y y$

" use gn and gp to switch buffers: go right, go previous
" remap gn and gp to <leader>gn/gp
nnoremap <leader>gj gj
nnoremap <leader>gk gk
nnoremap <silent> gk :bnext<CR>
nnoremap <silent> gj :bprev<CR>
" nnoremap <leader>gp gp


" use just CTRL+J,K,L,H to switch windows
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" change the current screen size using the arrow keys
" since we don't use arrow keys anyway
noremap <up>    2<C-W>+
noremap <down>  2<C-W>-
noremap <left>  3<C-W><
noremap <right> 3<C-W>>

" Thanks to Steve Losh for this liberating tip - regex better when searching
" See http://stevelosh.com/blog/2010/09/coming-home-to-vim
" nnoremap / /\v
" vnoremap / /\v

" turn off highlighting
nnoremap <leader><Space> :noh<cr>


" relearn to quit and save/quit without closing buffers
" close buffer without losing the split (or try not to)
nnoremap <silent> <leader>w :bp<bar>vsp<bar>bn<bar>bd<CR>
nnoremap <silent> <leader>rm :call delete(expand('%'))<bar>bp<bar>vsp<bar>bn<bar>bdelete!<CR>

" nnoremap <silent> <leader><Tab> :bnext<CR>
" nnoremap <silent> <leader><S-Tab> :bprevious<CR>

" quickly jump to the numbered tab
nnoremap <silent> <leader>1 1gt
nnoremap <silent> <leader>2 2gt
nnoremap <silent> <leader>3 3gt
nnoremap <silent> <leader>4 4gt
nnoremap <silent> <leader>5 5gt

" Quickly edit/reload the vimrc file
" select all
nnoremap <leader>va <esc>gg0vG$<CR>
nnoremap <silent> <leader>ve :e $MYVIMRC<CR>
nnoremap <silent> <leader>vr :so $MYVIMRC<CR>

nnoremap <silent> <leader>ss :mksession! .vim_session<CR>
nnoremap <leader>sa :saveas %:h/
nnoremap <silent> <leader>sl :source .vim_session<CR>
nnoremap <silent> <leader>sw :bd Result<CR>

nmap <leader>af <Plug>(ale_fix)
nmap <silent> <leader>ap <Plug>(ale_previous_wrap)
nmap <silent> <leader>an <Plug>(ale_next_wrap)

" ,cjs = copy es6 file transpiled output to clipboard - javascript babel
nmap <leader>cjs :!babel % <bar> pbcopy<CR>
nmap <leader>lm :!lb.migrate<CR>





" --------------------------------------------------------------------------------
" INSERT MODE REMAPPING
" --------------------------------------------------------------------------------

" try to remap the escape key in insert mode
" inoremap jk <esc>

"inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" use <down> for <C-n> so that you can keep typing even after you have moved
" the curosor
"inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
"  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'



" --------------------------------------------------------------------------------
" DEOPLETE
" --------------------------------------------------------------------------------

" use <C-Space> to trigger deoplete
inoremap <silent><expr> <C-Space>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ deoplete#mappings#manual_complete()
function! s:check_back_space() abort "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}
" deoplete#cancel_popup
" inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
" function! s:my_cr_function() abort
"   return deoplete#close_popup() . "\<CR>"
" endfunction


"
" --------------------------------------------------------------------------------
" FZF
" --------------------------------------------------------------------------------

" ctrl-p to open fzf files browser
nnoremap <C-p> :GFiles<CR>
nnoremap <leader><C-p> :FZF<CR>
nnoremap <leader>b :Buffers<CR>

" ctrl-f to find within files using ag
nnoremap <C-f> :Rg<Space>


" --------------------------------------------------------------------------------
" GIT RELATED MAPPINGS
" --------------------------------------------------------------------------------

" https://github.com/ruanyl/vim-gh-line
let g:gh_line_map = '<leader>ggl'
let g:gh_line_blame_map = '<leader>ggb'

" DOES NOT WORK!
" let g:gh_open_command = 'fn() { echo "$@" | pbcopy; }; fn '

nnoremap <silent> <leader>gc :Gcommit %<CR>
nnoremap <silent> <leader>gs :G<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gl :Gina log<CR>

" nnoremap <leader>gco :Gina checkout<SPACE>

nnoremap <leader>gp :Gina pull<CR>
nnoremap <leader>gu :Gina push<CR>

" TODO - have this close the file when buffer is chosen

nnoremap <leader>gbr :Gina branch -a --opener=split<CR>
nnoremap <leader>gfhs :<C-u>Gina flow hotfix start --fetch<SPACE>
nnoremap <leader>gfhf :<C-u>Gina flow hotfix finish --notag --push<SPACE>
nnoremap <leader>gffs :<C-u>Gina flow feature start --fetch<SPACE>
" nnoremap <leader>gfff :<C-u>Gina flow feature finish<SPACE>


" GIT GUTTER
let g:gitgutter_map_keys = 0
nmap <leader>ghs <Plug>GitGutterStageHunk
nmap <leader>ghu <Plug>GitGutterUndoHunk
" nmap <leader>ghn <Plug>GitGutterNextHunk
" nmap <leader>ghp <Plug>GitGutterPrevHunk
nmap <leader>ghv <Plug>GitGutterPreviewHunk

nmap ]h <Plug>GitGutterNextHunk zz
nmap [h <Plug>GitGutterPrevHunk zz

omap ih <Plug>GitGutterTextObjectInnerPending
omap ah <Plug>GitGutterTextObjectOuterPending
xmap ih <Plug>GitGutterTextObjectInnerVisual
xmap ah <Plug>GitGutterTextObjectOuterVisual

" nnoremap <leader>ga :Gina add %:p<CR>
" nnoremap <nowait><leader>gs :Gina status<CR>
" nnoremap <leader>gc :Gina commit -q -v<CR>
" nnoremap <leader>gb ::Gina blame --opener=tabedit --format="%au - %su%=%ti%ma%in" --width=75<CR>

nnoremap <leader>jf :JunkfileOpen<CR>
nnoremap <leader>jfs :JunkfileOpen<CR>sql<CR>
" --------------------------------------------------------------------------------
" VISUAL MODE REMAPPING

" use slected text as search string
vnoremap // y/\V<C-r>=escape(@",'/\')<CR><CR>

" --------------------------------------------------------------------------------
" TERMINAL REMAPPING

" use esc to leave terminal mode
" tnoremap <Esc> <C-\><C-n>
" if has("nvim")
"   au TermOpen * tnoremap <Esc> <c-\><c-n>
"   au FileType fzf tunmap <Esc>
" endif

" --------------------------------------------------------------------------------
" EX MAPPINGS
" --------------------------------------------------------------------------------
command! -nargs=* Wrap set wrap linebreak nolist breakindent showbreak=->
command Gstash execut "Gina stash -u"
command Gpop execut "Gina stash pop"

" close all buffers but the current one
command BufOnly silent! execute "%bd|e#|bd#"

" map upppercase commands I mistype to their lowercase counterparts
command! -bar -bang Q quit<bang>
command! -bar -bang W write<bang>
command! -nargs=* T split | terminal <args>
command! -nargs=* TV vsplit | terminal <args>
":command! -nargs=* T vsplit | vertical resize 100 | terminal <args>
" :command! -bar -bang X exit<bang>


