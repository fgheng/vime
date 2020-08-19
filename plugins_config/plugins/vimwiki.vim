" vimwiki的路径
let g:vimwiki_path = $HOME.'/Documents/wiki'

" TODO 判断vimwiki_path是否存在
let g:vimwiki_list = [
			\ {
			\ 'path': g:vimwiki_path,
			\ 'path_html': g:vimwiki_path.'wiki_html',
			\ 'syntax': 'markdown',
			\ 'auto_toc': 1,
			\ 'ext':'.md'
			\ }
			\ ]

nmap <leader>ww <esc>:<c-u>VimwikiIndex<cr>
nmap <leader>wt <esc>:<c-u>VimwikiTabIndex<cr>
nmap <leader>wi <esc>:<c-u>VimwikiDiaryIndex<cr>

au FileType markdown setl colorcolumn=0
