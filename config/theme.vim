if has('termguicolors')
	set termguicolors
endif

" function! s:patch_lucius_colors()
	" if has('termguicolors')
	"     set termguicolors
	" endif
	" hi normal     ctermbg=NONE guibg=NONE
	" hi linenr     ctermbg=NONE guibg=NONE
	" hi signcolumn ctermbg=NONE guibg=NONE
" endfunction

" autocmd! colorscheme one call s:patch_lucius_colors()
let g:one_allow_italics = 1 " support italics
colorscheme one
" set background=dark
" set background=light
hi normal     ctermbg=NONE guibg=NONE
hi linenr     ctermbg=NONE guibg=NONE
hi signcolumn ctermbg=NONE guibg=NONE
" call one#highlight('vimLineComment', 'cccccc', '', 'underline')

"------------------------------------------------------"
" 设置vim搜索匹配项的颜色
if !HasPlug('fzf.vim')
    hi Search ctermfg=17 ctermbg=190 guifg=#ffffff guibg=#ff0033
    hi IncSearch ctermfg=17 ctermbg=190 guifg=#ffffff guibg=#ff0033
    hi QuickFixLine ctermfg=17 ctermbg=190 guifg=#ffffff guibg=#ff0033
endif

if HasPlug('vim-visual-multi')
    " ???
	" highlight multiple_cursors_cursor ctermfg=15 ctermbg=1 guifg=#444444 guibg=#ffff00
	" highlight link multiple_cursors_cursor Error
endif

if HasPlug('coc.nvim')
    if !HasPlug('vim-multiple-cursors.vim')
        " coc多光标颜色
        hi CocCursorRange cterm=bold ctermfg=238 ctermbg=226 gui=bold guifg=#444444 guibg=#ffff00
    endif

	" coc 高亮单词
	" au VimEnter * hi CocHighlightText guifg=#000000 guibg=#87CEFA
	au VimEnter * hi CocHighlightText guifg=#ffb6c1
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

