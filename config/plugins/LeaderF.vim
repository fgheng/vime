" fzf优先
if !HasPlug('fzf.vim')
	highlight Lf_hl_rgHighlight guifg=#FFFF00 guibg=NONE ctermfg=yellow ctermbg=NONE
	highlight Lf_hl_match gui=bold guifg=Red cterm=bold ctermfg=21
	highlight Lf_hl_matchRefine  gui=bold guifg=Magenta cterm=bold ctermfg=201

	let g:Lf_HideHelp = 1
	let g:Lf_UseCache = 0
	let g:Lf_UseVersionControlTool = 0
	let g:Lf_IgnoreCurrentBufferName = 1
	" popup mode
	let g:Lf_WindowPosition = 'popup'
	let g:Lf_PreviewInPopup = 1
	let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }
	let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }

	nnoremap <M-f> :LeaderfFile<CR>
	nnoremap <M-F> :LeaderfFunctionAll<CR>
	noremap <M-b> :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
	noremap <M-r> :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
	noremap <M-t> :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
	noremap <M-T> :LeaderfBufTagAll<cr>
	nnoremap ? :LeaderfLine<CR>
	xnoremap ? :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR><cr>
	nnoremap <M-s> :LeaderfLineAll<CR>
	noremap <M-w> :<C-U><C-R>=printf("Leaderf! rg --current-buffer -e %s ", expand("<cword>"))<CR><cr>
	noremap <M-W> :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR><cr>
	noremap <M-c> :LeaderfCommand<cr>

	let g:Lf_GtagsAutoGenerate = 0
	let g:Lf_Gtagslabel = 'native-pygments'
endif
