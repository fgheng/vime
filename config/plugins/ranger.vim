if HasPlug('ranger.vim')
    let g:ranger_map_keys = 0 " 取消默认的leader f
    let g:NERDTreeHijackNetrw = 0 " add this line if you use NERDTree
    let g:ranger_replace_netrw = 1 " open ranger when vim open a directory
    " 显示隐藏文件
    let ranger_command_override = 'ranger --cmd "set show_hidden=true"'
    noremap <leader>f :RangerCurrentFile<cr>
endif
