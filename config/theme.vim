function! s:patch_lucius_colors()
    if has('termguicolors')
        set termguicolors
    endif
    "hi Normal     ctermbg=NONE guibg=#31312E
    "hi LineNr     ctermbg=NONE guibg=#31312E
    "hi SignColumn ctermbg=NONE guibg=#31312E
	" hi Normal     ctermbg=grey guibg=NONE
	" hi LineNr     ctermbg=NONE guibg=NONE
	" hi SignColumn ctermbg=NONE guibg=NONE
endfunction

autocmd! colorscheme space-vim-dark call s:patch_lucius_colors()
colorscheme space-vim-dark
"set background=light

"------------------------------------------------------"
" 设置vim搜索匹配项的颜色
if !HasPlug('fzf.vim')
    hi Search ctermfg=17 ctermbg=190 guifg=#00005f guibg=#dfff00
    hi IncSearch ctermfg=17 ctermbg=190 guifg=#00005f guibg=#dfff00
    hi QuickFixLine ctermfg=17 ctermbg=190 guifg=#00005f guibg=#dfff00
endif

if HasPlug('vim-visual-multi')
    " ???
    "highlight multiple_cursors_cursor ctermfg=15 ctermbg=1 guifg=white guibg=red
    "highlight link multiple_cursors_cursor Error
endif

if HasPlug('coc.nvim')
    if !HasPlug('vim-multiple-cursors.vim')
        " coc多光标颜色
        hi CocCursorRange cterm=bold ctermfg=238 ctermbg=226 gui=bold guifg=#444444 guibg=#ffff00
    endif

    " coc yank背景颜色
    hi HighlightedyankRegion cterm=bold ctermfg=238 ctermbg=226 gui=bold guifg=#444444 guibg=#ffff00
endif

if !HasPlug("vim-airline")
	 set statusline=%F%m%r%h%w%=\ [ft=%Y]\ %{\"[fenc=\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\"+\":\"\").\"]\"}\ [ff=%{&ff}]\ [asc=%03.3b]\ [hex=%02.2B]\ [pos=%04l,%04v][%p%%]\ [len=%L]
endif
