" 自动保存session
"fu! SaveSess()
"    "if getcwd() == hom
"    "    echo "is home"
"    "    return
"    "endif
"    "if !isdirectory(getcwd() . '/.vim')
"        execute 'call mkdir(/.vim)'
"    "endif
"    execute 'mksession! %:p:h/.vim/session.vim'
"endfunction

"fu! RestoreSess()
"    if filereadable('%:p:h/.vim/session.vim')
"        execute 'so %:p:h/.vim/session.vim'
"        if bufexists(1)
"            for l in range(1, bufnr('$'))
"                if bufwinnr(l) == -1
"                    exec 'sbuffer ' . l
"                endif
"            endfor
"        endif
"    endif
"endfunction

"augroup session
"    autocmd!
"    autocmd VimLeavePre * call SaveSess()
"    autocmd VimEnter * call RestoreSess()
"augroup END
