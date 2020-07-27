let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#tab_nr_type= 2
let g:airline#extensions#tabline#show_tab_type = 1
let g:airline#extensions#tabline#tabs_label = 'TABS'
let g:airline#extensions#tabline#left_alt_sep = '>'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#exclude_buffers = ["[defx]", "!", "vimfiler", "nnn", "vista"]

" 显示窗口号
function! WindowNumber(...)
	let builder = a:1
	let context = a:2
	call builder.add_section('airline_b', '%{tabpagewinnr(tabpagenr())}')
	return 0
endfunction

call airline#add_statusline_func('WindowNumber')
call airline#add_inactive_statusline_func('WindowNumber')

" 关闭airline的coc集成
let g:airline#extensions#coc#enabled = 0
if g:HasPlug('coc.nvim')
	let g:airline_section_x = '%{coc#status()}'
endif

if  g:airline#extensions#tabline#enabled == 1
	nmap <M-h> <Plug>AirlineSelectPrevTab
	nmap <M-l> <Plug>AirlineSelectNextTab
else
    nnoremap  <M-l> :tabnext<cr>
    nnoremap  <M-h> :tabprevious<CR>
    tnoremap  <M-l> <c-\><c-n>:tabnext<cr>
    tnoremap  <M-h> <c-\><c-n>:tabprevious<CR>
endif
