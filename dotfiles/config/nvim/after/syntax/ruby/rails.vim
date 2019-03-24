" --------------------------------------------------------------------------------
" CUSTOM SYNTAX
" https://github.com/tpope/vim-rails/blob/master/after/syntax/ruby/rails.vim
" --------------------------------------------------------------------------------
let s:path = tr(expand('%:p'), '\', '/')

if s:path =~# '/spec/.*_spec\.rb$'
  syn keyword rubyTestMacro its
endif
