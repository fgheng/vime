if has('nvim')
	let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.6 } }
	let g:fzf_action = {
	\ 'ctrl-t': 'tab split',
	\ 'ctrl-x': 'split',
	\ 'ctrl-v': 'vsplit' }

	" [Buffers] Jump to the existing window if possible
	let g:fzf_buffers_jump = 1

	command! -bang -nargs=* Rg
	\ call fzf#vim#grep(
	\   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
	\   fzf#vim#with_preview(), <bang>0)

	command! -bang -nargs=? -complete=dir Files
		\ call fzf#vim#files(<q-args>, {'options': ['--info=inline', '--preview', 'cat {}']}, <bang>0)
		" \ call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--info=inline', '--preview', 'cat {}']}, <bang>0)

	nnoremap <M-f> :Files<CR>
	nnoremap <M-F> :Files $HOME<CR>
	nnoremap <M-b> :Buffers<CR>
	nnoremap <M-c> :Commands<CR>
	nnoremap <M-t> :BTags<CR>
	nnoremap <M-T> :Tags<CR>
	nnoremap <M-b> :Buffers<CR>
	nnoremap ? :BLines<CR>
	nnoremap <M-s> :Rg<CR>
	nnoremap <M-r> :History<CR>
	nnoremap <M-g> :GFiles?<CR>
	nnoremap <M-G> :GFiles<CR>
	nnoremap <M-m> :Marks<CR>

	au FileType fzf tnoremap <buffer> <C-j> <Down>
	au FileType fzf tnoremap <buffer> <C-k> <Up>
	au FileType fzf tunmap <buffer> <Esc>
endif
