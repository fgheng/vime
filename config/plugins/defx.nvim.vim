let g:defx_icons_enable_syntax_highlight = 1
let g:defx_icons_column_length = 2

let s:columns = ""
if common#functions#HasPlug('defx-git')
    call defx#custom#column('git', {
        \   'indicators': {
        \     'Modified'  : '•',
        \     'Staged'    : '✚',
        \     'Untracked' : 'ᵁ',
        \     'Renamed'   : 'R',
        \     'Unmerged'  : '≠',
        \     'Ignored'   : 'ⁱ',
        \     'Deleted'   : '✖',
        \     'Unknown'   : '⁇'
        \   }
        \ })
    let s:columns = "indent:mark:git:icon:icons:filename:type"
else
    let s:columns = "indent:mark:icon:icons:filename:type"
endif

call defx#custom#column('icon', {
        \ 'directory_icon': '▸',
        \ 'opened_icon': '▾',
        \ 'root_icon': '/',
        \ })
call defx#custom#column('mark', {
            \ 'selected_icon': '✓',
            \ 'readonly_icon': '🔒',
            \ })

function! DefxOpen(where) abort
    if a:where
        let s:before_winnr = winnr()
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
                \ 'columns': s:columns,
                \ })
    else
        call defx#custom#option('_', {
                \ 'split': 'vertical',
                \ 'direction': 'topleft',
                \ 'winwidth': 30,
                \ 'listed': 1,
                \ 'show_ignored_files': 0,
                \ 'buffer_name': 'defx',
                \ 'toggle': 1,
                \ 'resume': 1,
                \ 'columns': s:columns
                \ })
    endif
    exec "Defx "
endf

" 自定义快捷键函数
function! s:selectWindow(filepath)
    if tabpagewinnr(tabpagenr(), '$') > 2
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
endfunction

function! DefxSmartCr(_)
    " 悬浮和非悬浮行为不一样
    " 进入目录或者打开文件
    let l:split = a:_['split']

    if defx#is_directory()
        call defx#call_action('open_directory')
        " 如果是悬浮窗口，不应该更改cwd
        if l:split !=? 'floating'
            call defx#call_action('change_vim_cwd')
            echom "Tab's CWD is: " . getcwd()
        endif
    else
        let l:filepath = defx#get_candidate()['action__path']
        if l:split ==? 'floating'
            exec s:before_winnr . 'wincmd w'
            exec 'e' l:filepath
            exec "Defx -close"
        else
            call s:selectWindow(l:filepath)
        endif
    endif

endfunction

function! DefxSmartL(_) abort
    " 展开树或者打开文件
    if defx#is_directory()
        call defx#call_action('open_tree')
        normal! j
    else
        " return defx#call_action('drop')
        let l:filepath = defx#get_candidate()['action__path']

        let l:split = a:_['split']
        if l:split ==? 'floating'
            " 先关闭悬浮窗口
            exec "Defx -close"
        endif

        call s:selectWindow(l:filepath)
    endif
endfunction

function! DefxSmartH(_) abort
    " 第一行或者没有行，那么返回上一级目录
    if line('.') ==# 1 || line('$') ==# 1
        return defx#call_action('cd', ['..'])
    endif

    return defx#call_action('close_tree')
endfunction

function! DefxSmartBackSpace(_) abort
    " 回到上一级并将上一级设置为工作目录
    call defx#call_action('cd', ['..'])
    call defx#call_action('change_vim_cwd')
    echom "Tab's CWD is: " . getcwd()
endfunction

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

" 自定义快捷键
" nnoremap <silent> <F2> <esc>:call OpenDefxCurWin()<cr>
" nnoremap <silent> <F2> <esc>:call OpenDefxLeft()<cr>
nnoremap <silent> <F2> <esc>:call DefxOpen(v:false)<cr>
if !common#functions#HasPlug('ranger.vim')
    nnoremap <silent> <leader>f <esc>:call DefxOpen(v:true)<cr>
