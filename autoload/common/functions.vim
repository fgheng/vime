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
