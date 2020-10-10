" 取消默认按键
let g:jupyter_mapkeys = 0
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

nnoremap <silent> <space>, :JupyterSendCount<cr><down>
vnoremap <silent> <space>, :JupyterSendRange<cr><down>

"" Run current file
"nnoremap <buffer> <silent> <leader>R :JupyterRunFile<CR>
"nnoremap <buffer> <silent> <leader>I :JupyterImportThisFile<CR>

"" Change to directory of current file
"nnoremap <buffer> <silent> <leader>d :JupyterCd %:p:h<CR>

"" Send a selection of lines
"nnoremap <buffer> <silent> <leader>X :JupyterSendCell<CR>
"nnoremap <buffer> <silent> <leader>E :JupyterSendRange<CR>
"nmap     <buffer> <silent> <leader>e <Plug>JupyterRunTextObj
"vmap     <buffer> <silent> <leader>e <Plug>JupyterRunVisual

"nnoremap <buffer> <silent> <leader>U :JupyterUpdateShell<CR>

"" Debugging maps
"nnoremap <buffer> <silent> <leader>b :PythonSetBreak<CR>
