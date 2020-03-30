" 高亮行
let g:gitgutter_highlight_liners = 1
let g:gitgutter_signs = 0
" 文件更改数量超过500将会压缩显示
let g:gitgutter_max_signs = 500

highlight link GitGutterAddLineNr SignifySignAdd
highlight link GitGutterChangeLineNr SignifySignChange
highlight link GitGutterDeleteLineNr SignifySignDelete
highlight link GitGutterChangeDeleteLineNr SignifySignDelete
