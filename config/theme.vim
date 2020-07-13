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

" let g:forest_night_enable_italic = 1
" let g:forest_night_enable_italic_comment = 1
" let g:forest_night_transparent_background = 1
" let g:forest_night_current_word = 'underline'
" colorscheme forest-night
let g:srcery_bold=1
let g:srcety_italic=1
let g:srcery_transparent_background=1
colorscheme srcery
"
" colorscheme pure_material

" cursor and cursorline
set cursorline                                      " 高亮当前行
set cursorcolumn                                    " 高亮当前列
set colorcolumn=81                                  " 高亮第80行
" 横纵座标颜色
highlight ColorColumn guibg=#4A2940
" highlight CursorColumn guibg=#4A2940 ctermbg=#4A2940
" highlight CursorLine guibg=#4A2940 ctermbg=#4A2940
highlight CursorColumn guibg=#4A2940
highlight CursorLine guibg=#4A2940
" 光标形状与终端一致
set guicursor=

" 搜索高亮
hi Search ctermfg=17 ctermbg=190 guifg=#ff0033 guibg=NONE

if g:HasPlug('coc.nvim')
    if !g:HasPlug('vim-multiple-cursors.vim')
        " coc多光标颜色
        hi CocCursorRange cterm=bold ctermfg=238 ctermbg=226 gui=bold guifg=#444444 guibg=#ffff00
    endif

    " coc 高亮单词
    au VimEnter * hi CocHighlightText guifg=#ffb6c1

    hi link CocErrorSign red
    hi link CocWarningSign yellow
    hi link CocInfoSign green
    hi link CocHintSign blue

    if g:HasCocPlug('coc-yank')
        " coc yank背景颜色
        hi HighlightedyankRegion cterm=bold ctermfg=238 ctermbg=226 gui=bold guifg=#444444 guibg=#ffa07a
    endif

    if g:HasCocPlug('coc-explorer')
        " coc-explorer
        hi CocExplorerNormalFloat guibg=None
    endif
endif

