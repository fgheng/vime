" 只在当前窗口显示
let g:scrollview_current_only = 1
let g:scrollview_winblend = 50
" 让滚动条与高亮列重合
" let g:scrollview_base = 'buffer'
" let g:scrollview_column = 80

highlight ScrollView ctermbg=159 guibg=LightCyan

" augroup vime_nvim_scrollview
    " autocmd!
    " autocmd WinClosed * ScrollViewRefresh
" augroup END
