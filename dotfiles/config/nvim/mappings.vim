" --------------------------------------------------------------------------------
" MAPPINGS
" --------------------------------------------------------------------------------

" change the mapleader from \ to ,
let mapleader=","
" since , is the reverse of ; remap it so we can use it if needed
nnoremap \ ,
" try to remap the escape key in insert mode
inoremap jk <esc>

" Thanks to Steve Losh for this liberating tip - regex better when searching
" See http://stevelosh.com/blog/2010/09/coming-home-to-vim
" nnoremap / /\v
" vnoremap / /\v

" turn off highlighting
nnoremap <leader><leader> :noh<cr>

" relearn to quit and save/quit without closing buffers
" close buffer without losing the split (or try not to)
nnoremap <silent> <leader>q :bp<bar>vsp<bar>bn<bar>bd<CR>

nnoremap <silent> <leader><Tab> :bnext<CR>
nnoremap <silent> <leader><S-Tab> :bprevious<CR>

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ve :e $MYVIMRC<CR>
nmap <silent> <leader>vr :so $MYVIMRC<CR>
nmap <silent> <leader>ss :mksession! .vim_session<CR>
nmap <silent> <leader>sl :source .vim_session<CR>



" map upppercase commands I mistype to their lowercase counterparts
:command! -bar -bang Q quit<bang>
:command! -bar -bang W write<bang>
:command! -nargs=* T split | terminal <args>
:command! -nargs=* TV vsplit | terminal <args>
":command! -nargs=* T vsplit | vertical resize 100 | terminal <args>
" :command! -bar -bang X exit<bang>



" use just CTRL+J,K,L,H to switch windows
" nnoremap <C-J> <C-W><C-J>
" nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" change the current screen size using the arrow keys
" since we don't use arrow keys anyway
noremap <up>    <C-W>+
noremap <down>  <C-W>-
noremap <left>  3<C-W><
noremap <right> 3<C-W>>

" --------------------------------------------------------------------------------
" PLUGIN MAPPINGS

" ctrl-p to open fzf files browser
nnoremap <C-p> :GFiles<CR>

" ctrl-f to find within files using ag
nnoremap <C-f> :Rg<Space>

" https://github.com/ruanyl/vim-gh-line
let g:gh_line_map = '<leader>gh'
let g:gh_line_blame_map = '<leader>gb'



" --------------------------------------------------------------------------------
" TERMINAL REMAPPING

" use esc to leave terminal mode
tnoremap <Esc> <C-\><C-n>


