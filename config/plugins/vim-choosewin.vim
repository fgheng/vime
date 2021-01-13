" 使用覆盖模式
let g:choosewin_overlay_enable = 0

function s:chooseWin() abort
    if winnr('$') > 1
        exec 'ChooseWin'
    endif
endfunction

" 默认快捷键
" | Key    | Action     | Description                   |
" | ------ | ---------- | ----------------------------- |
" | 0      | tab_first  | Select FIRST    tab           |
" | [      | tab_prev   | Select PREVIOUS tab           |
" | ]      | tab_next   | Select NEXT     tab           |
" | $      | tab_last   | Select LAST     tab           |
" | x      | tab_close  | Close current tab             |
" | ;      | win_land   | Navigate to current window    |
" | -      | previous   | Naviage to previous window    |
" | s      | swap       | Swap windows               #1 |
" | S      | swap_stay  | Swap windows but stay      #1 |
" | `<CR>` | win_land   | Navigate to current window    |
" |        | `<NOP>`    | Disable predefined keymap     |

nnoremap <silent> - :call <SID>chooseWin()<cr>
