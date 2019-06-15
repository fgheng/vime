if HasPlug('goyo.vim')
    " 在悬浮窗口中打开goyo
    let s:fwinnr = -1
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
endif
