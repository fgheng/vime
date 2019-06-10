" 用于测试插件配置
"----------------------------------------- terminal
if has('nvim')
  autocmd BufEnter term://* startinsert
endif

if !&hidden
    set hidden
endif

" terminal 这个buff是否存在
fu! TerminalBufferIsExisting(tnmb, tname)
    redir => buffers
    silent ls
    redir END
    for buf in split(buffers, '\n')
        if match(buf, '\v^\s*'.a:tnmb) > -1 && match(buf, a:tname) > -1
            return 1
        endif
    endfor
    return 0
endf

" terminal 这个buffer是否正在某个窗口中显示
fu! TerminalIsShowingInWindows(tnmb, tname)
    redi => buffers
    silent ls
    redir END
    for buf in split(buffers, '\n')
        if match(buf, '\v^\s*'.a:tnmb) > -1 && match(buf, a:tname) > -1
            " 有a即活动
            if match(split(buf)[1], "a-") > -1 || match(split(buf)[1], "a") > -1
                return 1
            else
                return 0
            endif
        endif
    endfor
    return 0
endf


let s:bnr = -1
let s:bna = ""
let s:winnr = -1
" 底部打开终端
fu! OpenTerminalBottom()
    botright split
    resize 15
    if TerminalBufferIsExisting(s:bnr, s:bna)
        exe "b".s:bnr
    else
        if has('nvim')
            exec "terminal"
        else
            :call term_start('bash', {'curwin' : 1, 'term_finish' : 'close'})
        endif
        exe "normal! a"
        let s:bnr = bufnr("%")
        let s:bna = bufname("%")
        let s:winnr = winnr()
    endif
endf

fu! OpenTerminalBottomToggle()
    " 如果活动
    if TerminalIsShowingInWindows(s:bnr, s:bna)
        if winnr() == s:winnr
            " 关闭这个窗口
            exec "close ".s:winnr
        else
            " 跳转到那个窗口
            exec s:winnr . 'wincmd w'
        endif
    else
        :call OpenTerminalBottom()
    endif
endf

imap <c-t> <esc>:call OpenTerminalBottomToggle()<cr>
nnoremap <c-t> <esc>:call OpenTerminalBottomToggle()<cr>
tnoremap <c-t> <c-\><c-n>:call OpenTerminalBottomToggle()<cr>

let s:tbnr = -1
let s:tbna = ""
let s:twinnr = -1
fu! OpenTerminalTab()
    " 判断终端buffer是否存在
    if TerminalBufferIsExisting(s:tbnr, s:tbna)
        " 终端存在
        " 判断终端是否正在某个tab中的窗口中显示
        if TerminalIsShowingInWindows(s:tbnr, s:tbna)
            " 是的,终端现在正在一个tab中显示
            " 找一下是哪一个tab
            redir => allTabs
            silent tabs
            redir END

            for tabNumAndName in split(allTabs, '\n')
                if tabNumAndName[0] ==? 't'
                    let l:tabNum = split(tabNumAndName)[2]
                    continue
                endif

                if tabNumAndName[0] == '>'
                    let l:tabName = split(tabNumAndName)[1]
                else
                    let l:tabName = split(tabNumAndName)[0]
                endif

                if l:tabName ==? s:tbna
                    exec "normal!" . l:tabNum . "gt"
                    return
                endif
            endfor
        else
            " 没有,需要新建tab,然后显示终端
            exe "tabnew"
            exe "b".s:tbnr
        endif

        exe s:twinnr . "wincmd w"
    else
        " 终端不存在,新建tab,新建终端
        if has('nvim')
            echom "create new term"
            exe "tabnew | term"
        else
            echom "vim create new term"
            exe "tabnew"
            exe "call term_start('bash', {'curwin' : 1, 'term_finish' : 'close'})"
        endif

        let s:tbnr = bufnr("%")
        let s:tbna = bufname("%")
        let s:twinnr = winnr()
    endif
endf

fu! OpenTerminalTabToggle()
    " 位于终端处,关闭终端
    if bufname("%") && bufname("%") == s:tbna
        echom "close tab"
        exe "tabclose"
    else
        " 没有位于终端处, 打开终端
        echom "will open termianl"
        :call OpenTerminalTab()
    endif
endf

imap <F9> <esc>:call OpenTerminalTabToggle()<cr>
nnoremap <F9> <esc>:call OpenTerminalTabToggle()<cr>
tnoremap <F9> <c-\><c-n>:call OpenTerminalTabToggle()<cr>

if has('nvim')
    " 在当前窗口下打开终端
    fu! OpenTerminalSCurrent()
        " open split windows on the topleft
        belowright split
        " resize the height of terminal windows to 30
        resize 15
        :terminal
        :normal a
    endf
else
    fu! OpenTerminalSCurrent()
        " open split windows on the topleft
        belowright split
        " resize the height of terminal windows to 30
        resize 15
        :call term_start('bash', {'curwin' : 1, 'term_finish' : 'close'})
        :normal a
    endf
endif
"----------------------------------------- bar
au FileType markdown nnoremap <buffer> <F3> :Toc<cr>
nnoremap <F3> :TagbarToggle<cr>
inoremap <F3> <esc>:TagbarToggle<cr>

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
" markdown 不换行
augroup filetype_autocommand
    au!
    autocmd FileType markdown setlocal nowrap
augroup END
" autocmd FileType markdown setlocal spell


"----------------------------------------自动resource
" autocmd  BufWritePost *.vim source $MYVIMRC
