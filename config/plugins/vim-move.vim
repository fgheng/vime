" 取消默认的按键映射
let g:move_map_keys = 0

" 我们只允许在visual模式下进行移动
" 因为normal模式下的alt-h alt-l已经被映射了
vmap <M-j> <Plug>MoveBlockDown
vmap <M-k> <Plug>MoveBlockUp
vmap <M-h> <Plug>MoveBlockLeft
vmap <M-l> <Plug>MoveBlockRight
