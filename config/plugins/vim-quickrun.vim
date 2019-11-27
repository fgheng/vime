let g:quickrun_no_default_key_mappings = 1
" nmap <F4> :QuickRun<cr>
" vmap <F4> :QuickRun<cr>
nmap <leader>r <Plug>(quickrun)
vmap <leader>r <Plug>(quickrun)
noremap <F5> <Plug>(quickrun)

let g:quickrun_config = {
	\   '_': {
	\ 'outputter/buffer/close_on_empty': 1,
	\ 'outputter/buffer/split': '10',
	\ 'outputter/buffer/into': 1,
	\ 'outputter/message/log': 1,
	\ }
	\}
