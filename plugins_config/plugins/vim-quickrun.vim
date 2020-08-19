let g:quickrun_no_default_key_mappings = 1
" nmap <F4> :QuickRun<cr>
" vmap <F4> :QuickRun<cr>
" 需要增加函数，判断光标所在的窗口是否可以执行
nmap <F4> <Plug>(quickrun)<cr>
nmap <leader>r <Plug>(quickrun)
vmap <leader>r <Plug>(quickrun)

let g:quickrun_config = {
	\   '_': {
	\ 'outputter/buffer/close_on_empty': 0,
	\ 'outputter/buffer/split': '10',
	\ 'outputter/buffer/into': 1,
	\ 'outputter/message/log': 1,
	\ }
	\}
