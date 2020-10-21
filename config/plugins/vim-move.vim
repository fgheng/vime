" 插件配置需要放到config/plugins/下面
" 取消默认的按键
let g:move_map_keys = 0

" 只能在visual模式下使用移动
" 因为normal模式下的alt-h 和 alt-l已经被映射了
vmap <M-j> <Plug>MoveBlockDown
vmap <M-k> <Plug>MoveBlockUp
vmap <M-h> <Plug>MoveBlockLeft
vmap <M-l> <Plug>MoveBlockRight
