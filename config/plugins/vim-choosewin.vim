" 使用覆盖模式
let g:choosewin_overlay_enable = 0

function s:chooseWin() abort
    if winnr('$') > 1
        exec 'ChooseWin'
    endif
endfunction

nnoremap <silent> - :call <SID>chooseWin()<cr>
