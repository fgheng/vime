
" 一些可能需要到的全局配置都放到这里
" 包括一些插件的

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
" 撤销记录目录
let g:undo_dir = g:cache_root_path . 'undo/'

" tmux配置文件目录
let g:tmux_config_path = $HOME . '/.tmux.conf'

" 脚本目录
let g:scripts_path = g:vim_root_path . "/scripts"
