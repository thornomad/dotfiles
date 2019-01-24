set hidden                      " hide buffers instead of closing, leaving unwritten changes
set autoindent                  " Auto indention should be on
set number 	                    " line numbers
syntax enable                   " highlight stuff
set cursorline                  " higlight current line
set nowrap                      " turn off line wrapping cuz it's creepy
set autoread                    " automatically reload the file when it changes on disk
" set colorcolumn=+1,+2,+3
set textwidth=100               " set the color column for line wrapping recommendations

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smarttab                    " insert tabs on the start of a line according to shiftwide, not tabtoet noerrorbells
set autoindent
set splitbelow                  " open splits below by default
set splitright                  " open splits to the right by default

set showmatch                   " set show matching parenthesis
set ignorecase                  " ignore case when searching
set smartcase                   " ignore case if search pattern is all lowercase, case-sensitive otherwise
set nobackup                    " do not keep backups
set noswapfile                  " no swap files please



set completeopt=longest,menuone " this always shows the suggestion menu even if there is only one suggestion


filetype plugin on
filetype plugin indent on


" Save whenever switching windows or leaving vim. This is useful when running
" the tests inside vim without having to save all files first.
au FocusLost,WinLeave * :silent! wa

" Trigger autoread when changing buffers or coming back to vim.
au FocusLost,WinLeave * :silent! noautocmd w " prevent autocomd slowing things down
" au FocusGained,BufEnter * :silent! !


" treat es6 files like javascript files
au BufNewFile,BufRead *.es6 set filetype=javascript
autocmd BufWritePost,FileWritePost *.es6 :silent !babel <afile> -o <afile>:r.js

" FOLDING - not working right yet, don't want it by default
set foldmethod=syntax " this should allow folding
set foldnestmax=5       " this is how deep to fold
set foldlevelstart=99

" Fix backspacing and make it more better
set backspace=indent,eol,start

" allow dash-based-names to be considered one word
set iskeyword+=-

" set cursor to line or block depending on the mode
"let &t_SI .= "<Esc>[5 q" " insert mode - line |
"let &t_SR .= "<Esc>[4 q" "common - block


" change the mapleader from \ to ,
let mapleader=","

" Thanks to Steve Losh for this liberating tip - regex better when searching
" See http://stevelosh.com/blog/2010/09/coming-home-to-vim
nnoremap / /\v
vnoremap / /\v

" turn off highlighting
nnoremap <leader><leader> :noh<cr>

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ve :e $MYVIMRC<CR>
nmap <silent> <leader>vr :so $MYVIMRC<CR>
nmap <silent> <leader>ss :mksession! .vim_session<CR>
nmap <silent> <leader>sl :source .vim_session<CR>

" map upppercase commands I mistype to their lowercase counterparts
:command! -bar -bang Q quit<bang>
:command! -bar -bang W write<bang>
" :command! -bar -bang X exit<bang>

" close buffer without losing the split (or try not to)
nnoremap <C-W><C-W> :bp\|bd #<CR>


" use just CTRL+J,K,L,H to switch windows
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" change the current screen size using the arrow keys
" since we don't use arrow keys anyway
noremap <up>    <C-W>+
noremap <down>  <C-W>-
noremap <left>  3<C-W><
noremap <right> 3<C-W>>

" ctrl-p to open fzf files browser
nnoremap <C-p> :Files<CR>

" ctrl-f to find within files using ag
nnoremap <C-f> :Rg<CR>

" use tab to move between buffers
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

" re-center screen as we move through search items consistently
" nnoremap n nzz
" nnoremap N Nzz
" --------------------------------------------------------------------------------
" COLORS AND THEMES AND FORMATTING OH MY
" --------------------------------------------------------------------------------
set termguicolors
let g:gruvbox_italic=1 " seeing if we can get italics correctly

let g:gruvbox_contrast_dark='soft'
colorscheme gruvbox



" --------------------------------------------------------------------------------
" ALE - File linting
" --------------------------------------------------------------------------------
let g:ale_sign_column_always = 1 " always show the gutter!
let g:airline#extensions#ale#enabled = 1 " integrate with airline

nmap <Leader>af <Plug>(ale_fix)

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

" --------------------------------------------------------------------------------
" FILE BROWSING
" --------------------------------------------------------------------------------
let g:netrw_liststyle = 3
let g:netrw_winsize = 20

" Per default, netrw leaves unmodified buffers open. This autocommand
" deletes netrw's buffer once it's hidden (using ':q', for example)
autocmd FileType netrw setl bufhidden=delete

set rtp+=/usr/local/opt/fzf

" --------------------------------------------------------------------------------
" AIRLINE - settings
" --------------------------------------------------------------------------------
let g:airline#extensions#tabline#enabled = 1
let g:airline_section_y = ''

" --------------------------------------------------------------------------------
" FIX TRAILING WHITESPACE ON SAVE
" --------------------------------------------------------------------------------
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

" autocmd FileType c,cpp,java,php,ruby,python autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()


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
