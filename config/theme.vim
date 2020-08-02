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

if g:HasPlug('srcery-vim')
    let g:srcery_bold=1
    let g:srcety_italic=1
    let g:srcery_transparent_background=1
    colorscheme srcery
endif
" let g:oceanic_material_transparent_background=1
" colorscheme oceanic_material

" 搜索高亮
hi Search ctermfg=17 ctermbg=190 guifg=#ff0033 guibg=NONE

if g:HasPlug('coc.nvim')
    if !g:HasPlug('vim-multiple-cursors.vim')
        " coc多光标颜色
        hi CocCursorRange cterm=bold ctermfg=238 ctermbg=226 gui=bold guifg=#444444 guibg=#ffff00
    endif

    hi link CocErrorSign red
    hi link CocWarningSign yellow
    hi link CocInfoSign green
    hi link CocHintSign blue

    if g:HasCocPlug('coc-highlight')
        " coc 高亮单词
        au VimEnter * hi CocHighlightText guifg=#ffb6c1
    endif

    if g:HasCocPlug('coc-yank')
        " coc yank背景颜色
        hi HighlightedyankRegion cterm=bold ctermfg=238 ctermbg=226 gui=bold guifg=#444444 guibg=#ffa07a
    endif

    if g:HasCocPlug('coc-explorer')
        " coc-explorer
        " hi CocExplorerNormalFloatBorder guifg=#00ff00 guibg=#ff0000
        " hi CocExplorerNormalFloat guibg=None
    endif
endif
