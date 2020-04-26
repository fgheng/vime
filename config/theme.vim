if &term =~ '256color' && $TMUX != ''
    " disable Background Color Erase (BCE) so that color schemes
    " render properly when inside 256-color tmux and GNU screen.
    " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
    set t_ut=
endif

if has('termguicolors')
    " fix bug for vim
    if !has('nvim')
        if &term =~# '^screen\|^tmux'
            let &t_8f = "\e[38;2;%lu;%lu;%lum"
            let &t_8b = "\e[48;2;%lu;%lu;%lum"
        endif
    endif
    set termguicolors
endif

colorscheme gruvbox
" if has('nvim')
"     hi normal     ctermbg=NONE guibg=NONE
"     hi linenr     ctermbg=NONE guibg=NONE
"     hi signcolumn ctermbg=NONE guibg=NONE
" endif

" 搜索高亮
hi Search ctermfg=17 ctermbg=190 guifg=#ff0033 guibg=NONE

if HasPlug('vim-floaterm') && has('nvim')
    hi FloatermNF guibg=None
    hi FloatermBorderNF guibg=None
endif

if HasPlug('coc.nvim')
    if !HasPlug('vim-multiple-cursors.vim')
        " coc多光标颜色
        hi CocCursorRange cterm=bold ctermfg=238 ctermbg=226 gui=bold guifg=#444444 guibg=#ffff00
    endif

    " coc 高亮单词
    au VimEnter * hi CocHighlightText guifg=#ffb6c1
    " coc yank背景颜色
    hi HighlightedyankRegion cterm=bold ctermfg=238 ctermbg=226 gui=bold guifg=#444444 guibg=#ffa07a

    hi link CocErrorSign red
    hi link CocWarningSign yellow
    hi link CocInfoSign green
    hi link CocHintSign blue
endif
