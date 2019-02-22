" --------------------------------------------------------------------------------
" MAPPINGS
" --------------------------------------------------------------------------------

" change the mapleader from \ to ,
let mapleader=","
" since , is the reverse of ; remap it so we can use it if needed
nnoremap \ ,

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
nnoremap <silent> <leader>q :bp<bar>vsp<bar>bn<bar>bd<CR>
nnoremap <silent> <leader>rm :call delete(expand('%'))<bar>bp<bar>vsp<bar>bn<bar>bdelete!<CR>
nnoremap <leader>sa :saveas %:h/

nnoremap <silent> <leader><Tab> :bnext<CR>
nnoremap <silent> <leader><S-Tab> :bprevious<CR>

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ve :e $MYVIMRC<CR>
nmap <silent> <leader>vr :so $MYVIMRC<CR>
nmap <silent> <leader>ss :mksession! .vim_session<CR>
nmap <silent> <leader>sl :source .vim_session<CR>

nmap <leader>af <Plug>(ale_fix)
nmap <silent> <leader>ap <Plug>(ale_previous_wrap)
nmap <silent> <leader>an <Plug>(ale_next_wrap)

" ,cjs = copy es6 file transpiled output to clipboard
nmap <leader>cjs :!babel % <bar> pbcopy<CR>
nmap <leader>lm :!lb.migrate<CR>
" --------------------------------------------------------------------------------
" INSERT MODE REMAPPING
"

" try to remap the escape key in insert mode
inoremap jk <esc>

" --------------------------------------------------------------------------------
" EX MODE REMAPPING
"

" map upppercase commands I mistype to their lowercase counterparts
:command! -bar -bang Q quit<bang>
:command! -bar -bang W write<bang>
:command! -nargs=* T split | terminal <args>
:command! -nargs=* TV vsplit | terminal <args>
":command! -nargs=* T vsplit | vertical resize 100 | terminal <args>
" :command! -bar -bang X exit<bang>



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
let g:gh_line_map = '<leader>gl'
let g:gh_line_blame_map = '<leader>glb'
" DOES NOT WORK!
" let g:gh_open_command = 'fn() { echo "$@" | pbcopy; }; fn '

nnoremap <silent> <leader>gc :Gcommit %<CR>
nnoremap <silent> <leader>gs :G<CR>
nnoremap <silent> <leader>gb :Gblame<CR>

" nnoremap <leader>gco :Gina checkout<SPACE>

nnoremap <leader>gp :Gina pull<CR>
nnoremap <leader>gu :Gina push<CR>

" TODO - have this close the file when buffer is chosen

nnoremap <leader>gbr :Gina branch -a --opener=split<CR>
nnoremap <leader>gfhs :<C-u>Gina flow hotfix start<SPACE>
nnoremap <leader>gfhf :<C-u>Gina flow hotfix finish -n<SPACE>
nnoremap <leader>gffs :<C-u>Gina flow feature start<SPACE>
nnoremap <leader>gfff :<C-u>Gina flow feature finish<SPACE>


" GIT GUTTER
let g:gitgutter_map_keys = 0
nmap <leader>ghs <Plug>GitGutterStageHunk
nmap <leader>ghu <Plug>GitGutterUndoHunk
" nmap <leader>ghn <Plug>GitGutterNextHunk
" nmap <leader>ghp <Plug>GitGutterPrevHunk
nmap <leader>ghv <Plug>GitGutterPreviewHunk

nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk

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


