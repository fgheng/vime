"""
" vim配置文件所在根目录
let g:vim_root_path = expand('<sfile>:p:h') . '/'
" vim要插件、缓存等数据根目录
let g:cache_root_path = $HOME . '/.cache/vim/'
" 插件配置所在根目录
let g:plugins_config_root_path = g:vim_root_path . 'plugins_config/'

" vim 插件安装目录
let g:plugins_path = g:cache_root_path . 'plugins/'
" session 保存目录
let g:session_dir = g:cache_root_path . 'sessions/'
" 撤销记录文件
let g:undo_dir = g:cache_root_path . 'undo/'
" 操作系统判别
if(has("win32") || has("win64") || has("win95") || has("win16")) | let g:isWindows = v:true
else | let g:isWindows = v:false | endif
" gui还是terminal
if has("gui_running") | let g:isGUI = v:true | else | let g:isGUI = v:false | endif
"""

" 插件配置文件所在路径
let s:plugin_config_home = g:plugins_config_root_path . '/plugins'

" 定义载入配置命令
command! -nargs=1 LoadScript exec 'source ' . g:plugins_config_root_path . '/' . '<args>'

call plug#begin(g:plugins_path)
LoadScript plug.vim
call plug#end()

" 判断插件是否载入
function! PlugLoaded(name)
    return (
        \ has_key(g:plugs, a:name) &&
        \ isdirectory(g:plugs[a:name].dir) &&
        \ stridx(&rtp, g:plugs[a:name].dir) >= 0)
endfunction

" 判断插件列表中是否含有某个插件
fun! g:HasPlug(plugName) abort
    return (index(g:plugs_order, a:plugName) > -1 ? v:true : v:false)
endfunction

" 判断该插件是否已经安装
fun! g:HasInstall(plugin_name) abort
    if isdirectory(g:plugs[a:plugin_name].dir) | return v:true
    else | return v:false | endif
endfunction

" 判断是否安装了coc插件
fun! g:HasCocPlug(cocPlugName)
    if g:HasPlug('coc.nvim') && index(g:coc_global_extensions, a:cocPlugName) > -1 | return v:true
    else | return v:false | endif
endfunc

for s:plugin_name in g:plugs_order
    " 如果已经安装了插件，那么载入插件配置
    if g:HasInstall(s:plugin_name)
    " if PlugLoaded(s:plugin_name)
        let s:config_path = g:plugins_config_root_path . "/plugins/" . s:plugin_name . ".vim"
        if filereadable(s:config_path)
            exec 'source' fnameescape(s:config_path)
        endif
    endif
endfor
