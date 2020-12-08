"-----------------------------------------------------------------------------
" 全局配置
"-----------------------------------------------------------------------------
if exists('g:loaded_config_fzf_vim_vim')
    finish
endif
let g:loaded_config_fzf_vim_vim = 1

" fzf文件夹
let g:fzf_dir = g:cache_root_path . '/fzf'
" fzf history 文件
let g:fzf_history_dir = g:fzf_dir . "/fzf-history"

" 输入框在顶部
let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'
let $FZF_DEFAULT_COMMAND = "rg --files --hidden"

" fzf外观
" coc-fzf也使用这个变量
let g:fzf_layout = {
    \ 'window': {
        \ 'up': '~90%', 'width': 0.6, 'height': 0.8, 'yoffset':0.5,
        \ 'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp'
    \ }
\ }

" 预览窗口配置
let s:preview_window_config = 'up:50%:wrap'
let s:preview_window = '--preview-window=' . s:preview_window_config
let g:fzf_preview_window = s:preview_window_config
" 自定义窗口预览程序
let s:preview_program = g:scripts_root_path . "/preview.sh"

" 如果存在buffer，那么跳转过去
let g:fzf_buffers_jump = 1

"-----------------------------------------------------------------------------
" 主题配置
"-----------------------------------------------------------------------------
" 配色与主题同色
" fg表示未选中行的前景色
" hl表示搜索到的文字的颜色
" fg+表示选中的行的前景色
" hl+表示选中的行的搜索文字颜色
let g:fzf_colors = {
    \ 'fg':      ['fg', 'Normal'],
    \ 'bg':      ['bg', 'Normal'],
    \ 'hl':      ['fg', 'Directory'],
    \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
    \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
    \ 'hl+':     ['fg', 'WarningMsg'],
    \ 'info':    ['fg', 'PreProc'],
    \ 'border':  ['fg', 'Ignore'],
    \ 'prompt':  ['fg', 'Conditional'],
    \ 'pointer': ['fg', 'Exception'],
    \ 'marker':  ['fg', 'Keyword'],
    \ 'spinner': ['fg', 'Label'],
    \ 'header':  ['fg', 'Comment'] }

"-----------------------------------------------------------------------------
" 使用ctrl jk上下移动选项
"-----------------------------------------------------------------------------
augroup vime_fzf_group
    autocmd!
    au FileType fzf tnoremap <buffer> <C-j> <Down>
    au FileType fzf tnoremap <buffer> <C-k> <Up>
    au FileType fzf tnoremap <buffer> <Esc> <c-g>
augroup END

"-----------------------------------------------------------------------------
" 一些函数
"-----------------------------------------------------------------------------
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
    \ 'ctrl-s': 'split',
    \ 'ctrl-v': 'vsplit',
    \ 'alt-x': function('s:SystemExecute'),
\ }

"-----------------------------------------------------------------------------
" 内容检索
"-----------------------------------------------------------------------------
function! s:RipgrepFzfWithWiki(query, fullscreen) abort
    let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s %s || true'

    " 这个是在安装了vimwiki插件后使用的功能，需要配置一下g:vimwiki_path路径
    if &ft ==? 'vimwiki' && match(expand('%:p'), expand(g:vimwiki_path)) > -1
        let l:path = g:vimwiki_path
    else
        let l:path = ""
    endif

    let initial_command = printf(command_fmt, shellescape(a:query), l:path)
    let reload_command = printf(command_fmt, '{q}', l:path)
    let spec = {'options': [
                \ '--phony',
                \ '--query', a:query,
                \ '--bind', 'change:reload:'.reload_command,
                \ '--preview', s:preview_program . ' {}',
                \ s:preview_window
                \ ]}

    call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

