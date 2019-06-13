if HasPlug('ranger.vim')
    let g:NERDTreeHijackNetrw = 0 " add this line if you use NERDTree
    let g:ranger_replace_netrw = 1 " open ranger when vim open a directory
    " let ranger_command_override = 'ranger --cmd "set show_hidden=true"'
    let g:ranger_map_keys = 0 " 取消默认的leader f
    noremap <leader>f :Ranger<cr>
endif
