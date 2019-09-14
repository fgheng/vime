nmap <leader>r :QuickRun<cr>
vmap <leader>r :QuickRun<cr>

let g:quickrun_config = {
	\   '_': {
	\ 'outputter/buffer/close_on_empty': 1,
	\ 'outputter/buffer/split': '10',
	\ 'outputter/buffer/into': 1,
	\ 'outputter/message/log': 1,
	\ }
	\}
