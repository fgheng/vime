" 取消(neo)vim默认的匹配功能
let g:hiPairs_enable_matchParen = 0

let g:hiPairs_timeout = 100

" 匹配的括号的颜色
let g:hiPairs_hl_matchPair = {
            \ 'term'    : 'underline,bold',
            \ 'cterm'   : 'bold',
            \ 'ctermfg' : '0',
            \ 'ctermbg' : '180',
            \ 'gui'     : 'bold',
            \ 'guifg'   : 'Red',
            \ 'guibg'   : '#D3B17D'
            \ }

" 不匹配的括号的颜色
let g:hiPairs_hl_unmatchPair = {
            \ 'term'    : 'underline,italic',
            \ 'cterm'   : 'italic',
            \ 'ctermfg' : '15',
            \ 'ctermbg' : '12',
            \ 'gui'     : 'italic',
            \ 'guifg'   : 'White',
            \ 'guibg'   : 'Red'
            \ }
