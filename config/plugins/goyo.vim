if HasPlug('goyo.vim')

    " 在悬浮窗口中打开goyo
    "let s:fwinnr = -1
    "fu! FloatGoYo()
    "    if s:fwinnr < 0
    "        let a:bufnr = bufnr("%")
    "        let a:height = &lines
    "        let a:width = float2nr(&columns - (&columns * 2 / 6))
    "        let a:col = float2nr((&columns - a:width) / 2)

    "        let a:opts = {
    "                \ 'relative': 'editor',
    "                \ 'row': a:height * 0.5,
    "                \ 'col': a:col,
    "                \ 'width': a:width,
    "                \ 'height': a:height
    "                \ }
    "        let a:buf = nvim_create_buf(v:false, v:true)
    "        let a:fwin = nvim_open_win(a:buf, v:true, a:opts)
    "        let s:fwinnr = winnr()
    "        exe a:bufnr . "b"
    "        exec "Goyo"
    "    else
    "        exec "close " . s:fwinnr
    "        let s:fwinnr = -1
    "    endif
    "endf

    let g:goyo_width = '80'
    let g:goyo_height = '90%'
    let g:goyo_linenr = 0

    function! s:goyo_enter()
        if executable('tmux') && strlen($TMUX)
            silent !tmux set status off
            silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
        endif
        set noshowmode
        set noshowcmd
        set scrolloff=999
        delcommand ZoomWin
        delcommand <Plug>ZoomWin
        Limelight
    " ...
    endfunction

    function! s:goyo_leave()
        if executable('tmux') && strlen($TMUX)
            silent !tmux set status on
            silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
        endif
        set showmode
        set showcmd
        set scrolloff=5
        command! ZoomWin call ZoomWin()
        command! <Plug>ZoomWin call ZoomWin()
        Limelight!
    " ...
    endfunction

    autocmd! User GoyoEnter nested call <SID>goyo_enter()
    autocmd! User GoyoLeave nested call <SID>goyo_leave()
endif
