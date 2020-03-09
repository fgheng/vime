if has('termguicolors')
	set termguicolors
endif

colorscheme gruvbox
" colorscheme one
set background=dark
" set background=light
if has('nvim')
	hi normal     ctermbg=NONE guibg=NONE
	" hi linenr     ctermbg=NONE guibg=NONE
	" hi signcolumn ctermbg=NONE guibg=NONE
endif

" 搜索高亮
" hi Search ctermfg=17 ctermbg=190 guifg=#ff0033 guibg=#ffffff
" hi IncSearch ctermfg=17 ctermbg=190 guifg=#ffffff guibg=#ff0033
" hi QuickFixLine ctermfg=17 ctermbg=190 guifg=#ffffff guibg=#ff0033

if HasPlug('coc.nvim')
    if !HasPlug('vim-multiple-cursors.vim')
        " coc多光标颜色
        hi CocCursorRange cterm=bold ctermfg=238 ctermbg=226 gui=bold guifg=#444444 guibg=#ffff00
    endif

	" coc 高亮单词
	" au VimEnter * hi CocHighlightText guifg=#000000 guibg=#87CEFA
	au VimEnter * hi CocHighlightText guifg=#000000 guibg=#ffb6c1
	" au VimEnter * hi CocHighlightText guibg=#ffb6c1
	" au VimEnter * hi CocHighlightText guibg=#ff69b4
	" au VimEnter * hi CocHighlightText guifg=#996699 guibg=#ffcccc

    " coc yank背景颜色
    " hi HighlightedyankRegion cterm=bold ctermfg=238 ctermbg=226 gui=bold guifg=#444444 guibg=#ffff00
    " hi HighlightedyankRegion cterm=bold ctermfg=238 ctermbg=226 gui=bold guifg=#444444 guibg=#ff99cc
    hi HighlightedyankRegion cterm=bold ctermfg=238 ctermbg=226 gui=bold guifg=#444444 guibg=#ffa07a

	" hi link CocErrorSign red
	hi link CocWarningSign yellow
	hi link CocInfoSign green
	hi link CocHintSign blue
endif
