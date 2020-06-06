" let g:ranger_map_keys = 0 " 取消默认的leader f

let g:NERDTreeHijackNetrw = 0
let g:ranger_replace_netrw = 1

" 显示隐藏文件
let ranger_command_override = 'ranger --cmd "set show_hidden=true"'
noremap <leader>f :RangerCurrentFile<cr>
" noremap <leader>w :RangerWorkingDirectory<cr>
