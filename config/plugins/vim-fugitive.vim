function! GitBlameToggle()
	if &ft ==? 'fugitiveblame'
		exec "normal gq"
	else
		exec "Gblame"
	endif
endfunction

let g:fugitive_val_diff_split = 0
function! GitDiffToggle()
	" 先保存当前的文件名称
	let fgn = expand("%:t")

endfunction

let g:fugitive_val_log_open = 0
let g:fugitive_val_lot_from_buffer = ''
function! GlogToggle()
	if g:fugitive_val_log_open
		cclose
		let g:fugitive_val_log_open = 0
		exec g:fugitive_val_log_return_to_window . "wincmd w"
	else
		let g:fugitive_val_lot_from_buffer = bufname("p")
		let g:fugitive_val_log_return_to_window = winnr()
		exec "0Glog"
		let g:fugitive_val_log_open = 1
	endif
endfunction

nmap gs <esc>:Gdiffsplit<cr>
nmap gb <esc>:call GitBlameToggle()<cr>
nmap gl <esc>:call GlogToggle()<cr>
nmap gL <esc>:Gclog<cr>
