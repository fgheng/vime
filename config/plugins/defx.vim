
call defx#custom#option('_', {
        \ 'direction': 'leftabove',
        \ 'split': 'vertical',
        \ 'winwidth': 30,
        \ 'show_ignored_files': 0,
        \ 'buffer_name': '',
        \ 'toggle': 1,
        \ 'resume': 1,
        \ 'columns': "git:mark:indent:icon:icons:filename:size"
        \ })

        " \ 'split': 'vertical',
        " \ 'wincol': (&columns - &winwidth)/2,
        " \ 'winrow': (&lines - &winheight)/2,
        " \ 'winwidth': &columns,
        " \ 'winheight': &winwidth,
        " \ 'winheight': 100,
        " \ 'winrow': 0,
        " \ 'wincol': 0,

call defx#custom#column('filename', {
            \ 'directory_icon': '▸',
            \ 'opened_icon': '▾',
            \ 'root_icon': ' ',
            \ 'min_width': 5,
            \ 'max_width': 35,
            \ })

call defx#custom#column('mark', {
            \ 'selected_icon': '✓',
            \ 'readonly_icon': '✗',
            \ })

"call defx#custom#column('icon', {
"            \ 'readonly_icon': '✗',
"            \ 'selected_icon': '✓',
"            \ })

autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort

    nnoremap <silent><buffer><expr> V       defx#do_action('toggle_select') . 'j'
    nnoremap <silent><buffer><expr> *       defx#do_action('toggle_select_all')
    nnoremap <silent><buffer><expr> X       defx#do_action('execute_system')
    nnoremap <silent><buffer><expr> yy      defx#do_action('copy')
    nnoremap <silent><buffer><expr> q       defx#do_action('quit')
    nnoremap <silent><buffer><expr> m       defx#do_action('move')
    nnoremap <silent><buffer><expr> p       defx#do_action('paste')
    nnoremap <silent><buffer><expr> h       defx#is_opened_tree() ? defx#do_action('close_tree') : defx#do_action('cd', ['..'])
    nnoremap <silent><buffer><expr> l       defx#do_action('call', 'DefxSmartL')
    nnoremap <silent><buffer><expr> o       defx#do_action('call', 'DefxSmartL')
    nnoremap <silent><buffer><expr> <Cr>    defx#is_directory() ? defx#do_action('open_directory') : defx#do_action('drop')
    " nnoremap <silent><buffer><expr> <Cr>    defx#do_action('call', 'DefxSmartL')
    nnoremap <silent><buffer><expr> <2-LeftMouse> defx#is_directory() ? defx#do_action('open_tree') : defx#do_action('drop')
    nnoremap <silent><buffer><expr> sv      defx#do_action('drop', 'vsplit')
    nnoremap <silent><buffer><expr> sh      defx#do_action('drop', 'split')
    nnoremap <silent><buffer><expr> st      defx#do_action('drop', 'tabedit')
    nnoremap <silent><buffer><expr> S       defx#do_action('toggle_sort', 'time')
    nnoremap <silent><buffer><expr> P       defx#do_action('open', 'pedit')
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
        defx#call_action('open_directory')
    else
        defx#call_action('drop')
    endif
endfunction

" in this function we should vim-choosewin if possible
function! DefxSmartL(_)
    " exec 'wal'
    if defx#is_directory()
        call defx#call_action('open_tree')
        normal! j
    else
        let filepath = defx#get_candidate()['action__path']
        if tabpagewinnr(tabpagenr(), '$') >= 3    " if there are more than 2 normal windows
            " 应该改为判断当前defx是否已经打开
            " exec 'Defx'
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
            exec 'e' filepath
        else
            " exec 'Defx'
            exec 'wincmd w'
            exec 'e' filepath
        endif
    endif
endfunction

" defx git
let g:defx_git#indicators = {
    \ 'Modified'  : 'M',
    \ 'Staged'    : 'm',
    \ 'Untracked' : '?',
    \ 'Renamed'   : '≫',
    \ 'Unmerged'  : 'u',
    \ 'Ignored'   : 'i',
    \ 'Deleted'   : '✖',
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
