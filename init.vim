" 载入全局配置
exe "source " . expand('<sfile>:p:h') . "/global.vim"

" 定义载入配置命令
command! -nargs=1 LoadScript exec 'source ' . g:plugins_config_root_path . '/' . '<args>'

" vim-plug 载入插件
call plug#begin(g:plugins_install_path)
LoadScript plug_list.vim
call plug#end()

" 判断插件是否载入
function! PlugLoaded(name)
    return (
       \ has_key(g:plugs, a:name) &&
       \ stridx(&rtp, g:plugs[a:name].dir) >= 0)
endfunction

" 判断插件是否存在于插件列表中
fun! g:HasPlug(plugName) abort
    return (index(g:plugs_order, a:plugName) > -1 ? v:true : v:false)
endfunction

" 判断该插件是否已经安装在本地
fun! g:HasInstall(plugin_name) abort
    return (isdirectory(g:plugs[a:plugin_name].dir) ? v:true : v:false)
endfunction

" 判断是否安装了coc插件
fun! g:HasCocPlug(cocPlugName)
    if g:HasPlug('coc.nvim') && index(g:coc_global_extensions, a:cocPlugName) > -1 | return v:true
    else | return v:false | endif
endfunc

" 依据插件名字载入对应的插件配置
function s:source_config(plugin_name) abort
    let s:config_path = g:plugins_config_root_path . "/plugins/" . a:plugin_name . ".vim"
    if filereadable(s:config_path)
        exec 'source' fnameescape(s:config_path)
    endif
endfunction

" TODO 从plug.vim中寻找何时载入插件
" 载入插件配置
for [plugin_name, plugin_config] in items(g:plugs)
    if g:HasInstall(plugin_name)
        call s:source_config(plugin_name)
    endif
endfor
