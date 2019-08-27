if HasPlug('jupyter-vim')
	if has('nvim')
		"let g:python3_host_prog = '~/Software/anaconda3/bin/python'
	else
		set pyxversion=3

		" OSX
		set pythonthreedll=/Library/Frameworks/Python.framework/Versions/3.6/Python

		" Windows
		set pythonthreedll=python37.dll
		set pythonthreehome=C:\Python37
	endif
	" Run current file
	nnoremap <buffer> <silent> <localleader>R :JupyterRunFile<CR>
	nnoremap <buffer> <silent> <localleader>I :JupyterImportThisFile<CR>

	" Change to directory of current file
	nnoremap <buffer> <silent> <localleader>d :JupyterCd %:p:h<CR>

	" Send a selection of lines
	nnoremap <buffer> <silent> <localleader>X :JupyterSendCell<CR>
	nnoremap <buffer> <silent> <localleader>E :JupyterSendRange<CR>
	nmap     <buffer> <silent> <localleader>e <Plug>JupyterRunTextObj
	vmap     <buffer> <silent> <localleader>e <Plug>JupyterRunVisual

	nnoremap <buffer> <silent> <localleader>U :JupyterUpdateShell<CR>

	" Debugging maps
	nnoremap <buffer> <silent> <localleader>b :PythonSetBreak<CR>
endif
