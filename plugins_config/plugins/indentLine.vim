" let g:indentLine_char_list = ['|', '┆', '┊', '│']
let g:indentLine_color_term = 239
let g:indentLine_leadingSpaceEanbled = 1
let g:indentLine_leadingSpaceChar = ' '
let g:indentLine_char = '│'
let g:indentLine_first_char = '│'
let g:indentLine_concealcursor = 'inc'
let g:indentLine_conceallevel = 2
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
            \]

" autocmd FileType markdown,vimwiki,tex let g:indentLine_enabled=0
