" 开启gitgutter
let g:gigutter_enable = 1
" 关闭列标签
" let g:gitgutter_signs = 1
" 开启行高亮
"let g:gitgutter_highlight_lines = 1
" 开启行号高亮
let g:gitgutter_highlight_linenrs = 1
" 关闭默认快捷键
let g:gitgutter_map_keys = 0
" 折叠相关
set foldtext=gitgutter#fold#foldtext()
" gigutter不许覆盖其他符号
let g:gitgutter_sign_allow_clobber = 1
" 高亮行
" let g:gitgutter_highlight_liners = 1
let g:gitgutter_signs = 0
" 文件更改数量超过500将会压缩显示
let g:gitgutter_max_signs = 500

highlight link GitGutterAddLineNr SignifySignAdd
highlight link GitGutterChangeLineNr SignifySignChange
highlight link GitGutterDeleteLineNr SignifySignDelete
highlight link GitGutterChangeDeleteLineNr SignifySignDelete

" highlight GitGutterAdd    guifg=#009900 guibg=<X> ctermfg=2 ctermbg=<Y>
" highlight GitGutterChange guifg=#bbbb00 guibg=<X> ctermfg=3 ctermbg=<Y>
" highlight GitGutterDelete guifg=#ff2222 guibg=<X> ctermfg=1 ctermbg=<Y>

" highlight link GitGutterChangeLine DiffText
" highlight link GitGutterChangeLineNr Underlined

nmap gf <esc>:GitGutterFold<cr>
