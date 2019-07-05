if HasPlug('lightline.vim')
    if &laststatus < 2
        set laststatus=2
    endif

    let g:lightline = {
        \ 'colorscheme': 'one',
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ],
        \             [ 'readonly', 'filename', 'modified', 'method' ],
        \             [ 'gitbranch', 'method', 'cocstatus']
        \           ],
        \   'middle':['quote'],
        \   'right': [
        \       ['lineinfo'],
        \       ['percent'],
        \       [ 'filetype', 'fileencoding', 'fileformat', 'hex', 'asc'],
        \   ]
        \ },
        \ 'component': {
        \   'quote': '花无重开日，人无再少年',
        \   'asc': '%03.3b',
        \   'hex': '0x%B',
        \ },
        \ 'component_function': {
        \   'gitbranch': 'fugitive#head',
        \   'cocstatus': 'coc#status',
        \   'method': 'NearestMethodOrFunction',
        \ },
      \ }
endif
