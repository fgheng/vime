
" 一些可能需要到的全局配置都放到这里
" 包括一些插件的全局配置也放到这里

" 配置所在根目录
let g:config_root_path = g:vim_root_path . 'config/'
let g:plugins_config_root_path = g:config_root_path . "plugins/"
let g:other_config_root_path = g:config_root_path . "other/"
" vim插件、缓存等数据根目录
let g:cache_root_path = $HOME . '/.cache/vim/'

" vim 插件安装目录
let g:plugins_install_path = g:cache_root_path . 'plugins/'
" session 保存目录
let g:session_dir = g:cache_root_path . 'sessions/'
" 撤销记录目录
let g:undo_dir = g:cache_root_path . 'undo/'

" tmux配置文件目录
let g:tmux_config_path = $HOME . '/.tmux.conf'

" 脚本目录
let g:scripts_path = g:vim_root_path . "/scripts"


" 一些通用函数放到这里
"

" 判断插件是否载入
function! g:PlugLoaded(name)
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
    if g:HasPlug('coc.nvim') && index(g:coc_global_extensions, a:cocPlugName) > -1
        return v:true
    else
        return v:false
    endif
endfunc
