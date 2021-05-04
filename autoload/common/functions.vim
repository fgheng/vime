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
function! common#functions#HasPlug(...) abort
    " 如果类型是列表，那么列表中的所有插件都要存在才可以
    " 其他情况如字符串，只需要存在一个即可
    " HasPlug("f", ["a", "b", "c"], "d", "e")
    " 需要f存在或者[a b c]都要存在或者d存在或者e存在

    if a:0 == 0
        return v:false
    endif

    " 如果有一个存在，那么就返回true
    for out_item in a:000
        " 如果类型是列表
        " 那么列表中的所有插件都要存在

        if type(out_item) == v:t_list

            let list_tag = v:true
            for item in out_item
                " 不存在
                if index(g:plugs_order, item) == -1
                    let list_tag = v:false
                    break
                endif
            endfor
            if list_tag
                return v:true
            endif

        " 否则，只需要检测是否存在
        elseif type(out_item) == v:t_string
            if index(g:plugs_order, out_item) > -1
                return v:true
            endif
        endif
    endfor


    " 插件列表中是否存在该插件
    " return (index(g:plugs_order, a:plugName) > -1 ? v:true : v:false)
endfunction

function! common#functions#HasInstall(plugName) abort
    " 判断插件是否已经安装在本地
    return (isdirectory(g:plugs[a:plugName].dir) ? v:true : v:false)
endfunction

function! common#functions#HasCocPlug(plugName) abort
    " 判断是否安装了coc插件
    if common#functions#HasPlug('coc.nvim') && has_key(g:, 'coc_global_extensions') &&
        \ index(g:coc_global_extensions, a:plugName) > -1
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

    let s:exclude_ft = ["coc-explorer", "vista"]
    if index(s:exclude_ft, &ft) != -1 | return | endif

    " 如果在floaterm中
    if &ft ==# "floaterm"
        if a:direction == 0
            exec "FloatermNext"
        else
            exec "FloatermPrev"
        endif

        return
    endif

    if tabpagenr('$') > 1
        call common#functions#moveTab(a:direction)
    else
        call common#functions#moveBuffer(a:direction)
    endif
endfunction

function! common#functions#moveTab(direction) abort
    if a:direction == 0
        exec 'tabprevious'
    elseif a:direction == 1
        exec 'tabnext'
    endif
endfunction

function! common#functions#moveBuffer(direction) abort
    if a:direction == 0
        exec 'bprevious'
    elseif a:direction == 1
        exec 'bnext'
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
    if &readonly
        return "  "
    else
        return ""
    endif
endfunction

function! common#functions#GitBranch() abort
    " 根据不同的插件获取git分支

    let l:git_branch = get(g:, 'coc_git_status', '')
    if l:git_branch != ''
        return strlen(l:git_branch) > 0 ? l:git_branch : ''
    elseif exists('fugitive#head')
        return fugitive#head(8)
    elseif exists('*gitbranch#name')
        return gitbranch#name()
    elseif exists('*vcs#info')
        return vcs#info('%b')
    endif
endfunction

function! common#functions#GitCount() abort
    " Git修改计数
    let l:git_count=get(b:, 'coc_git_status', '')
    return l:git_count

    if empty(l:git_count)
        if exists('*GitGutterGetHunkSummary')
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
    return get(b:, 'vista_nearest_method_or_function', '')
endfunction

function! common#functions#BufLineAndColInfo() abort
    " 获得当前buffer的行，列等信息
    return printf(' %d%% ☰ %d:%d', 100*line('.')/line('$'),  line('.'), col('.'))
endfunction

function! common#functions#getVisualSelection() abort
    " Why is this not a built-in Vim script function?!
    let [line_start, column_start] = getpos("'<")[1:2]
    let [line_end, column_end] = getpos("'>")[1:2]
    let lines = getline(line_start, line_end)
    if len(lines) == 0
        return ''
    endif
    let lines[-1] = lines[-1][: column_end - (&selection == 'inclusive' ? 1 : 2)]
    let lines[0] = lines[0][column_start - 1:]
    return join(lines, "\n")
endfunction

function! common#functions#CocError() abort
    if !common#functions#HasPlug('coc.nvim')
        return ""
    endif
    let error_sign = get(g:, 'coc_status_error_sign', has('mac') ? '❌ ' : 'E')
    let info = get(b:, 'coc_diagnostic_info', {})
    if empty(info)
        return ''
    endif
    let errmsgs = []
    if get(info, 'error', 0)
        call add(errmsgs, error_sign . info['error'])
    endif
    return join(errmsgs, ' ')
endfunction

function! common#functions#CocWarn() abort
    if !common#functions#HasPlug('coc.nvim')
        return ""
    endif
    let warning_sign = get(g:, 'coc_status_warning_sign')
    let info = get(b:, 'coc_diagnostic_info', {})
    if empty(info)
        return ''
    endif
    let warnmsgs = []
    if get(info, 'warning', 0)
        call add(warnmsgs, warning_sign . info['warning'])
    endif
    return join(warnmsgs, ' ')
endfunction

function! common#functions#CocFixes() abort
    if !common#functions#HasPlug('coc.nvim')
        return ""
    endif
    let b:coc_line_fixes = get(get(b:, 'coc_quickfixes', {}), line('.'), 0)
    return b:coc_line_fixes > 0 ? printf('%d ', b:coc_line_fixes) : ''
endfunction

function! common#functions#CocStatus() abort
    if !common#functions#HasPlug('coc.nvim')
        return ""
    endif
    return coc#status()
endfunction
