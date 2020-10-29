" let g:indentLine_char_list = ['|', '┆', '┊', '│', '⎸', '｜']
" let g:indentLine_setColors = 0
" let g:indentLine_bgcolor_term = 202
" let g:indentLine_color_term = 120
" let g:indentLine_leadingSpaceEanbled = 1
" let g:indentLine_leadingSpaceChar = '·'
let g:indentLine_char = '┊'
" let g:indentLine_first_char = '*'

" 使用自己的conceal设置而不是由indentline进行设置
" let g:indentLine_setConceal = 0
let g:indentLine_concealcursor = 'inc'
let g:indentLine_conceallevel = 1
let g:indentLine_bufTypeExclude = ["help", "quickfix", "terminal", "prompt", "nofile"]
let g:indentLine_fileTypeExclude = [
            \ 'terminal',
            \ 'defx',
            \ 'startify',
            \ 'terminal',
            \ 'coc-explorer',
            \ 'json',
            \ 'jsonc',
            \ 'vista',
            \ 'help',
            \ 'nerdtree',
            \ 'tagbar',
            \ 'vimfiler',
            \ 'markdown',
            \ 'minimap',
            \ 'dashboard',
            \ 'tex',
            \ 'vimwiki',
            \ 'man',
            \ 'vista_markdown',
            \]

" autocmd FileType markdown,vimwiki,tex let g:indentLine_enabled=0
