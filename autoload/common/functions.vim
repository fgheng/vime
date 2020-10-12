"""""""""""""""""""""""""""""""""""""""
"
" 一些通用或者懒加载的自定义函数放到这里
"""""""""""""""""""""""""""""""""""""""

function! common#functions#PlugHasLoaded(plugName) abort
    " 判断插件是否已经载入
    return (
       \ has_key(g:plugs, a:plugName) &&
       \ stridx(&rtp, g:plugs[a:plugName].dir) >= 0)
endfunction

" TODO 应该先判断g:plugs_order是否存在
function! common#functions#HasPlug(plugName) abort
    " 插件列表中是否存在该插件
    return (index(g:plugs_order, a:plugName) > -1 ? v:true : v:false)
endfunction

function! common#functions#HasInstall(plugName) abort
    " 判断插件是否已经安装在本地
    return (isdirectory(g:plugs[a:plugName].dir) ? v:true : v:false)
endfunction

function! common#functions#HasCocPlug(plugName) abort
    " 判断是否安装了coc插件
    if common#functions#HasPlug('coc.nvim') && index(g:coc_global_extensions, a:plugName) > -1
        return v:true
    else
        return v:false
    endif
endfunction

function! common#functions#Wall() abort
    " 写入所有文件
    " 记录当前的tab以及window
    let tab = tabpagenr()
    let win = winnr()
    let seen = {}
    " 保存当前的buffer
    if !&readonly && expand("%") !=# ''
        let seen[bufnr('')] = 1
        write
    endif
    " 在每个标签页每个窗口执行
    tabdo windo if !&readonly && &buftype =~# '^\%(acwrite\)\=$' && expand('%') !=# '' && !has_key(seen, bufnr('')) | silent write | let seen[bufnr('')] = 1 | endif
    " 返回之前的tab和window
    execute 'tabnext '.tab
    execute win.'wincmd w'
endfunction

function! common#functions#MoveTabOrBuf(direction) abort
    " 移动buffer或者tab
    " 0 <- 1 ->
    if tabpagenr('$') > 1
        if a:direction == 0 | exec 'tabprevious'
        elseif a:direction == 1 | exec 'tabnext'
        endif
    else
        if a:direction == 0 | exec 'bprevious'
        elseif a:direction == 1 | exec 'bnext'
        endif
    endif
endfunction

function! common#functions#OpenFileUsingSystemApp(filePath) abort
    " 使用系统应用打开当前文件
    exec 'silent !xdg-open ' . fnameescape(a:filePath) . ' > /dev/null'
endfunction

function! common#functions#ModeType() abort
    " 获得当前的模式
    " 返回n, i, v, R中的一种
    if mode() =~# '[nc]'
        return 'n'
    elseif mode() =~# '[it]'
        return 'i'
    elseif mode() =~# '[vVsS]'
        return 'v'
    elseif mode() ==# 'R'
        return 'R'
    endif
    return ''
endfunction

" TODO 更改为字典，if判断速度较慢
function! common#functions#ModeLabel() abort
    " 获得模式的标签
    " 如NORMAL INSERT VISUAL等
    let l:mode = common#functions#ModeType()
    if l:mode ==? 'n'
        return 'NORMAL'
    elseif l:mode ==? 'i'
        return 'INSERT'
    elseif l:mode ==? 'v'
        return 'VISUAL'
    elseif l:mode ==? 'R'
        return 'REPLACE'
    else
        return ''
    endif
endfunction

function! common#functions#ModeLabelWithColor() abort
    " 获得模式的标签，带颜色
    " 如NORMAL INSERT VISUAL等
    let l:mode = common#functions#ModeType()
    if l:mode ==? 'n'
        return 'NORMAL'
    elseif l:mode ==? 'i'
        return 'INSERT'
    elseif l:mode ==? 'v'
        return 'VISUAL'
    elseif l:mode ==? 'R'
        return 'REPLACE'
    else
        return ''
    endif
endfunction

function! common#functions#FileType() abort
    " 获得一些特殊文件的类型
    return &filetype ==? 'help'             ? ''  :
    \      &filetype ==? 'defx'             ? ' ' :
    \      &filetype ==? 'coc-explorer'     ? ' ' :
    \      &filetype ==? 'denite'           ? ' ' :
    \      &filetype ==? 'tagbar'           ? ' ' :
    \      &filetype ==? 'vista_kind'       ? ' ' :
    \      &filetype ==? 'vista'            ? ' ' :
    \      &filetype =~? '\v^mundo(diff)?$' ? ' ' :
    \      &filetype
endfunction

function! common#functions#ReadOnly() abort
    " 判断是否只读
    if &filetype == "help"
        return ""
    elseif &readonly
        return "  "
    else
        return ""
    endif
endfunction

function! common#functions#GitBranch() abort
    " 获取git分支
    let l:git_branch=get(g:, 'coc_git_status', '')
    if empty(l:git_branch)
        return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
    else
        return strlen(l:git_branch) > 0 ? l:git_branch : ''
    endif
endfunction

function! common#functions#GitCount() abort
    " Git修改计数
    let l:git_count=get(b:, 'coc_git_status', '')
    if empty(l:git_count)
        if common#functions#HasPlug('vim-gitgutter')
            let [a,m,r] = GitGutterGetHunkSummary()
                return printf('+%d ~%d -%d', a, m, r)
        else
            return ''
        endif
    else
        return l:git_count
    endif
endfunction

function! common#functions#MethodOrFunction() abort
    " 当前的方法或者函数
    if common#functions#HasPlug('vista.vim')
        return get(b:, 'vista_nearest_method_or_function', '')
    endif
endfunction

function! common#functions#BufLineAndColInfo() abort
    " 获得当前buffer的行，列等信息
    return printf(' %d%% ☰ %d:%d', 100*line('.')/line('$'),  line('.'), col('.'))
endfunction