function! s:RipgrepFzfWithWikiVisual(fullscreen) abort range
    call s:RipgrepFzfWithWiki(common#functions#getVisualSelection(), a:fullscreen)
endfunction
" TODO 还需要优化，尽量合并成一个函数，通过参数来操作
command! -nargs=* -bang GrepWithWiki call s:RipgrepFzfWithWiki(<q-args>, <bang>0)
command! -range=% -bang  GrepWithWikiVisual <line1>,<line2>call s:RipgrepFzfWithWikiVisual(<bang>0)

"-----------------------------------------------------------------------------
" 文件检索
"-----------------------------------------------------------------------------
function! s:FilesWithWiki(query, fullscreen)
    let spec = {'options': [
                \ '--info=inline',
                \ '--preview', s:preview_program . ' {}',
                \ s:preview_window
                \ ]}

    if empty(a:query) && &ft ==? 'vimwiki' && match(expand('%:p'), expand(g:vimwiki_path)) > -1
        let l:path = g:vimwiki_path
    elseif a:query == ''
        let l:path = getcwd()
    else
        let l:path = a:query
    endif
    call fzf#vim#files(l:path, spec, a:fullscreen)
endfunction
command! -bang -nargs=? -complete=dir FWW call s:FilesWithWiki(<q-args>, <bang>0)

"-----------------------------------------------------------------------------
" quickfix 与 locallist
"-----------------------------------------------------------------------------
function! s:error_type(type, nr) abort
    if a:type ==? 'W' | let l:msg = ' warning'
    elseif a:type ==? 'I' | let l:msg = ' info'
    elseif a:type ==? 'E' || (a:type ==# "\0" && a:nr > 0) | let l:msg = ' error'
    elseif a:type ==# "\0" || a:type ==# "\1" | let l:msg = ''
    else | let l:msg = ' ' . a:type | endif

    if a:nr <= 0 | return l:msg | endif

    return printf('%s %3d', l:msg, a:nr)
endfunction

function! s:formatError(item) abort
    return (a:item.bufnr ? bufname(a:item.bufnr) : '')
            \ . ':' . (a:item.lnum  ? a:item.lnum : '')
            \ . ':' . (a:item.col ? ' col ' . a:item.col : '')
            \ . ' | ' . s:error_type(a:item.type, a:item.nr)
            \ . ' | ' . substitute(a:item.text, '\v^\s*', ' ', '')
endfunction

function! s:quickfixOrLocalListHandler(err) abort
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
function! s:FzfQuickfixOrLocalList(...) abort
    call fzf#run(fzf#wrap({
            \ 'source': map(a:1 ? getloclist(0) : getqflist(), 's:formatError(v:val)'),
            \ 'sink': function('<SID>quickfixOrLocalListHandler'),
            \ 'options': [
                \ (a:1 ? '--prompt=LocList' : '--prompt=QfList'),
                \ '--info=inline',
                \ '--preview', s:preview_program . ' {1}',
                \ s:preview_window
            \ ],
            \ }))
endfunction
command! FzfQuickfix  call <SID>FzfQuickfixOrLocalList(0)
command! FzfLocationList  call <SID>FzfQuickfixOrLocalList(1)

"-----------------------------------------------------------------------------
" jumps
"-----------------------------------------------------------------------------
" TODO 增加颜色
" TODO 定位当前所在的位置而不是总是置顶
" 当前jump所在的位置
" let s:jump_current_line = 0
function! s:jumpListFormat(val) abort
    let l:file_name = bufname('%')
    let l:file_name = empty(l:file_name) ? 'Unknown file name' : l:file_name
    let l:curpos = getcurpos()
    let l:l = matchlist(a:val, '\(>\?\)\s*\(\d*\)\s*\(\d*\)\s*\(\d*\) \?\(.*\)')
    let [l:mark, l:jump, l:line, l:col, l:content] = l:l[1:5]
    if empty(trim(l:mark)) | let l:mark = '-' | endif

    if filereadable(expand(fnameescape(l:content)))
        let l:file_name = expand(l:content)
        let l:bn = bufnr(l:file_name)
        if l:bn > -1 && buflisted(l:bn) > 0
            let l:content = getbufline(l:bn, l:line)
            let l:content = empty(l:content) ? "" : l:content[0]
        else
            let l:content = system("sed -n " . l:line . "p " . l:file_name)
        endif
    elseif empty(trim(l:content))
        if empty(trim(l:line))
            let [l:line, l:col] = l:curpos[1:2]
        endif
        let l:content = getline(l:line, l:line)[0]
    endif
    return l:mark . " " . l:file_name . ":" . l:line . ":" . l:col . " " . l:content
endfunction

function! s:jumpList() abort
    let l:jl = execute('jumps')
    return map(reverse(split(l:jl, '\n')[1:]), 's:jumpListFormat(v:val)')
endfunction

function! s:jumpHandler(jp)
    let l:l = matchlist(a:jp, '\(.\)\s\(.*\):\(\d\+\):\(\d\+\)\(.*\)')
    let [l:file_name, l:line, l:col, l:content] = l:l[2:5]

    if empty(l:file_name) || empty(l:line) | return | endif
    " 判断文件是否已经存在buffer中
    let l:bn = bufnr(l:file_name)
    " 未打开
    if l:bn == -1 | if filereadable(l:file_name) | execute 'e ' . 'l:file_name' | endif
    else | execute 'buffer ' . l:bn | endif
    call cursor(str2nr(l:line), str2nr(l:col))
    normal! zvzz
endfunction

function! s:FzfJumps() abort
    call fzf#run(fzf#wrap({
            \ 'source': s:jumpList(),
            \ 'sink': function('<SID>jumpHandler'),
            \ 'options': [
                \ '--prompt=Jumps',
                \ '--preview', s:preview_program . ' {2}',
                \ s:preview_window
            \ ],
            \ }))
endfunction
command! -bang -nargs=* FzfJumps call s:FzfJumps()


