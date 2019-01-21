set hidden                      " hide buffers instead of closing, leaving unwritten changes
set autoindent                  " Auto indention should be on
set number 	                    " line numbers
syntax enable                   " highlight stuff
set cursorline                  " higlight current line
set nowrap                      " turn off line wrapping cuz it's creepy
" set colorcolumn=+1,+2,+3
set textwidth=100               " set the color column for line wrapping recommendations

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

" set cursor to line or block depending on the mode
"let &t_SI .= "<Esc>[5 q" " insert mode - line | 
"let &t_SR .= "<Esc>[4 q" "common - block 


" change the mapleader from \ to ,
let mapleader=","

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ve :e $MYVIMRC<CR>
nmap <silent> <leader>vr :so $MYVIMRC<CR>

" map upppercase commands I mistype to their lowercase counterparts
:command! -bar -bang Q quit<bang>
:command! -bar -bang W write<bang>
" :command! -bar -bang X exit<bang>

" use just CTRL+J,K,L,H to switch windows
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" default to opening new splits
set splitbelow
set splitright

" this always shows the suggestion menu even if there is only one suggestion
set completeopt=longest,menuone

" change the current screen size using the arrow keys
" since we don't use arrow keys anyway
noremap <up>    <C-W>+
noremap <down>  <C-W>-
noremap <left>  3<C-W><
noremap <right> 3<C-W>>

" suggestion, to set to a specific layout size
" nnoremap <silent> <Leader>= :exe "vertical resize " . (winheight(0) * 3/2)<CR>
" nnoremap <silent> <Leader>- :exe "vertical resize " . (winheight(0) * 2/3)<CR>

" ctrl-p to open fzf files browser
nnoremap <C-p> :Files<CR>

" ctrl-f to find within files using ag
nnoremap <C-f> :Rg<CR>

" use tab to move between buffers
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

" re-center screen as we move through search items consistently
nnoremap n nzz
nnoremap N Nzz
" --------------------------------------------------------------------------------
" COLORS AND THEMES AND FORMATTING OH MY
" --------------------------------------------------------------------------------
set termguicolors
let g:gruvbox_italic=1 " seeing if we can get italics correctly

let g:gruvbox_contrast_dark='soft'
" let g:gruvbox_color_column='bg1'
colorscheme gruvbox


" --------------------------------------------------------------------------------
" FILE BROWSING
" --------------------------------------------------------------------------------
let g:netrw_liststyle = 3
let g:netrw_winsize = 20

set rtp+=/usr/local/opt/fzf






" --------------------------------------------------------------------------------
" UNUSED STUFF WILL JETTISON EVENTUALLY 
" --------------------------------------------------------------------------------
"
"
"
"
"
" https://stackoverflow.com/questions/16082991/vim-switching-between-files-rapidly-using-vanilla-vim-no-plugins/16084326#16084326
" set path=.,**
" nnoremap <leader>f :find *
" nnoremap <leader>s :sfind *
" nnoremap <leader>v :vert sfind *
" nnoremap <leader>t :tabfind *
"let mapleader="<space>"

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
