if HasPlug('eleline.vim')
	function! NearestMethodOrFunction() abort
		return get(b:, 'vista_nearest_method_or_function', '')
	endfunction

	set statusline+=%{NearestMethodOrFunction()}
	" By default vista.vim never run if you don't call it explicitly.
	"
	" If you want to show the nearest function in your statusline automatically,
	" you can add the following line to your vimrc
	autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
endif

let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
"let g:vista_default_executive = 'ctags'
" Ensure you have installed some decent font to show these pretty symbols, then you can enable icon for the kind.
let g:vista#renderer#enable_icon = 1

" The default icons can't be suitable for all the filetypes, you can extend it as you wish.
"let g:vista#renderer#icons = {
"\   "function": "\uf794",
"\   "variable": "\uf71b",
"\  }

" 获取进入vista之前的buf, window编号
let s:beforewinnr = -1

function! VistaToggle() abort
	let s:bufnr = bufnr('__vista__')
	let s:bufwinnr = bufwinnr(s:bufnr)

	" 缓冲区存在
	if  s:bufnr > -1
		" 缓冲区在某个窗口中显示
		if s:bufwinnr > -1
			" 当前正好在vista窗口中
			if winnr() == s:bufwinnr
				" 关闭窗口
				exec "Vista!"
				" 跳转回之前进入的窗口
				if s:beforewinnr > -1
					exec s:beforewinnr . "wincmd w"
				endif
			else
				let s:beforewinnr = winnr()
				" 跳转到窗口
				exec s:bufwinnr . "wincmd w"
			endif
		else
			" 没有在窗口中显示
			exec "Vista"
		endif
	else
		" 获取进入vista之前的buf, window编号
		let s:beforewinnr = winnr()
		echom s:beforewinnr
		" buf不存在
		exec "Vista"
	endif
endfunction

" nnoremap <F3> :call VistaToggle()<CR>
nnoremap <F3> :Vista!!<CR>
