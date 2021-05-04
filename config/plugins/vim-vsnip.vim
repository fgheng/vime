" Expand
imap <expr> <M-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
smap <expr> <M-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'

" Expand or jump
imap <expr> <C-j>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'

" Jump forward or backward
imap <expr> <M-j>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<M-j>'
smap <expr> <M-j>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<M-j>'
imap <expr> <M-k>   vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<M-k>'
smap <expr> <M-k>   vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<M-k>'

" Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
" See https://github.com/hrsh7th/vim-vsnip/pull/50
nmap        s   <Plug>(vsnip-select-text)
xmap        s   <Plug>(vsnip-select-text)
nmap        S   <Plug>(vsnip-cut-text)
xmap        S   <Plug>(vsnip-cut-text)

" If you want to use snippet for multiple filetypes, you can `g:vsnip_filetypes` for it.
" let g:vsnip_filetypes = {}
" let g:vsnip_filetypes.javascriptreact = ['javascript']
" let g:vsnip_filetypes.typescriptreact = ['typescript']
