" 清除t_TI和t_TE，避免vim中出现奇怪字符
if exists('+t_TI') && exists('+t_TE')
    let &t_TI = ''
    let &t_TE = ''
endif

" vimrc所在根目录
let g:vim_root_path = expand('<sfile>:p:h') . '/'

" 定义载入配置命令
command! -nargs=1 LoadScript exec 'source ' . g:vim_root_path . '/config/' . '<args>'

" 载入通用配置
LoadScript common.vim

" vim-plug 载入插件
call plug#begin(g:plugins_install_path)
LoadScript plug_list.vim
call plug#end()

LoadScript base.vim
LoadScript theme.vim
LoadScript keymap.vim

" 依据插件名字载入对应的插件配置
function s:source_config(plugin_name) abort
    let l:config_path = g:plugins_config_root_path . a:plugin_name . ".vim"
    if filereadable(l:config_path)
        exec 'source' fnameescape(l:config_path)
    endif
endfunction

" TODO 从plug.vim中寻找何时载入插件
" 载入插件配置
for [plugin_name, plugin_config] in items(g:plugs)
    if g:HasInstall(plugin_name)
        call s:source_config(plugin_name)
    endif
endfor
