if exists('*HasCocPlug') && exists('*HasPlug')
    if common#functions#HasCocPlug('coc-lists') || common#functions#HasPlug('dashboard-nvim', 'vim-startify')
        finish
    endif

    " 退出vim的时候自动保存session
    " session包括三个，session0，session1，session2
    " 其中session0表示最近一次的session，而1则表示上上一次，2表示上上上一次
    function! s:SaveSession() abort
        if !isdirectory(g:session_dir)
            call mkdir(g:session_dir)
        endif

        let l:sessions = [g:session_dir . '/session_0.vim',
                    \ g:session_dir. '/session_1.vim',
                    \ g:session_dir. '/session_2.vim']

        if filereadable(l:sessions[1])
            call rename(l:sessions[1], l:sessions[2])
        endif

        if filereadable(l:sessions[0])
            call rename(l:sessions[0], l:sessions[1])
        endif
        exec "mksession! " . l:sessions[0]
    endfunction

    augroup vime_session_group
        autocmd!
        autocmd VimLeavePre * call s:SaveSession()
    augroup END
endif
