if &laststatus < 2
    " 窗口一直有状态行
    set laststatus=2
endif

let g:lightline = {
    \ 'colorscheme': 'srcery',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'readonly', 'filename', 'modified'],
    \             [ 'gitinfo', 'method', 'cocstatus']
    \           ],
    \   'right': [
    \       ['cocerror'], ['cocwarn'], ['cocfix'],
    \       [ 'filetype', 'fileencoding', 'fileformat', 'hex', 'asc', 'lineinfo'],
    \   ]
    \ },
    \ 'component': {
    \   'asc': '%03.3b',
    \   'hex': '0x%hhhB',
    \ },
    \ 'component_function': {
    \   'cocstatus': 'coc#status',
    \   'lineinfo': 'LightlineLineinfo',
    \   'readonly': 'LightLineReadonly',
    \   'gitinfo': 'LightLineGit',
    \   'cocerror': 'LightLineCocError',
    \   'cocwarn' : 'LightLineCocWarn',
    \   'cocfix': 'LightLineCocFixes',
    \ },
    \ 'component_expand': {
    \ },
    \ 'separator': { 'left': "\ue0b8", 'right': "\ue0ba"},
    \ 'subseparator': { 'left': "\ue0b9", 'right': "\ue0bb"}
\ }

function! s:lightline_is_lean() abort
    return &filetype =~? '\v^defx|mundo(diff)?$'
endfunction

function! s:lightline_is_plain() abort
    return &buftype ==? 'terminal' || &filetype =~? '\v^help|coc-explorer|denite|defx|vista_kind|vista|tagbar$'
endfunction

function! LightlineLineinfo() abort
    return &filetype ==? 'help'             ? ''  :
    \      &filetype ==? 'defx'             ? ' ' :
    \      &filetype ==? 'coc-explorer'     ? ' ' :
    \      &filetype ==? 'denite'           ? ' ' :
    \      &filetype ==? 'tagbar'           ? ' ' :
    \      &filetype ==? 'vista_kind'       ? ' ' :
    \      &filetype ==? 'vista'            ? ' ' :
    \      &filetype =~? '\v^mundo(diff)?$' ? ' ' :
    \      s:lightline_is_lean() || s:lightline_is_plain() ? ' '  :
    \      printf(' %d%% ☰ %d:%d', 100*line('.')/line('$'),  line('.'), col('.'))
endfunction

function! LightLineReadonly()
    if &filetype == "help"
        return ""
    elseif &readonly
        return ""
    else
        return ""
    endif
endfunction

function! LightLineGit()abort
    if &filetype ==? 'defx' || &filetype ==? 'vista'
        return ""
    endif
    let gitbranch=get(g:, 'coc_git_status', '')
    let gitcount=get(b:, 'coc_git_status', '')
    let gitinfo = []
    if empty(gitbranch)
        let gitbranch=""
    endif
    if empty(gitcount)
        let gitcount=""
    endif
    call add(gitinfo,gitbranch)
    call add(gitinfo,gitcount)
    return trim(join(gitinfo,''))
endfunction

function! LightLineCocError()
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

function! LightLineCocWarn() abort
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

function! LightlineCocFixes() abort
    let b:coc_line_fixes = get(get(b:, 'coc_quickfixes', {}), line('.'), 0)
    return b:coc_line_fixes > 0 ? printf('%d ', b:coc_line_fixes) : ''
endfunction
