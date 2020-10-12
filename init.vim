call common#common#init()

" 定义载入配置命令
command! -nargs=1 LoadScript exec 'source ' . g:config_root_path . '<args>'

" 载入基础配置
LoadScript base.vim

" vim-plug 载入插件
call plug#begin(g:plugins_install_path)
LoadScript plugin_list.vim
call plug#end()

" 载入快捷键配置
LoadScript keymap.vim
" 载入主题配置
LoadScript theme.vim

" 依据插件名字载入对应的插件配置
function s:source_config(pluginName) abort
    let l:config_path = g:plugins_config_root_path . a:pluginName . ".vim"
    if filereadable(l:config_path)
        exec 'source' fnameescape(l:config_path)
    endif
endfunction

" TODO 从plug.vim中寻找何时载入插件
" 载入插件配置
for [plugName, _] in items(g:plugs)
    if common#functions#HasInstall(plugName)
        call s:source_config(plugName)
    endif
endfor
