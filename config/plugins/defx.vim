if HasPlug('defx.nvim')

    let s:DefxWinNr = -1
    let s:beforWinnr = -1

    function! OpenDefx()
        exec 'wal'
        let s:beforWinnr = getwininfo(win_getid())[0]['winnr']
        "let a:wincol = getwininfo(win_getid())[0]['wincol']
        "let a:winrow = getwininfo(win_getid())[0]['winrow']
        call defx#custom#option('_', {
                \ 'split': 'floating',
                \ 'wincol': 0,
                \ 'winrow': 0,
                \ 'winrelative': 'win',
                \ 'winwidth': winwidth(0),
                \ 'winheight': winheight(0)+1,
                \ 'show_ignored_files': 0,
                \ 'buffer_name': '',
                \ 'toggle': 1,
                \ 'resume': 1,
                \ 'columns': "git:mark:indent:icon:icons:filename:size"
                \ })

        "if winwidth(0) <= 120
        "    let a:wincol = getwininfo(win_getid())[0]['wincol']
        "    let a:winrow = getwininfo(win_getid())[0]['winrow']
        "    call defx#custom#option('_', {
        "            \ 'direction': 'leftabove',
        "            \ 'split': 'floating',
        "            \ 'wincol': a:wincol,
        "            \ 'winrow': a:winrow,
        "            \ 'winwidth': winwidth(0),
        "            \ 'winheight': winheight(0),
        "            \ 'show_ignored_files': 0,
        "            \ 'buffer_name': '',
        "            \ 'toggle': 1,
        "            \ 'resume': 1,
        "            \ 'columns': "git:mark:indent:icon:icons:filename:size"
        "            \ })

        "    "exec "Defx -winwidth=`winwidth(0)` -winheight=`winheight(0)`"
        "    "exec "Defx -winwidth=50 -winheight=`winheight(0)`"
        "    "highlight NormalFloat cterm=NONE ctermfg=14 ctermbg=0 gui=NONE guifg=#93a1a1 guibg=#002931
        "else
        "    call defx#custom#option('_', {
        "            \ 'direction': 'leftabove',
        "            \ 'split': 'vertical',
        "            \ 'winwidth': 35,
        "            \ 'show_ignored_files': 0,
        "            \ 'buffer_name': '',
        "            \ 'toggle': 1,
        "            \ 'resume': 1,
        "            \ 'columns': "git:mark:indent:icon:icons:filename:size"
        "            \ })

        "endif

        exec "Defx"
        "highlight NormalFloat cterm=NONE ctermfg=14 ctermbg=0 gui=NONE guifg=#93a1a1 guibg=#002931
        highlight NormalFloat cterm=NONE ctermfg=14 ctermbg=0 gui=NONE guifg=None guibg=None
        let s:DefxWinNr = winnr()
    endfunction

    function! OpenDefxLeft()
        exec 'wal'
        call defx#custom#option('_', {
                \ 'direction': 'leftabove',
                \ 'split': 'vertical',
                \ 'winwidth': 35,
                \ 'show_ignored_files': 0,
                \ 'buffer_name': '',
                \ 'toggle': 1,
                \ 'resume': 1,
                \ 'columns': "git:mark:indent:icon:icons:filename:size"
                \ })
        exec "Defx"
        "highlight NormalFloat cterm=NONE ctermfg=14 ctermbg=0 gui=NONE guifg=#93a1a1 guibg=#002931
    endfunction
    nnoremap <silent> <F2> <esc>:call OpenDefx()<cr>
    "nnoremap <silent> <leader>d <esc>:call OpenDefxLeft()<cr>

    call defx#custom#column('filename', {
                \ 'directory_icon': '▸',
                \ 'opened_icon': '▾',
                \ 'root_icon': ' ',
                \ 'min_width': 5,
                \ 'max_width': 35,
                \ })

    call defx#custom#column('mark', {
                \ 'selected_icon': '✓',
                \ 'readonly_icon': '',
                \ })

    autocmd FileType defx call s:defx_custom_settings()

    function! s:defx_custom_settings() abort

        nnoremap <silent><buffer><expr> V       defx#do_action('toggle_select') . 'j'
        nnoremap <silent><buffer><expr> *       defx#do_action('toggle_select_all')
        nnoremap <silent><buffer><expr> X       defx#do_action('execute_system')
        nnoremap <silent><buffer><expr> yy      defx#do_action('copy')
        nnoremap <silent><buffer><expr> q       defx#do_action('quit')
        nnoremap <silent><buffer><expr> m       defx#do_action('move')
        nnoremap <silent><buffer><expr> p       defx#do_action('paste')
        "nnoremap <silent><buffer><expr> h       defx#is_opened_tree() ? defx#do_action('close_tree') : defx#do_action('cd', ['..'])
        nnoremap <silent><buffer><expr> h       defx#do_action('call', 'DefxSmartH')
        nnoremap <silent><buffer><expr> l       defx#do_action('call', 'DefxSmartL')
        nnoremap <silent><buffer><expr> L       defx#do_action('call', 'DefxSmartBigL')
        nnoremap <silent><buffer><expr> o       defx#do_action('call', 'DefxSmartO')
        "nnoremap <silent><buffer><expr> <Cr>    defx#is_directory() ? defx#do_action('open_directory') : defx#do_action('drop')
        nnoremap <silent><buffer><expr> <Cr>    defx#do_action('call', 'DefxSmartCr')

        nnoremap <silent><buffer><expr> <2-LeftMouse> defx#is_directory() ? defx#do_action('open_tree') : defx#do_action('drop')
        nnoremap <silent><buffer><expr> sv      defx#do_action('drop', 'vsplit')
        nnoremap <silent><buffer><expr> sh      defx#do_action('drop', 'split')
        nnoremap <silent><buffer><expr> st      defx#do_action('drop', 'tabedit')
        nnoremap <silent><buffer><expr> S       defx#do_action('toggle_sort', 'time')
        nnoremap <silent><buffer><expr> P       defx#do_action('open', 'pedit' )
        nnoremap <silent><buffer><expr> N       defx#do_action('new_file')
        nnoremap <silent><buffer><expr> dd      defx#do_action('remove_trash')
        nnoremap <silent><buffer><expr> r       defx#do_action('rename')
        nnoremap <silent><buffer><expr> .       defx#do_action('toggle_ignored_files')
        nnoremap <silent><buffer><expr> ~       defx#do_action('cd')
        nnoremap <silent><buffer><expr> !       defx#do_action('execute_command')
        nnoremap <silent><buffer><expr> j       line('.') == line('$') ? 'gg' : 'j'
        nnoremap <silent><buffer><expr> k       line('.') == 1 ? 'G' : 'k'
        nnoremap <silent><buffer><expr> <C-r>   defx#do_action('redraw')
        nnoremap <silent><buffer><expr> <C-g>   defx#do_action('print')
        nnoremap <silent><buffer><expr> \       defx#do_action('cd', getcwd())
        " nnoremap <silent><buffer><expr> cd
        "                \ defx#do_action('change_vim_cwd')
        " nnoremap <silent><buffer><expr> c    defx#do_action('yank_path')
        " nnoremap <silent><buffer><expr> cd
        "             \ defx#do_action('open_directory')
        "
    endfunction

    function! DefxSmartCr(_)
        if defx#is_directory()
            call defx#call_action('open_directory')
        else
            let a:filepath = defx#get_candidate()['action__path']
            exec "close " . s:DefxWinNr
            exec s:beforWinnr . "wincmd w"
            exec 'e'. a:filepath
        endif
    endfunction

    function! DefxSmartO(_)
        if defx#is_directory()
            call defx#call_action('open_directory')
        else
            call defx#call_action('drop')
            exec "close " . s:DefxWinNr
        endif
    endfunction

    " in this function we should vim-choosewin if possible
    function! DefxSmartL(_)
        " exec 'wal'
        if defx#is_directory()
            call defx#call_action('open_tree')
            normal! j
        else
            let a:filepath = defx#get_candidate()['action__path']
            exec "close " . s:DefxWinNr
            if tabpagewinnr(tabpagenr(), '$') >= 2    " if there are more than 2 normal windows
                if exists(':ChooseWin') == 2
                    ChooseWin
                else
                    if has('nvim')
                        let input = input({
                                    \ 'prompt'      : 'ChooseWin No.: ',
                                    \ 'cancelreturn': 0,
                                    \ })
                        if input == 0 | return | endif
                    else
                        let input = input('ChooseWin No.: ')
                    endif
                    if input == winnr() | return | endif
                    exec input . 'wincmd w'
                endif
                exec 'e' a:filepath
            else
                exec 'wincmd w'
                exec 'e' a:filepath
            endif
        endif
    endfunction

    function! DefxSmartBigL(_)
        " exec 'wal'
        if defx#is_directory()
            call defx#call_action('open_tree_recursive')
            normal! j
        else
            let a:filepath = defx#get_candidate()['action__path']
            exec "close " . s:DefxWinNr
            if tabpagewinnr(tabpagenr(), '$') >= 2    " if there are more than 2 normal windows
                if exists(':ChooseWin') == 2
                    ChooseWin
                else
                    if has('nvim')
                        let input = input({
                                    \ 'prompt'      : 'ChooseWin No.: ',
                                    \ 'cancelreturn': 0,
                                    \ })
                        if input == 0 | return | endif
                    else
                        let input = input('ChooseWin No.: ')
                    endif
                    if input == winnr() | return | endif
                    exec input . 'wincmd w'
                endif
                exec 'e' a:filepath
            else
                exec 'wincmd w'
                exec 'e' a:filepath
            endif
        endif
    endfunction

    function! DefxSmartH(_)
        " if cursor line is first line, or in empty dir
        if line('.') ==# 1 || line('$') ==# 1
            return defx#call_action('cd', ['..'])
        endif

        " candidate is opend tree?
        if defx#is_opened_tree()
            return defx#call_action('close_tree')
        endif

        " if you want close_tree immediately, enable below line.
        call defx#call_action('close_tree')
    endfunction

    " defx git
    let g:defx_git#indicators = {
        \ 'Modified'  : 'M',
        \ 'Staged'    : 'S',
        \ 'Untracked' : '?',
        \ 'Renamed'   : 'R',
        \ 'Unmerged'  : 'U',
        \ 'Ignored'   : 'I',
        \ 'Deleted'   : 'D',
        \ 'Unknown'   : '⁇'
        \ }

    hi Defx_git_Untracked ctermfg=12 guifg=#81a2be
    hi Defx_git_Ignored   ctermfg=8  guifg=#404660
    hi Defx_git_Unknown   ctermfg=3  guifg=#f0c674
    hi Defx_git_Renamed   ctermfg=3  guifg=#de935f
    hi Defx_git_Modified  ctermfg=9  guifg=#cc6666
    hi Defx_git_Unmerged  ctermfg=14 guifg=#8abeb7
    hi Defx_git_Deleted   ctermfg=13 guifg=#b294bb
    hi Defx_git_Staged    ctermfg=10 guifg=#b5bd68


    " defx icons
    let g:defx_icons_enable_syntax_highlight = 1
    let g:defx_icons_column_length = 2
    let g:defx_icons_directory_icon = ''
    let g:defx_icons_mark_icon = '*'
    let g:defx_icons_parent_icon = ''
    let g:defx_icons_default_icon = ''
    let g:defx_icons_directory_symlink_icon = ''
                   " Options below are applicable only when using "tree" feature
    let g:defx_icons_root_opened_tree_icon = ''
    let g:defx_icons_nested_opened_tree_icon = ''
    let g:defx_icons_nested_closed_tree_icon = ''
endif
