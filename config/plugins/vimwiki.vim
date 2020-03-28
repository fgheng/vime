" vimwiki的路径
let g:vimwiki_path = g:wiki_path

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
