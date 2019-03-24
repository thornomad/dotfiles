" Enabling filetype support provides filetype-specific indenting,
" syntax highlighting, omni-completion and other useful settings.
filetype plugin indent on
syntax on

" `matchit.vim` is built-in so let's enable it!
" Hit `%` on `if` to jump to `else`.
runtime macros/matchit.vim

set autoindent                 " Minimal automatic indenting for any filetype.
set backspace=indent,eol,start " Proper backspace behavior.
set hidden                     " Possibility to have more than one unsaved buffers.
set incsearch                  " Incremental search, hit `<CR>` to stop.
set ruler                      " Shows the current line number at the bottom-right
                               " of the screen.

set wildmenu                   " Great command-line completion, use `<Tab>` to move
                               " around and `<CR>` to validate.
set number 	                    " line numbers
set cursorline                  " higlight current line
set nowrap                      " turn off line wrapping cuz it's creepy
set autoread                    " automatically reload the file when it changes on disk
set termguicolors               " prev: $NVIM_TUI_ENABLE_TRUE_COLOR=1 " 24-bit colors

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smarttab                    " insert tabs on the start of a line according to shiftwide, not tabtoet noerrorbells
set splitbelow                  " open splits below by default
set splitright                  " open splits to the right by default

set showmatch                   " set show matching parenthesis
set ignorecase                  " ignore case when searching
set infercase                   " adjust case based on context when searching
set smartcase                   " ignore case if search pattern is all lowercase, case-sensitive otherwise
set nobackup                    " do not keep backups
set noswapfile                  " no swap files please

set clipboard=unnamed           " use mac clipboard! same as unnamedplus on mac
set mouse=a                     " enable mouse! gack
set completeopt=longest,menuone " this always shows the suggestion menu even if there is only one suggestion

set updatetime=100              " have git gutter update faster
"
" Save whenever switching windows or leaving vim. This is useful when running
" the tests inside vim without having to save all files first.
" au FocusLost,WinLeave * :silent! wa

" Trigger autoread when changing buffers or coming back to vim.
" au FocusLost,WinLeave * :silent! noautocmd w " prevent autocomd slowing things down
" au FocusGained,BufEnter * :silent! !



" FOLDING - not working right yet, don't want it by default
set foldmethod=syntax " this should allow folding
set foldnestmax=5       " this is how deep to fold
set foldlevelstart=99


" allow dash-based-names to be considered one word
set iskeyword+=-


" recommendation to use `sh` instead of fish with vim
" for better POSIX support
if &shell =~# 'fish$'
  set shell=sh
endif


" --------------------------------------------------------------------------------
" SOURCE ADDITIONAL FILES
" --------------------------------------------------------------------------------
source ~/.config/nvim/mappings.vim
source ~/.config/nvim/autocmd.vim

" load all of the plugin confi stuff
for f in split(glob('~/.config/nvim/plugins/*.vim'), '\n')
  exe 'source' f
endfor


" enable deoplete (see after/plugin for more settings)
let g:deoplete#enable_at_startup = 1

" --------------------------------------------------------------------------------
" COLORS AND THEMES AND FORMATTING OH MY
" --------------------------------------------------------------------------------
let g:gruvbox_italic=1 " seeing if we can get italics correctly

let g:gruvbox_contrast_dark='soft'
colorscheme gruvbox
" colorscheme onedark



" --------------------------------------------------------------------------------
" FILE BROWSING
" --------------------------------------------------------------------------------
let g:netrw_liststyle = 3
let g:netrw_winsize = 20

" Per default, netrw leaves unmodified buffers open. This autocommand
" deletes netrw's buffer once it's hidden (using ':q', for example)
autocmd FileType netrw setl bufhidden=delete

set rtp+=/usr/local/opt/fzf


if executable("rg")
  set grepprg=rg\ --vimgrep\ --no-heading
  set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

" let g:ruby_default_path = '/Users/damon/.rubies/ruby-2.5.0/bin/ruby'
