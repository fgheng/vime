if HasPlug('defx.nvim')

    let s:DefxWinNr = -1
    let s:beforWinnr = -1

    let s:openfloat = 0
    let s:openleft = 0

    function! OpenDefx() abort
        if winwidth(0) <= 120
            call OpenDefxCurWin()
        else
            call OpenDefxLeft()
        endif
    endf

    function! OpenDefxCurWin()
        let s:openfloat = 1

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
                \ 'columns': "mark:icons:indent:icon:filename:type"
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

        let a:abs_path = expand('%:p:h')
        exec "Defx ".a:abs_path
        "highlight NormalFloat cterm=NONE ctermfg=14 ctermbg=0 gui=NONE guifg=#93a1a1 guibg=#002931
        highlight NormalFloat cterm=NONE ctermfg=14 ctermbg=0 gui=NONE guifg=None guibg=None
        let s:DefxWinNr = winnr()
    endfunction

    function! OpenDefxLeft()
        let s:openleft = 1
        exec 'wal'
        call defx#custom#option('_', {
                \ 'direction': 'topleft',
                \ 'winwidth': 30,
                \ 'split': 'vertical',
                \ 'listed': 1,
                \ 'show_ignored_files': 0,
                \ 'buffer_name': 'defx',
                \ 'toggle': 1,
                \ 'resume': 1,
                \ 'columns': "mark:icons:indent:icon:filename:size"
                \ })
                "\ 'direction': 'leftabove',
        "╰─▸
        call defx#custom#column('icon', {
                    \ 'directory_icon': '├─▸',
                    \ 'opened_icon': '╰─▸',
                    \ 'root_icon': '─▸',
                    \ 'file_icon': '╰─▸',
                    \ })
        call defx#custom#column('mark', {
                    \ 'selected_icon': '✓',
                    \ 'readonly_icon': '',
                    \ })
        let a:abs_path = expand('%:p:h')
        exec "Defx ".a:abs_path

        "highlight NormalFloat cterm=NONE ctermfg=14 ctermbg=0 gui=NONE guifg=#93a1a1 guibg=#002931
    endfunction

    "nnoremap <silent> <F2> <esc>:call OpenDefx()<cr>
    nnoremap <silent> <F2> <esc>:call OpenDefxLeft()<cr>

    autocmd FileType defx call s:defx_custom_settings()
    "autocmd FileType defx setlocal laststatus=0

    " defx快捷键
    function! s:defx_custom_settings() abort
        nnoremap <silent><buffer><expr> N       defx#do_action('new_file') " 新建文件/文件夹
        nnoremap <silent><buffer><expr> D       defx#do_action('remove_trash') " 删除
        nnoremap <silent><buffer><expr> Y       defx#do_action('copy') " 复制
        nnoremap <silent><buffer><expr> P       defx#do_action('paste') " 粘贴
        nnoremap <silent><buffer><expr> M       defx#do_action('move') " 移动
        nnoremap <silent><buffer><expr> R       defx#do_action('rename') " 重命名
        "nnoremap <silent><buffer><expr> V       defx#do_action('toggle_select') . 'j' " 选择
        nnoremap <silent><buffer><expr> J       defx#do_action('toggle_select') . 'j' " 选择
        nnoremap <silent><buffer><expr> K       defx#do_action('toggle_select') . 'k' " 选择
        nnoremap <silent><buffer><expr> *       defx#do_action('toggle_select_all') " 选择
        nnoremap <silent><buffer><expr> X       defx#do_action('execute_system') " 执行
        nnoremap <silent><buffer><expr> yy      defx#do_action('yank_path') " 复制路径
        nnoremap <silent><buffer><expr> q       defx#do_action('quit')
        nnoremap <silent><buffer><expr> h       defx#do_action('call', 'DefxSmartH')
        nnoremap <silent><buffer><expr> l       defx#do_action('call', 'DefxSmartL')
        nnoremap <silent><buffer><expr> L       defx#do_action('call', 'DefxSmartBigL')
        nnoremap <silent><buffer><expr> o       defx#do_action('call', 'DefxSmartO')
        "nnoremap <silent><buffer><expr> <Cr>    defx#do_action('call', 'DefxSmartCr')
        nnoremap <silent><buffer><expr> <Cr>    defx#do_action('drop')
        nnoremap <silent><buffer><expr> <2-LeftMouse> defx#is_directory() ? defx#do_action('open_tree') : defx#do_action('drop')
        if s:openleft
            nnoremap <silent><buffer><expr> sv      defx#do_action('drop', 'vsplit')
            nnoremap <silent><buffer><expr> sh      defx#do_action('drop', 'split')
            nnoremap <silent><buffer><expr> st      defx#do_action('drop', 'tabedit')
        endif
        nnoremap <silent><buffer><expr> S       defx#do_action('toggle_sort') " 排序
        nnoremap <silent><buffer><expr> .       defx#do_action('toggle_ignored_files') " 显示隐藏文件
        nnoremap <silent><buffer><expr> ~       defx#do_action('cd')
        nnoremap <silent><buffer><expr> !       defx#do_action('execute_command')
        nnoremap <silent><buffer><expr> j       line('.') == line('$') ? 'gg' : 'j'
        nnoremap <silent><buffer><expr> k       line('.') == 1 ? 'hhhG' : 'k'
        nnoremap <silent><buffer><expr> <C-r>   defx#do_action('redraw')
        nnoremap <silent><buffer><expr> <C-p>   defx#do_action('print')
        nnoremap <silent><buffer><expr> `       defx#do_action('cd', getcwd()) " 回到工作目录
        nnoremap <silent><buffer><expr> cd      defx#do_action('change_vim_cwd') " 将当前目录设置为工作目录
        nnoremap <silent><buffer><expr> s       defx#do_action('search', getcwd())
    endfunction

    function! DefxSmartCr(_)
        if defx#is_directory()
            call defx#call_action('open_directory')
        else
            let a:filepath = defx#get_candidate()['action__path']
            if s:openleft
                call defx#call_action('drop')
            elseif s:openleft
                exec "close " . s:DefxWinNr
                exec s:beforWinnr . "wincmd w"
                exec 'e'. a:filepath
            endif
        endif
    endfunction

    function! DefxSmartO(_)
        if s:openfloat
            if defx#is_directory()
                call defx#call_action('open_directory')
            else
                call defx#call_action('drop')
                exec "close " . s:DefxWinNr
            endif
        endif
    endfunction

    function! DefxSmartL(_)
        if defx#is_directory()
            call defx#call_action('open_tree')
            normal! j
        else
            let a:filepath = defx#get_candidate()['action__path']
            if s:openfloat
                exec "close " . s:DefxWinNr
            endif
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

                if &ft == 'defx'
                    return
                else
                    exec 'e' a:filepath
                endif

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
            if s:openfloat
                exec "close " . s:DefxWinNr
            endif
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

                if &ft == 'defx'
                    return
                else
                    exec 'e' a:filepath
                endif

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

    call defx#custom#column('git', {
        \   'indicators': {
        \     'Modified'  : '•',
        \     'Staged'    : '✚',
        \     'Untracked' : 'ᵁ',
        \     'Renamed'   : '≫',
        \     'Unmerged'  : '≠',
        \     'Ignored'   : 'ⁱ',
        \     'Deleted'   : '✖',
        \     'Unknown'   : '⁇'
        \   }
        \ })

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

    augroup user_plugin_defx
        autocmd!

        " FIXME
        " autocmd DirChanged * call s:defx_refresh_cwd(v:event)

        " Delete defx if it's the only buffer left in the window
        autocmd WinEnter * if &filetype == 'defx' && winnr('$') == 1 | q | endif

        " Move focus to the next window if current buffer is defx
        autocmd TabLeave * if &filetype == 'defx' | wincmd w | endif

        autocmd TabClosed * call s:defx_close_tab(expand('<afile>'))

        " Define defx window mappings
        "autocmd FileType defx call s:defx_mappings()

    augroup END

    function! s:defx_close_tab(tabnr)
        " When a tab is closed, find and delete any associated defx buffers
        for l:nr in range(1, bufnr('$'))
            let l:defx = getbufvar(l:nr, 'defx')
            if empty(l:defx)
                continue
            endif
            let l:context = get(l:defx, 'context', {})
            if get(l:context, 'buffer_name', '') ==# 'tab' . a:tabnr
                silent! execute 'bdelete '.l:nr
                break
            endif
        endfor
    endfunction
endif

