if common#functions#HasPlug('tagbar')
    let g:tagbar_width = 35
    function! Tagbar_Toggle()
        let a:bufnr = bufnr('__vista__')
        let a:bufwinnr = bufwinnr(a:bufnr)

        " 如果存在这个buf
        if a:bufnr > -1
            " 如果正在窗口中显示
            if a:bufwinnr > -1
                " 如果当前在这个窗口这里
                if winnr() == a:bufwinnr
                    " 关闭
                    exe "TagbarClose"
                else
                    " 跳转过去
                    exe a:bufwinnr . " wincmd w"
                endif
            else
                exe "TagbarOpen"
            endif
        else
            exe "TagbarOpen"
            "let s:tagNr = bufnr('__Tagbar__')
            "let s:tagNa = bufname('__Tagbar__')
        endif
    endfunction

    nnoremap <F3> :call Tagbar_Toggle()<CR>
    "nnoremap <F3> :TagbarToggle<cr>
endif
