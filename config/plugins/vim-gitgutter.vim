" 开启gitgutter
let g:gigutter_enable = 0
" 关闭符号
let g:gitgutter_signs = 1
" 开启行高亮
let g:gitgutter_highlight_lines = 0
" 开启行号高亮
let g:gitgutter_highlight_linenrs = 1
" 关闭默认快捷键
let g:gitgutter_map_keys = 0
" 折叠相关
" set foldtext=gitgutter#fold#foldtext()
" 文件更改数量超过500将会压缩显示
let g:gitgutter_max_signs = 500

highlight link GitGutterAddLineNr SignifySignAdd
highlight link GitGutterChangeLineNr SignifySignChange
highlight link GitGutterDeleteLineNr SignifySignDelete
highlight link GitGutterChangeDeleteLineNr SignifySignDelete

nmap gf <esc>:GitGutterFold<cr>
