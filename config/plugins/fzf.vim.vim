if exists('g:loaded_config_fzf_vim_vim')
    finish
endif
let g:loaded_config_fzf_vim_vim = 1

" fzf文件夹
let g:fzf_dir = g:root_path . '/fzf'
" fzf history 文件
let g:fzf_history_dir = g:fzf_dir . "/fzf-history"

" 输入框在顶部
let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'
let $FZF_DEFAULT_COMMAND="rg --files --hidden"

if has('nvim')
    " coc-fzf也使用这个变量
    let g:fzf_layout = {
        \ 'window': {
            \ 'up': '~90%', 'width': 0.6, 'height': 0.8, 'yoffset':0.5,
            \ 'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp'
        \ }
    \ }
endif

" 配色与主题同色
let g:fzf_colors = {
    \ 'fg':      ['fg', 'Folded'],
    \ 'bg':      ['bg', 'Normal'],
    \ 'hl':      ['fg', 'Number'],
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

" 预览窗口配置
let s:preview_window_config = 'up:40%:wrap'
" 总是开启预览
let g:fzf_preview_window = s:preview_window_config
let s:preview_window = '--preview-window=' . s:preview_window_config
" 自定义窗口预览程序
let s:preview_program = g:config_root_path . "/scripts/preview.sh"

let g:fzf_buffers_jump = 1
" [Commands] --expect expression for directly executing the command
" let g:fzf_commands_expect = 'alt-enter,ctrl-x'

au FileType fzf tnoremap <buffer> <C-j> <Down>
au FileType fzf tnoremap <buffer> <C-k> <Up>
au FileType fzf tunmap <buffer> <Esc>

" ref https://github.com/junegunn/fzf.vim/issues/379
" 使用系统应用打开文件
function! s:SystemExecute(lines)
    for line in a:lines
        exec 'silent !xdg-open ' . fnameescape(line) . ' > /dev/null'
    endfor
endfunction

function! s:DeleteBuffer(lines)
    for l:line in a:lines
        " exec 'bd ' . line
    endfor
endfunction

let g:fzf_action = {
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-x': 'split',
    \ 'ctrl-v': 'vsplit',
    \ 'alt-o': function('s:SystemExecute'),
\ }

" 内容检索
function! s:RipgrepFzfWithWiki(query, fullscreen)
    let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s %s || true'

    " 这个是在安装了vimwiki插件后使用的功能，需要配置一下g:vimwiki_path路径
    if &ft ==? 'vimwiki' && match(expand('%:p'), expand(g:vimwiki_path)) > -1 | let wiki_path = g:vimwiki_path
    else | let wiki_path = "" | endif

    let initial_command = printf(command_fmt, shellescape(a:query), wiki_path)
    let reload_command = printf(command_fmt, '{q}', wiki_path)
    let spec = {'options': [
                \ '--phony',
                \ '--query', a:query,
                \ '--bind', 'change:reload:'.reload_command,
                \ '--preview', s:preview_program . ' {}',
                \ s:preview_window
                \ ]}

    call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction
command! -nargs=* -bang GrepWithWiki call s:RipgrepFzfWithWiki(<q-args>, <bang>0)

" 文件检索
function! s:FilesWithWiki(query, fullscreen)
    let spec = {'options': [
                \ '--info=inline',
                \ '--preview', s:preview_program . ' {}',
                \ s:preview_window
                \ ]}

    if empty(a:query) && &ft ==? 'vimwiki' && match(expand('%:p'), expand(g:vimwiki_path)) > -1
        call fzf#vim#files(g:vimwiki_path, spec, a:fullscreen)
    else
        call fzf#vim#files(a:query, spec, a:fullscreen)
    endif
endfunction
command! -bang -nargs=? -complete=dir FWW call s:FilesWithWiki(<q-args>, <bang>0)

" quickfix 与 locallist
" copied from fzf_quickfix
function! s:error_type(type, nr) abort
    if a:type ==? 'W' | let l:msg = ' warning'
    elseif a:type ==? 'I' | let l:msg = ' info'
    elseif a:type ==? 'E' || (a:type ==# "\0" && a:nr > 0) | let l:msg = ' error'
    elseif a:type ==# "\0" || a:type ==# "\1" | let l:msg = ''
    else | let l:msg = ' ' . a:type | endif

    if a:nr <= 0 | return l:msg | endif

    return printf('%s %3d', l:msg, a:nr)
endfunction

function! s:format_error(item) abort
    return (a:item.bufnr ? bufname(a:item.bufnr) : '')
            \ . ':' . (a:item.lnum  ? a:item.lnum : '')
            \ . ':' . (a:item.col ? ' col ' . a:item.col : '')
            \ . ' | ' . s:error_type(a:item.type, a:item.nr)
            \ . ' | ' . substitute(a:item.text, '\v^\s*', ' ', '')
endfunction

function! s:quickfix_syntax() abort
    if has('syntax') && exists('g:syntax_on')
        " syntax match fzfQfFileName '^[^|]*' nextgroup=fzfQfSeparator
        " syntax match fzfQfSeparator '|' nextgroup=fzfQfLineNr contained
        " syntax match fzfQfLineNr '[^|]*' contained contains=fzfQfError,fzfQfWarning
        syntax match fzfQfError 'error' contained
        syntax match fzfQfWarning 'warning' contained

        " highlight default link fzfQfFileName Directory
        " highlight default link fzfQfLineNr LineNr
        highlight default link fzfQfError Error
        highlight default link fzfQfWarning WarningMsg
    endif
endfunction

function! s:quickfix_handler(err) abort
    let l:err_list = split(a:err, '|')
    let l:fn_ln = split(l:err_list[0], ':')
    let l:file_name = l:fn_ln[0]
    let l:line = ""
    let l:col = 0
    if len(l:fn_ln) == 2
        let l:line = l:fn_ln[1]
    elseif len(l:fn_ln) == 3
        let l:line = l:fn_ln[1]
        let l:col  = l:fn_ln[2]
    endif

    if bufnr(l:file_name) != bufnr("%")
        execute 'buffer'.bufnr(l:file_name)
    endif

    if !empty(l:line) && str2nr(l:line) > -1
        call cursor(str2nr(l:line), str2nr(l:col))
    else | return | endif
    normal! zvzz
    return
endfunction

" TODO 编写高亮
function! s:FzfQuickfix(...) abort
    call fzf#run(fzf#wrap({
            \ 'source': map(a:1 ? getloclist(0) : getqflist(), 's:format_error(v:val)'),
            \ 'sink': function('s:quickfix_handler'),
            \ 'options': [
                \ (a:1 ? '--prompt=LocList' : '--prompt=QfList'),
                \ '--info=inline',
                \ '--preview', s:preview_program . ' {1}',
                \ s:preview_window
            \ ],
            \ }))
    " if !exists('g:fzf_quickfix_syntax_on') | call s:quickfix_syntax() | endif