"-----------------------------------------------------------------------------
" marks
"-----------------------------------------------------------------------------
function! s:marksListFormat(val)
    let l:l = matchlist(a:val, '\s*\(.\)\s*\(\d\+\)\s*\(\d\+\)\(.*\)')
    let [l:mark, l:line, l:col, l:content] = l:l[1:4]

    let l:file_name = bufname('%')
    if filereadable(l:content)
        let l:file_name = l:content
        let l:bn = bufnr(l:file_name)
        if l:bn > -1 && buflisted(l:bn) > 0
            let l:content = getbufline(l:bn, l:line)[0]
        else
            let l:content = system("sed -n " . l:line . "p " . l:file_name)
        endif
    endif
    return l:mark . ' ' . l:file_name . ':' . l:line . ':' . l:col . ' ' . l:content
endfunction

function! s:marksList() abort
    let l:ms = execute('marks')
    return map(split(l:ms, '\n')[1:], '<SID>marksListFormat(v:val)')
endfunction

function! s:marksHandler(mr) abort
    let l:l = matchlist(a:mr, '\(.\)\s*\(.*\):\(\d\+\):\(\d\+\)\s*\(.*\)')
    let [l:mark, l:file_name, l:line, l:col, l:content] = l:l[1:5]

    let l:bn = bufnr(l:file_name)
    if l:bn == -1
        if filereadable(l:file_name) | execute 'e ' . l:file_name | endif
    else | execute 'buffer' . l:bn | endif
    call cursor(str2nr(l:line), str2nr(l:col))
    normal! zvzz
endfunction

function! s:FzfMarks() abort
    call fzf#run(fzf#wrap({
            \ 'source': s:marksList(),
            \ 'sink': function('<SID>marksHandler'),
            \ 'options': [
                \ '--prompt=Marks',
                \ '--preview', s:preview_program .  ' {2}',
                \ s:preview_window
            \ ],
            \ }))
endfunction
command! -bang -nargs=* FzfMarks call s:FzfMarks()


"-----------------------------------------------------------------------------
" buffer lines
"-----------------------------------------------------------------------------
function! s:blinesHandler(lines) abort
    if len(a:lines) < 2
        return
    endif
    execute split(a:lines, '\t')[0]
    normal! zvzz
endfunction

function! s:blinesList() abort
    let fmtexpr = 'printf("%4d\t%s", v:key + 1, v:val)'
    let lines = getline(1, '$')
    return map(lines, fmtexpr)
endfunction

function! s:FzfBLines(...) abort
    if a:0 == 0
        let l:query = ""
    else
        let l:query = a:1
    endif

    let l:cur_buf_name = expand('%')
    if empty(l:cur_buf_name)
        let l:preview = 'echo please save first to preview'
    else
        let l:preview = s:preview_program . ' ' . l:cur_buf_name . ':{1}'
    endif
    call fzf#run(fzf#wrap({
            \ 'source': s:blinesList(),
            \ 'sink': function('<SID>blinesHandler'),
            \ 'options': [
                \ '--prompt=BLines>',
                \ '--query', l:query,
                \ '--preview', l:preview,
                \ s:preview_window
            \ ],
            \ }))
endfunction
function s:FzfBLinesVisual() abort
    call s:FzfBLines(common#functions#getVisualSelection())
endfunction
command! -bang -nargs=* FzfBLines call s:FzfBLines()
command! -range=% -bang FzfBLinesVisual <line1>,<line2>call s:FzfBLinesVisual()

"-----------------------------------------------------------------------------
" yank depends on coc-yank
"-----------------------------------------------------------------------------

"-----------------------------------------------------------------------------
" register
"-----------------------------------------------------------------------------

"-----------------------------------------------------------------------------
" 自定义快捷键
"-----------------------------------------------------------------------------
nnoremap <M-f> :FWW<CR>
nnoremap <M-F> :FWW $HOME<CR>
nnoremap <M-b> :Buffers<CR>
if common#functions#HasPlug('vista.vim')
    let g:vista_fzf_preview = ['up:50%:wrap']
    noremap <M-t> :Vista finder<CR>
else
    nnoremap <M-t> :BTags<CR>
endif
nnoremap <M-T> :Tags<CR>
nnoremap <M-s> :GrepWithWiki<CR>
vnoremap <M-s> :GrepWithWikiVisual<CR>
" 模糊搜索当前buffer
nnoremap ? :FzfBLines<CR>
vnoremap ? :FzfBLinesVisual<CR>
nnoremap <M-r> :History<CR>
" TODO 增加changes 需要自定义
nnoremap <M-c> :Commands<CR>
" 如果coc-fzf支持marks的话就用coc-fzf+coc-bookmarks
nnoremap <M-m> :FzfMarks<CR>
" nnoremap <M-m> :Marks<CR>
nnoremap <M-M> :Maps<CR>
nnoremap <M-w> :Windows<CR>
if common#functions#HasPlug('coc-fzf')
    nnoremap <M-y> :<c-u>CocFzfList yank<CR>
endif
" TODO 编写高亮
nnoremap <M-J> :FzfJumps<CR>

" TODO 编写高亮
" quickfix与locationlist
nnoremap <F8> :FzfQuickfix<CR>
nnoremap <F9> :FzfLocationList<CR>
