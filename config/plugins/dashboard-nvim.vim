let g:dashboard_default_executive ='fzf'
let g:dashboard_default_header='superman'

let g:dashboard_custom_shortcut={
   \ 'last_session'       : '',
   \ 'find_history'       : '',
   \ 'find_file'          : '',
   \ 'change_colorscheme' : '',
   \ 'find_word'          : '',
   \ 'book_marks'         : '',
   \ }

augroup vime_dash_group
    autocmd!
    autocmd VimLeavePre * :<c-u>SessionSave<cr>
augroup END

