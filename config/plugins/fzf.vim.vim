" fzf文件夹
let g:fzf_dir = $HOME.'/.cache/vim/fzf'
" fzf history 文件
let g:fzf_history_dir = g:fzf_dir . "/fzf-history"

" 输入框在顶部
let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'
let $FZF_DEFAULT_COMMAND="rg --files --hidden"

if has('nvim')
    let g:fzf_layout = {
        \ 'window': {
            \ 'up': '~90%', 'width': 0.6, 'height': 0.8, 'yoffset':0.5,
            \ 'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp'
        \ }
    \ }
endif

" 配色与主题同色
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" 总是开启预览
let g:fzf_preview_window = 'up:40%'

" ref https://github.com/junegunn/fzf.vim/issues/379
" 使用系统应用打开文件
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

" regrep检索
function! s:RipgrepFzfWithWiki(query, fullscreen)
    let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s %s || true'

    " 这个是在安装了vimwiki插件后使用的功能，需要配置一下g:vimwiki_path路径
    if &ft ==? 'vimwiki' && match(expand('%:p'), expand(g:vimwiki_path)) > -1
        let wiki_path = g:vimwiki_path
    else
        let wiki_path = ""
    endif

    let initial_command = printf(command_fmt, shellescape(a:query), wiki_path)
    let reload_command = printf(command_fmt, '{q}', wiki_path)
    let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command, '--preview-window=up:40%:wrap']}

    call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction
command! -nargs=* -bang RGWithWiki call s:RipgrepFzfWithWiki(<q-args>, <bang>0)

" 文件搜索
function! s:FilesWithWiki(query, fullscreen)
    let spec = {'options': ['--info=inline', '--preview', 'cat {}', '--preview-window=up:40%:wrap']}

    if empty(a:query) && &ft ==? 'vimwiki' && match(expand('%:p'), expand(g:vimwiki_path)) > -1
        call fzf#vim#files(g:vimwiki_path, spec, a:fullscreen)
    else
        call fzf#vim#files(a:query, spec, a:fullscreen)
    endif
endfunction
command! -bang -nargs=? -complete=dir FWW call s:FilesWithWiki(<q-args>, <bang>0)

command! -bang -nargs=? -complete=dir Files
\ call fzf#vim#files(<q-args>, {'options': ['--info=inline', '--preview', 'cat {}', '--previw-window:up:40%:wrap']}, <bang>0)

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
nnoremap ? :BLines<CR>
nnoremap <M-r> :History<CR>
nnoremap <M-m> :Marks<CR>
nnoremap <M-M> :Maps<CR>
nnoremap <M-w> :Windows<CR>

nnoremap <M-g> :BCommits<cr>
nnoremap <M-G> :Commits<cr>

nnoremap <leader>gf :GFiles?<CR>
nnoremap <leader>gF :GFiles<CR>

au FileType fzf tnoremap <buffer> <C-j> <Down>
au FileType fzf tnoremap <buffer> <C-k> <Up>
au FileType fzf tunmap <buffer> <Esc>
