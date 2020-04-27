" fzf文件夹
let g:fzf_dir = $HOME.'/.cache/vim/fzf'

if has('nvim')
	let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.6 } }
endif

" 总是开启预览
let g:fzf_preview_window = 'right:50%'

" 进肯跳转到buffer所在的窗口
" let g:fzf_buffers_jump = 1

" fzf history 文件
let g:fzf_history_dir = g:fzf_dir . "/fzf-history"

" ref https://github.com/junegunn/fzf.vim/issues/379
function! s:SystemExecute(lines)
	for line in a:lines
		exec 'silent !xdg-open ' . fnameescape(line) . ' > /dev/null'
	endfor
endfunction

function! s:DeleteBuffer(lines)
    for line in a:lines
        exec 'bd ' . line
    endfor
endfunction

let g:fzf_action = {
	\ 'ctrl-t': 'tab split',
	\ 'ctrl-s': 'split',
	\ 'ctrl-v': 'vsplit',
	\ 'ctrl-x': function('s:SystemExecute'),
\ }
"\ 'ctrl-w': function('s:DeleteBuffer'),

function! s:RipgrepFzfWithWiki(query, fullscreen)
	let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s %s || true'

	if &ft ==? 'vimwiki' && match(expand('%:p'), expand(g:vimwiki_path)) > -1
		let wiki_path = g:vimwiki_path
	else
		let wiki_path = ""
	endif

	let initial_command = printf(command_fmt, shellescape(a:query), wiki_path)
	let reload_command = printf(command_fmt, '{q}', wiki_path)
	let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}

	call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction
command! -nargs=* -bang RGWithWiki call s:RipgrepFzfWithWiki(<q-args>, <bang>0)

function! s:FilesWithWiki(query, fullscreen)
	if empty(a:query) && &ft ==? 'vimwiki' && match(expand('%:p'), expand(g:vimwiki_path)) > -1
		call fzf#vim#files(g:vimwiki_path, {'options': ['--info=inline', '--preview', 'cat {}']}, a:fullscreen)
	else
		call fzf#vim#files(a:query, {'options': ['--info=inline', '--preview', 'cat {}']}, a:fullscreen)
	endif
endfunction
command! -bang -nargs=? -complete=dir FWW call s:FilesWithWiki(<q-args>, <bang>0)

command! -bang -nargs=? -complete=dir Files
\ call fzf#vim#files(<q-args>, {'options': ['--info=inline', '--preview', 'cat {}']}, <bang>0)

command! -bang -nargs=* GGrep
\ call fzf#vim#grep(
\   'git grep --line-number '.shellescape(<q-args>), 0,
\   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)

nnoremap <M-f> :FWW<CR>
nnoremap <M-F> :FWW $HOME<CR>
nnoremap <M-b> :Buffers<CR>
nnoremap <M-c> :Commands<CR>
nnoremap <M-t> :BTags<CR>
nnoremap <M-T> :Tags<CR>
" 使用rg搜索工作目录
nnoremap <M-s> :RGWithWiki<CR>
" 模糊搜索所有buffer
nnoremap ? :Lines<CR>
nnoremap <M-r> :History<CR>
nnoremap <M-m> :Marks<CR>
nnoremap <M-M> :Maps<CR>
nnoremap <M-w> :Windows<CR>
nnoremap <M-g> :GFiles?<CR>
nnoremap <M-G> :GFiles<CR>

nnoremap gm :BCommits<cr>
nnoremap gM :Commits<cr>

au FileType fzf tnoremap <buffer> <C-j> <Down>
au FileType fzf tnoremap <buffer> <C-k> <Up>
au FileType fzf tunmap <buffer> <Esc>
