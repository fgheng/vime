function! s:patch_lucius_colors()
    if has('termguicolors')
        set termguicolors
    endif
    hi Normal     ctermbg=NONE guibg=NONE
    hi LineNr     ctermbg=NONE guibg=NONE
    hi SignColumn ctermbg=NONE guibg=NONE
    "set background=light

endfunction

autocmd! colorscheme space-vim-dark call s:patch_lucius_colors()
" autocmd! colorscheme  tender call s:patch_lucius_colors()
colorscheme space-vim-dark

"------------------------------------------------------"
" 设置vim搜索匹配项的颜色
hi Search cterm=NONE ctermfg=yellow ctermbg=NONE gui=NONE guifg=#FFFF00 guibg=NONE
hi IncSearch cterm=NONE ctermfg=yellow ctermbg=NONE gui=NONE guifg=#FFFF00 guibg=NONE
hi QuickFixLine cterm=NONE ctermfg=yellow ctermbg=NONE gui=NONE guifg=#FFFF00 guibg=NONE

"-------------------------leaderf----------------------"
" 设置LeaderF搜索匹配项的颜色
highlight Lf_hl_rgHighlight guifg=#FFFF00 guibg=NONE ctermfg=yellow ctermbg=NONE
highlight Lf_hl_match gui=bold guifg=Red cterm=bold ctermfg=21
highlight Lf_hl_matchRefine  gui=bold guifg=Magenta cterm=bold ctermfg=201

"------------------------statusline----------------------"
"
"if !HasPlug('vim-airline') && !HasPlug('powerline') && !HasPlug('eleline.vim')
"    set statusline=%F%m%r%h%w%=\ ->花无重开日，人无再少年<-\ [ft:%Y]\ %{\"[fenc:\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\"+\":\"\").\"]\"}\ [ff:%{&ff}]\ [asc:%03.3b]\ [hex:%02.2B]\ [(%l,%v)/%L][%p%%]\ [coc:%{coc#status()}]
"    set statusline+=[git:%{get(g:,'coc_git_status','')}%{get(b:,'coc_git_status','')}]
"    "set statusline^=%{FugitiveStatusline()}
"    set laststatus=2
"endif
