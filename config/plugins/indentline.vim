" " indentline会重写conceal的颜色，要想用自己主题的conceal颜色，设置为0，否则设置为1
let g:indentLine_setColors = 1

" "let g:indentLine_leadingSpaceEnabled = 1
" "let g:indentline_leadingSpaceChar = '→'
" let g:indentLine_enable = 1
" " let g:indentLine_char_list = ['|', '┆', '┊', '▏']
let g:indentLine_char = '┊'
" "let g:indentLine_char = '.'
let g:indentLine_concealcursor = 'niv'
let g:indentLine_conceallevel = 0
let g:indentLine_setConceal = 0
let g:indentLine_fileTypeExclude = ['defx', 'startify', 'terminal', 'coc-explorer', 'json', 'jsonc', 'vista']
