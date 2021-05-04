" git插件
Plug 'tpope/vim-fugitive', {'on': ['Gwrite', 'Gcommit', 'Gread', 'Gdiff', 'Gblame']}
\ | Plug 'rbong/vim-flog'
\ | Plug 'airblade/vim-gitgutter'

if has('nvim')
    Plug 'f-person/git-blame.nvim'
endif
