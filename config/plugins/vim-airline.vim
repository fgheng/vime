"let g:airline_theme='kolor'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1    " 打开buffer
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#tab_nr_type= 2
let g:airline#extensions#tabline#show_tab_type = 1
let g:airline#extensions#tabline#tabs_label = 'TABS'
let g:airline#extensions#tabline#left_alt_sep = '>'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#exclude_buffers = ["[defx]", "!", "vimfiler", "nnn"]

" 显示窗口号
function! WindowNumber(...)
	let builder = a:1
	let context = a:2
	call builder.add_section('airline_b', '%{tabpagewinnr(tabpagenr())}')
	return 0
endfunction

call airline#add_statusline_func('WindowNumber')
call airline#add_inactive_statusline_func('WindowNumber')

" coc
" 关闭airline的coc集成
let g:airline#extensions#coc#enabled = 0
if HasPlug('coc.nvim')
	let g:airline_section_x = '%{coc#status()}'
	"let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
	"let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'
endif

if  g:airline#extensions#tabline#enabled == 1
	nmap <M-h> <Plug>AirlineSelectPrevTab
	nmap <M-l> <Plug>AirlineSelectNextTab
endif
