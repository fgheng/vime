
let g:vimwiki_list = [
			\ {
			\ 'path': '$HOME/Documents/wiki',
			\ 'path_html': '$HOME/Documents/wiki/wiki_html',
			\ 'syntax': 'markdown',
			\ 'auto_toc': 1,
			\ 'ext':'.md'
			\ }
			\ ]

" noremap <leader>ww :VimwikiIndex<cr>
" noremap <leader>w<leader>w :VimwikiDiaryIndex<cr>
"

if HasPlug("fzf.vim")
	" fzf搜索wiki
	function! RipgrepFzf(query, fullscreen)
		let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s %s || true'
		let initial_command = printf(command_fmt, shellescape(a:query), g:vimwiki_list[0].path)
		let reload_command = printf(command_fmt, '{q}', g:vimwiki_list[0].path)
		let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
		call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
	endfunction

	command! -nargs=* -bang RGwiki call RipgrepFzf(<q-args>, <bang>0)
	nnoremap <M-S> :RGwiki<CR>
endif
