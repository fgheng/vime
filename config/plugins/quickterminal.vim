if has('nvim')
  autocmd BufEnter term://* startinsert
endif

if !&hidden
    set hidden
endif

" terminal 这个buff是否存在
"fu! TerminalBufferIsExisting(tnmb, tname)
"    redir => buffers
"    silent ls
"    redir END
"    for buf in split(buffers, '\n')
"        if match(buf, '\v^\s*'.a:tnmb) > -1 && match(buf, a:tname) > -1
"            return 1
"        endif
"    endfor
"    return 0
"endf

" terminal 这个buffer是否正在某个窗口中显示
fu! TerminalIsShowingInWindows(tnmb, tname)
    if bufwinnr(a:tnmb) > -1
        return 1
    else
        return 0
    endif
endf

fu! TerminalIsShowingInTabWindows(tnmb, tname)
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
"let s:winviews = []
" 底部打开终端
fu! OpenTerminalBottom()
    "let a:allwindows = getwininfo()
    "for a:win in a:allwindows
    "    exec a:win['winnr'] . "wincmd w"
    "    let s:winviews = add(s:winviews, winsaveview())
    "endfor
    "let a:curBufView = winsaveview()
    "let a:curWinnr = winnr()
    botright split
    resize 15

    "if TerminalBufferIsExisting(s:bnr, s:bna)
    if bufexists(s:bnr)
        exe "b".s:bnr
    else
        if has('nvim')
            exec "terminal"
            exe "normal! a"
        else
            :call term_start('bash', {'curwin' : 1, 'term_finish' : 'close'})
        endif
        let s:bnr = bufnr("%")
        let s:bna = bufname("%")
        let s:winnr = winnr()
    endif
    "exe a:curWinnr . "wincmd w"
    "call winrestview(a:curBufView)
    "exe s:winnr . "wincmd w"
    "for a:v in s:winviews
    "    call winrestview(a:v)
    "endfor
    "call empty(s:winviews)
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
    "if TerminalBufferIsExisting(s:tbnr, s:tbna)
    if bufexists(s:tbnr)
        " 终端存在
        " 判断终端是否正在某个tab中的窗口中显示
        if TerminalIsShowingInTabWindows(s:tbnr, s:tbna)
            " 是的,终端现在正在一个tab中显示
            " 找一下是哪一个tab
            redir => allTabs
            silent tabs
            redir END

            for tabNumAndName in split(allTabs, '\n')
                if tabNumAndName[0] ==? 'T'
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
                    " 定位到那个窗口
                    "exe s:twinnr . "wincmd w"
                    exe bufwinnr(s:tbnr) . "wincmd w"
                    return
                endif
            endfor

        else
            " 没有,需要新建tab,然后显示终端
            exe "$tabnew"
            exe "b".s:tbnr
        endif

        exe s:twinnr . "wincmd w"
    else
        " 终端不存在,新建tab,新建终端
        if has('nvim')
            exe "$tabnew | term"
            exe "normal a"
        else
            exe "$tabnew"
            exe "call term_start('bash', {'curwin' : 1, 'term_finish' : 'close'})"
        endif

        let s:tbnr = bufnr("%")
        let s:tbna = bufname("%")
        let s:twinnr = winnr()

        nnoremap <buffer> <c-w>k <nop>
        nnoremap <buffer> <c-w>h <nop>
        nnoremap <buffer> <c-w>j <nop>
        nnoremap <buffer> <c-w>l <nop>
        nnoremap <buffer> <c-w>s <nop>
        nnoremap <buffer> <c-w>v <nop>
    endif
endf

fu! OpenTerminalTabToggle()
    " 位于终端处,关闭终端
    "
    "if tabpagewinnr(tabpagenr(), '$') == 1
    "    " 只有一个空窗口，可以直接打开终端
    "else
    "    " 在新标签页打开终端
    "endif
    if bufname("%") != "" && bufname("%") == s:tbna
        " 如果在这个终端页面中打开了其他窗口,那么应该只关闭该终端窗口
        " 或者不允许建立新的窗口
        exe "tabclose"
    else
        " 没有位于终端处, 打开终端
        exe "call OpenTerminalTab()"
    endif
endf

imap <F9> <esc>:call OpenTerminalTabToggle()<cr>
nnoremap <F9> <esc>:call OpenTerminalTabToggle()<cr>
tnoremap <F9> <c-\><c-n>:call OpenTerminalTabToggle()<cr>

" 在悬浮窗口中打开终端
let s:fbnr = -1
let s:fbna = ""
let s:fwinnr = -1

fu! OpenTerminalInFloatWindowToggle()
    let a:height = &lines / 2
    let a:width = float2nr(&columns - (&columns * 2 / 6))
    let a:col = float2nr((&columns - a:width) / 2)

    let a:opts = {
            \ 'relative': 'editor',
            \ 'row': a:height * 0.5,
            \ 'col': a:col,
            \ 'width': a:width,
            \ 'height': a:height
            \ }

    " 首先判断浮动终端buffer是否存在
    "if TerminalBufferIsExisting(s:fbnr, s:fbna)
    if bufexists(s:fbnr)
        " 检查buffer是否正显示在浮动窗口中
        if TerminalIsShowingInWindows(s:fbnr, s:fbna)
            " 是的话需要判断当前光标的窗口是否是浮动终端
            if winnr() == bufwinnr(s:fbnr)
                " 是的话关闭窗口
                exec "close ".bufwinnr(s:fbnr)
                return
            else
                " 不是的话切换到窗口
                exec bufwinnr(s:fbnr) . "wincmd w"
                return
            endif
        else
            " 没有显示在浮动窗口中, 创建浮动窗口
            let a:buf = nvim_create_buf(v:false, v:true)
            let a:fwin = nvim_open_win(a:buf, v:true, a:opts)
            let s:fwinnr = winnr()
            " 显示终端
            exec s:fbnr . "b"

        endif
    else
        " 没有显示在浮动窗口中, 创建浮动窗口
        let a:buf = nvim_create_buf(v:false, v:true)
        let a:fwin = nvim_open_win(a:buf, v:true, a:opts)
        let s:fwinnr = winnr()
        " 不存在, 那么新建一个终端
        if has('nvim')
            exec "terminal"
            exec "normal a"
        else
            :call term_start('bash', {'curwin' : 1, 'term_finish' : 'close'})
        endif

        let s:fbnr = bufnr("%")
        let s:fbna = bufname("%")

        setlocal nonumber
        setlocal norelativenumber
        setlocal signcolumn=no
        highlight NormalFloat cterm=NONE ctermfg=14 ctermbg=0 gui=NONE guifg=#93a1a1 guibg=#002931

    endif

endf

imap <F10> <esc>:call OpenTerminalInFloatWindowToggle()<cr>
nnoremap <F10> <esc>:call OpenTerminalInFloatWindowToggle()<cr>
tnoremap <F10> <c-\><c-n>:call OpenTerminalInFloatWindowToggle()<cr>
