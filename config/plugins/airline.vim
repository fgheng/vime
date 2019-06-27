if HasPlug('vim-airline')
    let g:airline_theme='kolor'
    let g:airline_powerline_fonts = 1
    let g:airline#extensions#tabline#enabled = 0    " 打开buffer
    let g:airline#extensions#tabline#formatter = 'unique_tail'
    let g:airline#extensions#tabline#show_tab_nr = 1
    let g:airline#extensions#tabline#tab_nr_type= 2
    let g:airline#extensions#tabline#show_tab_type = 1
    let g:airline#extensions#tabline#tabs_label = 'TABS'
    let g:airline#extensions#tabline#left_alt_sep = '>'
    let g:airline#extensions#tabline#buffer_nr_show = 1
    let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
    let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'

     "let g:airline#extensions#tabline#show_tab_nr = 1
     "let g:airline#extensions#tabline#formatter = 'default'
     "let g:airline#extensions#tabline#fnametruncate = 16
     "let g:airline#extensions#tabline#fnamecollapse = 2
     "let g:airline#extensions#tabline#buffer_idx_mode = 1
     "let g:airline#extensions#tabline#fnamemod = ':p:t'
     "let g:airline#extensions#tabline#buffer_idx_format = {
     "        \ '0': '➓ ',
     "        \ '1': '❶ ',
     "        \ '2': '❷ ',
     "        \ '3': '❸ ',
     "        \ '4': '❹ ',
     "        \ '5': '❺ ',
     "        \ '6': '❻ ',
     "        \ '7': '❼ ',
     "        \ '8': '❽ ',
     "        \ '9': '❾ '
     "        \}
     "let g:airline_detect_modified=1
     "let g:airline_detect_paste=1
     "let g:airline_detect_crypt=1
     "let g:airline_highlighting_cache = 1
     if  g:airline#extensions#tabline#enabled == 1
        nmap <M-k> <Plug>AirlineSelectPrevTab
        nmap <M-j> <Plug>AirlineSelectNextTab
    else
        nmap <M-j> :bn<cr>
        nmap <M-k> :bp<cr>
    endif
endif
