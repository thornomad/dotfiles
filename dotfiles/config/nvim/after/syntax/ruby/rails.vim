" --------------------------------------------------------------------------------
" CUSTOM SYNTAX
" https://github.com/tpope/vim-rails/blob/master/after/syntax/ruby/rails.vim
" --------------------------------------------------------------------------------
let s:path = tr(expand('%:p'), '\', '/')

if s:path =~# '/spec/.*_spec\.rb$'
  syn keyword rubyTestMacro its contain_exactly
endif

if s:path =~# '/app/models/.*\.rb$'
  syn keyword rubyMacro alias_method
endif