endfunction
command! FzfQuickfix  call s:FzfQuickfix(0)
command! FzfLocationList  call s:FzfQuickfix(1)

" jumps
" TODO 思考下逻辑，是否可以化简
" TODO 增加颜色
" TODO 定位当前所在的位置而不是总是置顶
" TODO 学习正则匹配内容
function! s:jump_list_format(val) abort
    " val is a string: id line col content
    " let l:file_name = bufname('%')
    let l:file_name = expand("%:p")
    let l:curpos = getcurpos()
    let l:content = ""

    let l:val_list = split(a:val)
    let l:length = len(l:val_list)

    if l:val_list[0] ==? '>'
        if l:length < 4
            let l:line = l:curpos[1]
            let l:col = l:curpos[2]
            let l:content = getline('.')
        elseif l:length == 4
            let l:line = l:val_list[2]
            let l:col = l:val_list[3]
            let l:content = getline(l:line, l:line)[0]
        elseif l:length > 4
            let l:line = l:val_list[2]
            let l:col = l:val_list[3]
            let l:content = a:val[16:]
        endif
    else
        if l:length < 4
            let l:line = l:val_list[1]
            let l:col = l:val_list[2]
            let l:content = getline(l:line, l:line)[0]
        elseif l:length == 4
            let l:line = l:val_list[1]
            let l:col = l:val_list[2]
            let l:content = l:val_list[3]
        else
            let l:line = l:val_list[1]
            let l:col = l:val_list[2]
            let l:content = a:val[16:]
        endif
    endif

    if filereadable(expand(l:content))
        let l:file_name = expand(l:content)
        let l:bn = bufnr(l:file_name)
        if l:bn > -1 && buflisted(l:bn) > 0
            let l:content = getbufline(l:bn, l:line)[0]
        else
            " let l:content = ""
            let l:content = system("sed -n " . l:line . "p " . l:file_name)
        endif
    endif
    return l:file_name . ":" . l:line . ":" . l:col . " " . l:content

endfunction

function! s:jump_list() abort
    let l:js = execute('jumps')
    return map(reverse(split(l:js, '\n')[1:]), 's:jump_list_format(v:val)')
endfunction

function! s:jump_handler(jp)
    let l:jump_rel = split(a:jp, ":")
    let l:line = l:jump_rel[1]
    let l:col  = l:jump_rel[2]
    let l:content = l:jump_rel[0]

    if empty(l:line) | return | endif
    " 判断文件是否已经存在buffer中
    let l:bn = bufnr(l:content)
    " 未打开
    if l:bn == -1 | if filereadable(l:content) | execute 'e ' . 'l:content' | endif
    else | execute 'buffer ' . l:bn | endif
    call cursor(str2nr(l:line), str2nr(l:col))
    normal! zvzz