endif

function! s:defx_custom_settings() abort
    nnoremap <silent><buffer><expr> N                   defx#do_action('new_file')                      " 新建文件/文件夹
    nnoremap <silent><buffer><expr> D                   defx#do_action('remove_trash')                  " 删除
    nnoremap <silent><buffer><expr> Y                   defx#do_action('copy')                          " 复制
    nnoremap <silent><buffer><expr> P                   defx#do_action('paste')                         " 粘贴
    nnoremap <silent><buffer><expr> dd                  defx#do_action('move')                          " 剪切
    nnoremap <silent><buffer><expr> R                   defx#do_action('rename')                        " 重命名
    nnoremap <silent><buffer><expr> v                   defx#do_action('toggle_select') . 'j'           " 选择
    nnoremap <silent><buffer><expr> V                   defx#do_action('toggle_select') . 'k'           " 选择
    nnoremap <silent><buffer><expr> *                   defx#do_action('toggle_select')                 " 选择但不移动
    nnoremap <silent><buffer><expr> x                   defx#do_action('execute_system')                " 执行
    nnoremap <silent><buffer><expr> yp                  defx#do_action('yank_path')                     " 复制路径
    nnoremap <silent><buffer><expr> h                   defx#do_action('call', 'DefxSmartH')            " 关闭节点或者返回上一层目录，但不设置cwd
    nnoremap <silent><buffer><expr> l                   defx#do_action('call', 'DefxSmartL')            " 展开或者打开文件
    nnoremap <silent><buffer><expr> L                   defx#do_action('open_tree_recursive')           " 递归展开
    nnoremap <silent><buffer><expr> q                   defx#do_action('quit')                          " 关闭的defx
    nnoremap <silent><buffer><expr> r                   defx#do_action('redraw')
    nnoremap <silent><buffer><expr> <Cr>                defx#do_action('call', 'DefxSmartCr')           " 打开文件或者进入目录
    nnoremap <silent><buffer><expr> <backspace>         defx#do_action('call', 'DefxSmartBackSpace')    " 返回上一级目录并设置cwd
    nnoremap <silent><buffer><expr> W                   defx#do_action('drop', 'vsplit')
    nnoremap <silent><buffer><expr> w                   defx#do_action('drop', 'split')
    nnoremap <silent><buffer><expr> t                   defx#do_action('drop', 'tabedit')
    nnoremap <silent><buffer><expr> .                   defx#do_action('toggle_ignored_files')          " 显示隐藏文件
    nnoremap <silent><buffer><expr> s                   defx#do_action('toggle_sort')                   " 排序
    nnoremap <silent><buffer><expr> ~                   defx#do_action('cd')
    nnoremap <silent><buffer><expr> x                   defx#do_action('execute_command')
    nnoremap <silent><buffer><expr> `                   defx#do_action('cd', getcwd())                  " 回到工作目录
    nnoremap <silent><buffer><expr> cd                  defx#do_action('change_vim_cwd')                " 将当前目录设置为工作目录
    nnoremap <silent><buffer><expr> f                   defx#do_action('search')
endfunction

augroup vime_defx_group
    autocmd!
    " Delete defx if it's the only buffer left in the window
    autocmd WinEnter * if &filetype == 'defx' && winnr('$') == 1 | q | endif
    " Move focus to the next window if current buffer is defx
    autocmd TabLeave * if &filetype == 'defx' | wincmd w | endif
    autocmd TabClosed * call s:defx_close_tab(expand('<afile>'))
    " Define defx window mappings
    autocmd FileType defx call s:defx_custom_settings()

    autocmd FileType defx setlocal nobuflisted
    autocmd FileType defx setlocal nonumber
    autocmd FileType defx setlocal norelativenumber
    " autocmd FileType defx setlocal laststatus=0
augroup END
