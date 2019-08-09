" 自动保存session
fu! SaveSess()
    execute 'mksession! ~/.cache/coc/sessions/default.vim'
endfunction

fu! RestoreSess()
    if filereadable('~/.cache/coc/sessions/default.vim')
        execute 'so ~/.cache/coc/sessions/default.vim'
        echom "load success"
        if bufexists(1)
            for l in range(1, bufnr('$'))
                if bufwinnr(l) == -1
                    exec 'sbuffer ' . l
                endif
            endfor
        endif
    endif
endfunction

augroup session
    autocmd!
    autocmd VimLeavePre * call SaveSess()
    "autocmd VimEnter * call RestoreSess()
augroup END
