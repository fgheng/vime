" git插件
Plug 'tpope/vim-fugitive'

if has('nvim')
    Plug 'nvim-lua/plenary.nvim' | Plug 'tanvirtin/vgit.nvim'
else
    Plug 'rbong/vim-flog' | Plug 'airblade/vim-gitgutter'
    " " Plug 'f-person/git-blame.nvim'
endif
