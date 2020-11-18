" TODO 判断vimwiki_path是否存在
let g:vimwiki_list = [
        \ {
            \ 'path': g:vimwiki_path,
            \ 'path_html': g:vimwiki_path . 'wiki_html',
            \ 'syntax': 'markdown',
            \ 'auto_toc': 1,
            \ 'ext':'.md',
            \ 'auto_diary_index': 1,
        \ }
    \ ]

" 高亮checkbox
let g:vimwiki_hl_cb_checked = 2

" todo符号
let g:vimwiki_listsyms = '✗○◐●✓'

" 目录标题的等级
let g:vimwiki_toc_header_level = 2

" 快捷键
nmap <leader>ww <esc>:<c-u>VimwikiIndex<cr>
nmap <leader>wt <esc>:<c-u>VimwikiTabIndex<cr>
nmap <leader>wi <esc>:<c-u>VimwikiDiaryIndex<cr>

augroup vime_vimwiki_group
    autocmd!
    autocmd FileType wiki,md,markdown setl colorcolumn=0
    autocmd FileType wiki,md,markdown setl conceallevel=0
    autocmd FileType wiki,md,markdown setl textwidth=0

    " 避免g:vimwiki_hl_cb_checked设置为2的时候有问题
    au BufEnter *.wiki :syntax sync fromstart
augroup END
