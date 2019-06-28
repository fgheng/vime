" 用于测试插件配置
"----------------------------------------- bar

" function! s:get_text()
"   if exists("*win_getid") && exists("*getwininfo")
"     let dict = getwininfo(win_getid())
"     if len(dict) > 0 && get(dict[0], 'quickfix', 0) && !get(dict[0], 'loclist', 0)
"       return g:airline#extensions#quickfix#quickfix_text
"     elseif len(dict) > 0 && get(dict[0], 'quickfix', 0) && get(dict[0], 'loclist', 0)
"       return g:airline#extensions#quickfix#location_text
"     endif
"   endif
"   redir => buffers
"   silent ls
"   redir END

"   let nr = bufnr('%')
"   for buf in split(buffers, '\n')
"     if match(buf, '\v^\s*'.nr) > -1
"       if match(buf, '\cQuickfix') > -1
"         return g:airline#extensions#quickfix#quickfix_text
"       else
"         return g:airline#extensions#quickfix#location_text
"       endif
"     endif
"   endfor
"   return ''
" endfunction

"-----------------------------------------changewindowsize
" function! JudgeWindowSize()
"     if wincol() < 85
"         exe "vertical resize 85"
"     endif
" endfunction

" autocmd WinEnter * call JudgeWindowSize()

"---------------------------------------- filetype
"if HasPlug('vim-markdown')
"    let s:tocNr = -1
"    fu! TocToggle()
"        " toc 开启了
"        if s:tocNr > -1
"            " 当前窗口number不等于toc的窗口
"            if winnr() != bufwinnr(s:tocNr)
"                " 跳转过去
"                exe bufwinnr(s:tocNr) . "wincmd w"
"            else
"                exec "close " . bufwinnr(s:tocNr)
"                let s:tocNr = -1
"            endif
"        else
"            exec "Toc"
"            exec "wincmd L | vertical res 35"
"            let s:tocNr = bufnr("%")
"        endif
"    endf
"    augroup filetype_autocommand
"        au!
"        autocmd FileType markdown setlocal nowrap
"    augroup END
"    " autocmd FileType markdown setlocal spell

"    au FileType markdown,qf nnoremap <buffer> <F3> :call TocToggle()<cr>
"endif

"----------------------------------------自动resource
" autocmd  BufWritePost *.vim source $MYVIMRC
