"""
" 配置一些需要的全局变量
let g:root_path = $HOME . '/.cache/vim'
" vim插件安装目录
let g:plugins_path = g:root_path . '/plugins'
" coc插件安装目录
let g:coc_data_home = g:root_path . '/coc'
" 配置所在根目录
let g:config_root_path = expand('<sfile>:p:h') . '/config'
" session保存目录
let g:session_dir = $HOME.'/.cache/vim/sessions/'
" 撤销记录文件
let g:undo_dir = g:root_path . '/undo'
" 操作系统判别
if(has("win32") || has("win64") || has("win95") || has("win16")) | let g:isWindows = v:true
else | let g:isWindows = v:false | endif
" gui还是terminal
if has("gui_running") | let g:isGUI = v:true | else | let g:isGUI = v:false | endif
"""

" 插件配置文件所在路径
let s:plugin_config_home = g:config_root_path . '/plugins'
" 自定义配置路径
let s:custom_config_home = g:config_root_path . '/custom'

" 定义载入配置命令
command! -nargs=1 LoadScript exec 'source ' . g:config_root_path . '/' . '<args>'

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
    " if index(g:plugs_order, a:plugName) > -1 | return v:true
    " else | return v:false | endif
endfunction

" 判断该插件是否已经安装
fun! g:HasInstall(plugin_name) abort
    let l:plugin_path = g:plugins_path . "/" . a:plugin_name
    " if !empty(glob(l:plugin_path)) | return v:true
    if isdirectory(l:plugin_path) | return v:true
    else | return v:false | endif
endfunction

if g:HasPlug('coc.nvim')
    " 判断是否安装了coc插件
    fun! g:HasCocPlug(cocPlugName)
        if index(g:coc_global_extensions, a:cocPlugName) > -1 | return v:true
        else | return v:false | endif
    endfunc
endif

" 除非把快捷键全部集中到keymap中
" for [plug_name, spec] in items(g:plugs)
"     let config_path = s:plugin_config_home . "/" . plug_name . ".vim"
"     if has_key(spec, 'on') || has_key(spec, 'for')
"        execute "autocmd! User " . plug_name . "if filereadable(" . config_path . ") | source " . fnameescape(config_path) . " | echom load " . plug_name ." | endif"
"     else
"         if filereadable(config_path)
"             exec 'source' fnameescape(config_path)
"         endif
"     endif
" endfor

for s:plugin_name in g:plugs_order
    " 如果已经安装了插件，那么载入插件配置
    if g:HasInstall(s:plugin_name)
        let s:config_path = s:plugin_config_home . "/" . s:plugin_name . ".vim"
        if filereadable(s:config_path)
            exec 'source' fnameescape(s:config_path)
        endif
    endif
endfor

" 载入custom目录下的自定义配置
let s:custom_files = split(glob(s:custom_config_home . '/*.vim'), '\n')
for s:custom_file in s:custom_files
    exec 'source ' . fnameescape(s:custom_file)
endfor

" 加载基础配置
LoadScript base.vim
" 加载按键映射配置
LoadScript keymap.vim
" 加载主题配置
LoadScript theme.vim
