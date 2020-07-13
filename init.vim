"""
" 配置一些需要的全局变量
" session目录
let g:session_dir = $HOME.'/.cache/vim/sessions'
" 设置vim-plug插件安装路径
let g:plugins_path = $HOME.'/.cache/vim/plugins'
" 配置路径
let g:config_path = expand('<sfile>:p:h') . '/config'
" coc插件目录
let g:coc_data_home = $HOME.'/.cache/vim/coc'
"""

" 插件配置文件所在路径
let s:plugin_config_home = g:config_path . '/plugins'
" 自定义配置路径
let s:custom_config_home = g:config_path . '/custom'

command! -nargs=1 LoadScript exec 'source ' . g:config_path. '/' . '<args>'

" 加载基础配置
LoadScript base.vim
" 加载插件列表
LoadScript plug.vim

" 判断插件列表是否有这个插件
fun! g:HasPlug(plugName) abort
    if index(g:plugs_order, a:plugName) > -1
        return v:true
    else
        return v:false
    endif
endfunction

if g:HasPlug('coc.nvim')
    " 判断是否安装了coc插件
    fun! g:HasCocPlug(cocPlugName)
        if index(g:coc_global_extensions, a:cocPlugName) > -1
            return v:true
        else
            return v:false
        endif
    endfunc
endif

" 判断该插件是否已经安装
fun! g:HasInstall(plugin_name) abort
    let l:plugin_path = g:plugins_path . "/" . a:plugin_name
    if !empty(glob(l:plugin_path))
        return v:true
    else
        return v:false
    endif
endfunction

" 插件目录存在才根据是否安装插件来载入配置
for s:plugin_name in g:plugs_order
    if g:HasInstall(s:plugin_name)
        " 如果已经安装了插件，那么载入插件配置
        let s:config_path = join([s:plugin_config_home, s:plugin_name], "/") . ".vim"
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

" 加载按键映射配置
LoadScript keymap.vim
" 加载主题配置
LoadScript theme.vim
