if HasPlug('ranger.vim')
    let g:NERDTreeHijackNetrw = 0 " add this line if you use NERDTree
    let g:ranger_replace_netrw = 1 " open ranger when vim open a directory
    " let ranger_command_override = 'ranger --cmd "set show_hidden=true"'
endif
