if has('termguicolors')
	set termguicolors
endif

colorscheme one
if has('nvim')
	hi normal     ctermbg=NONE guibg=NONE
	hi linenr     ctermbg=NONE guibg=NONE
	hi signcolumn ctermbg=NONE guibg=NONE
endif

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

