" 载入个人配置
exec "source " . fnamemodify($MYVIMRC, ':h') . "/config.vim"

" 定义载入配置命令
command! -nargs=1 LoadScript exec 'source ' . g:config_root_path . '<args>'

" 载入基础配置
LoadScript base.vim
let custom_base_vim = g:config_root_path . "base.customized.vim"
if filereadable(custom_base_vim)
    LoadScript base.customized.vim
endif

" vim-plug 载入插件
call plug#begin(get(g:, 'plugins_install_path', '~/.vim/plugin/'))
    LoadScript layers.vim
    let custom_layers_vim = g:config_root_path . "layers.customized.vim"
    if filereadable(custom_layers_vim)
        LoadScript layers.customized.vim
    endif
call plug#end()

" 载入快捷键配置
LoadScript keymap.vim
let custom_keymap_vim = g:config_root_path . "keymap.customized.vim"
if filereadable(custom_keymap_vim)
    LoadScript keymap.customized.vim
endif
" 载入主题配置
LoadScript theme/theme.vim
LoadScript theme/statusline.vim
LoadScript theme/tabline.vim

" 依据插件名字载入对应的插件配置
function s:source_config(plugName) abort
    let l:config_path = g:plugins_config_root_path . a:plugName . ".vim"
    if filereadable(l:config_path)
        exec 'source' fnameescape(l:config_path)
    endif
    let l:customized_config_path = g:plugins_config_root_path . a:plugName . "customized.vim"
    if filereadable(l:customized_config_path)
        exec 'source' fnameescape(l:customized_config_path)
    endif
endfunction

" TODO 从plug.vim中寻找何时载入插件
" 载入插件配置
for [plugName, _] in items(g:plugs)
    if common#functions#HasInstall(plugName)
        call s:source_config(plugName)
    endif
endfor
