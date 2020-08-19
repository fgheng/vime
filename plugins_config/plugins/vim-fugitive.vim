function! BufferList() abort
    let all = range(0, bufnr('$'))
    let res = []
    for b in all
        if buflisted(b)
        call add(res, bufname(b))
        endif
    endfor
    return res
endfunction

function! GitBlameToggle()
    if &ft ==? 'fugitiveblame'
        exec "normal gq"
    else
        exec "Gblame"
    endif
endfunction

let g:fugitive_val_vdiff_split = 0
let g:fugitive_val_vdiff_winnr = -1
function! GitVDiffToggle()
    if g:fugitive_val_vdiff_split
        exec "close " . g:fugitive_val_vdiff_winnr
        let g:fugitive_val_vdiff_split = 0
    else
        exec "Gvdiffsplit"
        let g:fugitive_val_vdiff_winnr = winnr()
        let g:fugitive_val_vdiff_split = 1
    endif
endfunction

let g:fugitive_val_log_open = 0
let g:fugitive_val_buffer_num = -1
function! GlogToggle()
    " 打开了log
    if g:fugitive_val_log_open
        cclose
        let g:fugitive_val_log_open = 0
        exec g:fugitive_val_log_return_to_window . "wincmd w"
        "exec "buffer " . g:fugitive_val_buffer_num
    " 没有打开log
    else
        "let g:fugitive_val_buffer_num = bufnr()
        let g:fugitive_val_log_return_to_window = winnr()
        exec "0Glog"
        let g:fugitive_val_log_open = 1
    endif
endfunction

let g:fugitive_val_status_open = 0
let g:fugitive_val_status_winnr = -1
let g:fugitive_val_pre_winnr = -1
let g:fugitive_val_pre_bufnr = -1
function! GstatusToggle()
    if g:fugitive_val_status_open
        " exec "normal gq"
        exec "close " . g:fugitive_val_status_winnr
        exec g:fugitive_val_pre_winnr . "wincmd w"
        " exec "buffer " . g:fugitive_val_pre_bufnr
        let g:fugitive_val_status_open = 0
    else
        let g:fugitive_val_pre_winnr = winnr()
        "let g:fugitive_val_pre_bufnr = bufnr()
        exec "Gstatus"
        let g:fugitive_val_status_winnr = winnr()
        let g:fugitive_val_status_open = 1
    endif
endfunction

let g:fugitive_val_clog_open = 0
let g:fugitive_val_clog_pre_winnr = -1
let g:fugitive_val_clog_pre_bufnr = -1
function! GclogToogle() abort
    if g:fugitive_val_clog_open
        " 关闭quickfix
        exec "cclose"
        " TODO 回到之前的窗口然后关闭所有的buffer是fugitive的窗口
        exec g:fugitive_val_clog_pre_winnr . "wincmd w"
        exec "buffer " . g:fugitive_val_clog_pre_bufnr
        let g:fugitive_val_clog_open = 0
    else
        let g:fugitive_val_clog_pre_winnr = winnr()
        let g:fugitive_val_clog_pre_bufnr = bufnr()
        exec "Gclog"
        let g:fugitive_val_clog_open = 1
    endif
endfunction

nmap <leader>gd <esc>:call GitVDiffToggle()<cr>
" nmap <leader>gb <esc>:call GitBlameToggle()<cr>
nmap <leader>gc <esc>:Gcommit<cr>
nmap <leader>gw <esc>:Gw<cr>

" nmap gl <esc>:call GlogToggle()<cr>
" nmap gt <esc>:call GstatusToggle()<cr>
