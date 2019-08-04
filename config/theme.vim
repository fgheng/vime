function! s:patch_lucius_colors()
    if has('termguicolors')
        set termguicolors
    endif
    hi Normal     ctermbg=NONE guibg=#002B36
    hi LineNr     ctermbg=NONE guibg=#002B36
    hi SignColumn ctermbg=NONE guibg=#002B36
    "set background=light

    if HasPlug('coc.nvim')
        if !HasPlug('vim-multiple-cursors.vim')
            " coc多光标颜色
            hi CocCursorRange guibg=#b16286 guifg=#ebdbb2
        endif

        " coc yank背景颜色
        hi HighlightedyankRegion term=bold ctermbg=0 guibg=purple
    endif

    if HasPlug('vim-indent-guide')
        "hi IndentGuidesOdd  guibg=red   ctermbg=3
        "hi IndentGuidesEven guibg=green ctermbg=4
    endif

endfunction

autocmd! colorscheme srcery-drk call s:patch_lucius_colors()
colorscheme srcery-drk

"------------------------------------------------------"
" 设置vim搜索匹配项的颜色
if !HasPlug('fzf.vim')
	hi Search cterm=NONE ctermfg=yellow ctermbg=NONE gui=NONE guifg=#FFFF00 guibg=NONE
	hi IncSearch cterm=NONE ctermfg=yellow ctermbg=NONE gui=NONE guifg=#FFFF00 guibg=NONE
	hi QuickFixLine cterm=NONE ctermfg=yellow ctermbg=NONE gui=NONE guifg=#FFFF00 guibg=NONE
endif

"------------------------statusline----------------------"
"
"if !HasPlug('vim-airline') && !HasPlug('powerline') && !HasPlug('eleline.vim')
"    set statusline=%F%m%r%h%w%=\ ->花无重开日，人无再少年<-\ [ft:%Y]\ %{\"[fenc:\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\"+\":\"\").\"]\"}\ [ff:%{&ff}]\ [asc:%03.3b]\ [hex:%02.2B]\ [(%l,%v)/%L][%p%%]\ [coc:%{coc#status()}]
"    set statusline+=[git:%{get(g:,'coc_git_status','')}%{get(b:,'coc_git_status','')}]
"    "set statusline^=%{FugitiveStatusline()}
"    set laststatus=2
"endif
