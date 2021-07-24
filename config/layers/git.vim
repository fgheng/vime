" git插件
Plug 'tpope/vim-fugitive', {'on': ['Gwrite', 'Git commit', 'Git read', 'Git diff', 'Git blame']}

if has('nvim')
    Plug 'nvim-lua/plenary.nvim' | Plug 'tanvirtin/vgit.nvim'
else
    Plug 'rbong/vim-flog' | Plug 'airblade/vim-gitgutter'
    Plug 'f-person/git-blame.nvim'
endif
