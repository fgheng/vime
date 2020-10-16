" 按下下面的这些按键触发查询高亮
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" 自定义颜色
augroup vime_qs_colors_group
    autocmd!
    autocmd ColorScheme * highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
    autocmd ColorScheme * highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
augroup END
