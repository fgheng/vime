set laststatus=2                                    " 状态栏, lightline中更改了
set showtabline=2                                   " 总是显示tab标签栏

function! CryCocError()
    if !g:HasPlug('coc.nvim')
        return ""
    endif
    let error_sign = get(g:, 'coc_status_error_sign', has('mac') ? '❌ ' : 'E')
    let info = get(b:, 'coc_diagnostic_info', {})
    if empty(info)
        return ''
    endif
    let errmsgs = []
    if get(info, 'error', 0)
        call add(errmsgs, error_sign . info['error'])
    endif
    return join(errmsgs, ' ')
endfunction

function! CryCocWarn() abort
    if !g:HasPlug('coc.nvim')
        return ""
    endif
    let warning_sign = get(g:, 'coc_status_warning_sign')
    let info = get(b:, 'coc_diagnostic_info', {})
    if empty(info)
        return ''
    endif
    let warnmsgs = []
    if get(info, 'warning', 0)
        call add(warnmsgs, warning_sign . info['warning'])
    endif
    return join(warnmsgs, ' ')
endfunction

function! CryCocFixes() abort
    if !g:HasPlug('coc.nvim')
        return ""
    endif
    let b:coc_line_fixes = get(get(b:, 'coc_quickfixes', {}), line('.'), 0)
    return b:coc_line_fixes > 0 ? printf('%d ', b:coc_line_fixes) : ''
endfunction

function! StatusLine(current, width)

    let l:f_list = ["coc-explorer", "defx", "vista", "nerdtree"]

    if index(f_list, &ft) > -1
        return &ft
    endif

    let l:s = ''

    if a:current
        let l:s .= crystalline#mode() . crystalline#right_mode_sep('')
    else
        let l:s .= '%#CrystallineInactive#'
    endif

    let l:s .= ' %f%h%w%m%r '
    if a:current
        let l:s .= crystalline#right_sep('', 'Fill') . ' %{fugitive#head()}'
    endif

    let l:s .= ' %{coc#status()}'

    let l:s .= '%='
    if a:current
        let l:s .= crystalline#left_sep('', 'Fill') . ' %{&paste ?"PASTE ":""}%{&spell?"SPELL ":""}'
        let l:s .= crystalline#left_mode_sep('')
    endif
    if a:width > 80
        let l:s .= ' %{&ft}[%{&fenc!=#""?&fenc:&enc}][%{&ff}] %l/%L %c%V %P '
    else
        let l:s .= ' '
    endif

    " let l:s .= crystalline#left_sep('', 'Fill') . ' %{CryCocWarn()}'
    " let l:s .= crystalline#left_mode_sep('')
    " let l:s .= crystalline#left_sep('', 'Fill') . ' %{CryCocError()}'
    " let l:s .= crystalline#left_mode_sep('')
    " let l:s .= crystalline#left_sep('', 'Fill') . ' %{CryCocFixes()}'
    " let l:s .= crystalline#left_mode_sep('')

    return l:s
endfunction

function! TabLine()
    let l:vimlabel = 'VIME'
    return crystalline#bufferline(2, len(l:vimlabel), 1) . '%=%#CrystallineTab# ' . l:vimlabel
endfunction

let g:crystalline_enable_sep = 1
let g:crystalline_statusline_fn = 'StatusLine'
let g:crystalline_tabline_fn = 'TabLine'
let g:crystalline_theme = 'onedark'

set showtabline=2
set guioptions-=e
set laststatus=2

function s:nextBufOrTab()
    let l:buffers_num = len(getbufinfo({'buflisted':1}))
    if l:buffers_num <= 1
        return
    endif
    if tabpagenr('$') > 1
        exec "tabnext"
    else
        exec "bnext"
    endif
endfunction

function s:prevBufOrTab()
    let l:buffers_num = len(getbufinfo({'buflisted':1}))
    if l:buffers_num <= 1
        return
    endif
    if tabpagenr('$') > 1
        exec "tabprevious"
    else
        exec "bprevious"
    endif
endfunction

nnoremap <silent> <M-l> :call <SID>nextBufOrTab()<cr>
nnoremap <silent> <M-h> :call <SID>prevBufOrTab()<cr>
tnoremap <silent> <M-l> <c-\><c-n>:call <SID>nextBufOrTab()<cr>
tnoremap <silent> <M-h> <c-\><c-n>:call <SID>prevBufOrTab()<cr>
