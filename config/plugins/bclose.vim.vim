" let b:bclose_no_plugin_maps = true
function! s:buffer_close() abort
    redir => val
        exec "buffers"
    redir end
    if len(val) > 0
        exec "Bclose"
    endif
endfunction
nnoremap Q :silent call <SID>buffer_close()<cr>
