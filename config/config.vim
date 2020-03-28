" 各种自定义参数在这里

if HasPlug('vimwiki')
	" vimwiki的路径
	let g:vimwiki_path = $HOME."/Documents/wiki"
endif

if HasPlug('coc.nvim')
	" 设置coc的根目录
	let g:coc_data_home = $HOME."/.cache/vim/coc"
endif
