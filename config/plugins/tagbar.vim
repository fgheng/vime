" tagbar config begin
" if !empty(glob(plug_home."/tagbar"))

    let g:tagbar_width = 35
    function! Tagbar_Toggle()
        if bufname('%') == '__Tagbar__.1'
            execute "normal! :TagbarClose\<cr>"
        else
            execute "normal! :TagbarOpen j\<cr>"
        endif
    endfunction
    nnoremap <F3> :call Tagbar_Toggle()<CR>

" endif
" tagbar config begin