endfunction

function! s:FzfJumps() abort
    call fzf#run(fzf#wrap({
            \ 'source': <sid>jump_list(),
            \ 'sink': function('s:jump_handler'),
            \ 'options': [
                \ '--prompt=Jumps',
                \ '--preview', s:preview_program . ' {1}',
                \ s:preview_window
            \ ],
            \ }))
endfunction
command! -bang -nargs=* FzfJumps call s:FzfJumps()

function! s:marks_list() abort
    let l:ms = execute('marks')
    return split(l:ms, '\n')[1:]
    " return map(split(l:ms, '\n')[1:], 's:marks_list_format(v:val)')
endfunction
function! s:marks_handler(mr) abort
    let l:marks_rel = split(a:mr)

    let l:file_name = expand('%:p')
    let l:line = l:marks_rel[1]
    let l:col = l:marks_rel[2]
    let l:content = ""

    if len(a:mr) > 15
        let l:content = a:mr[15:]
    endif

    if filereadable(expand(l:content))
        let l:file_name = expand(l:content)
    endif

    let l:bn = bufnr(l:file_name)
    if l:bn == -1 | if filereadable(l:file_name) | execute 'e ' . 'l:file_name' | endif
    else | execute 'buffer ' . l:bn | endif
    call cursor(str2nr(l:line), str2nr(l:col))
    normal! zvzz
endfunction

function! s:FzfMarks() abort
    call fzf#run(fzf#wrap({
            \ 'source': <sid>marks_list(),
            \ 'sink': function('s:marks_handler'),
            \ 'options': [
                \ '--prompt=Marks',
                \ '--preview', s:preview_program .  ' {4}:{2}',
                \ s:preview_window
            \ ],
            \ }))
endfunction
command! -bang -nargs=* FzfMarks call s:FzfMarks()

" git相关
" command! -bang -nargs=* GzgGitGrep
"\ call fzf#vim#grep('git grep --line-number '.shellescape(<q-args>),
"    \ 0,
"    \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0],
command! -bang -nargs=? -complete=dir FzfGitFiles
\ call fzf#vim#grep('git ls-files --exclude-standard',
    \ 1,
    \ {'dir': systemlist('git rev-parse --show-toplevel')[0],
    \ 'options': [
        \ '--info=inline',
        \ '--preview', s:preview_program . ' {}',
        \ s:preview_window
    \ ],
    \ 'sink': 'e'}, <bang>0)

let s:FzfGitStatusPreviewCommand =
    \ '[[ $(git diff -- {-1}) != "" ]] && git diff --color=always -- {-1} || ' .
    \ '[[ $(git diff --cached -- {-1}) != "" ]] && git diff --cached --color=always -- {-1} || '
command! -bang -nargs=? -complete=dir FzfGitStatus
\ call fzf#vim#grep('git -c color.status=always status --short --untracked-files=all',
    \ 1,
    \ {'options': [
        \ '--info=inline',
        \ '--preview', s:FzfGitStatusPreviewCommand . ' {}',
        \ s:preview_window
    \ ],
    \ 'sink': 'e'}, <bang>0)


" 自定义快捷键
nnoremap <M-f> :FWW<CR>
nnoremap <M-F> :FWW $HOME<CR>
nnoremap <M-b> :Buffers<CR>
if g:HasPlug('vista.vim')
    let g:vista_fzf_preview = ['up:40%']
    noremap <M-t> :Vista finder<CR>
else
    nnoremap <M-t> :BTags<CR>
    nnoremap <M-T> :Tags<CR>
endif
nnoremap <M-s> :GrepWithWiki<CR>
" 模糊搜索所有buffer
nnoremap ? :BLines<CR>
"TODO *检索当前单词
" nnoremap * :BLines expand('<cword>')<CR>
nnoremap <M-r> :History<CR>
" TODO 增加changes 需要自定义
" nnoremap <M-c> :Commands<CR>
" 如果coc-fzf支持marks的话就用coc-fzf+coc-bookmarks
nnoremap <M-m> :FzfMarks<CR>
" nnoremap <M-m> :Marks<CR>
nnoremap <M-M> :Maps<CR>
nnoremap <M-w> :Windows<CR>
if g:HasPlug('coc-fzf')
    nnoremap <M-y> :<c-u>CocFzfList yank<CR>
endif
" TODO 编写高亮
nnoremap <M-J> :FzfJumps<CR>
" quickfix与locationlist
" TODO 编写高亮
nnoremap <F8> :FzfQuickfix<CR>
nnoremap <F9> :FzfLocationList<CR>
" git
nnoremap <leader>gf :FzfGitFiles<CR>
nnoremap <leader>gs :FzfGitStatus<CR>
