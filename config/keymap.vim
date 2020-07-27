" 快捷键配置

" 窗口
noremap <c-h> <C-w>h
noremap <c-j> <C-w>j
noremap <c-k> <C-w>k
noremap <c-l> <C-w>l
noremap <M-H> <C-w>h
noremap <M-J> <C-w>j
noremap <M-K> <C-w>k
noremap <M-L> <C-w>l
tnoremap <c-h> <c-\><c-n><c-w>h
tnoremap <c-j> <c-\><c-n><c-w>j
tnoremap <c-k> <c-\><c-n><c-w>k
tnoremap <c-l> <c-\><c-n><c-w>l
tnoremap <M-H> <c-\><c-n><C-w>h
tnoremap <M-J> <c-\><c-n><C-w>j
tnoremap <M-K> <c-\><c-n><C-w>k
tnoremap <M-L> <c-\><c-n><C-w>l

nnoremap q <esc>:close<cr>
vnoremap q <esc>:close<cr>
nnoremap <BackSpace> :nohl<cr>

" alt q执行宏录制功能
nnoremap <M-q> q
" esc
inoremap jk <esc>

if has('nvim')
    au TermOpen term://* tnoremap <buffer> <Esc> <c-\><c-n> | startinsert
    au BufEnter term://* startinsert
else
    au TerminalOpen term://* tnoremap <buffer> <Esc> <C-\><C-n> | startinsert
    " au BufEnter term://* startinsert
endif

" 新建终端
nnoremap <leader>tt :terminal<cr>

" 更改窗口垂直大小
nnoremap <M-_> :resize +3<CR>
nnoremap <M--> :resize -3<CR>
" 更改窗口水平大小
nnoremap <M-(> :vertical resize -3<CR>
nnoremap <M-)> :vertical resize +3<CR>

" 分割窗口
nnoremap <c-w>k :abo split <cr>
nnoremap <c-w>h :abo vsplit <cr>
nnoremap <c-w>j :rightbelow split <cr>
nnoremap <c-w>l :rightbelow vsplit <cr>

" 插入模式下的一些快捷键
inoremap <M-o> <esc>o
inoremap <M-O> <esc>O
inoremap <M-h> <esc>I
inoremap <M-l> <esc>A

" 保存
function! s:Wall() abort
    " 记录当前的tab以及window
    let tab = tabpagenr()
    let win = winnr()
    let seen = {}
    " 保存当前的buffer
    if !&readonly && expand("%") !=# ''
        let seen[bufnr('')] = 1
        write
    endif
    " 在每个标签页每个窗口执行
    tabdo windo if !&readonly && &buftype =~# '^\%(acwrite\)\=$' && expand('%') !=# '' && !has_key(seen, bufnr('')) | silent write | let seen[bufnr('')] = 1 | endif
    " 返回之前的tab和window
    execute 'tabnext '.tab
    execute win.'wincmd w'
endfunction
noremap <silent> <space><space> <esc>:call <SID>Wall()<cr>

nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" 复制到末尾
nnoremap Y y$

if !g:HasPlug('vim-airline')
    nnoremap  <M-l> :tabnext<cr>
    nnoremap  <M-h> :tabprevious<CR>
    tnoremap  <M-l> <c-\><c-n>:tabnext<cr>
    tnoremap  <M-h> <c-\><c-n>:tabprevious<CR>
endif

" 在后面新建一个tab
nnoremap <silent> <leader>tn :tabnew<cr>
nnoremap <silent> <leader>tc :tabclose<cr>
nnoremap <silent> <M-L> :tabmove +1<cr>
nnoremap <silent> <M-H> :tabmove -1<cr>
tnoremap <silent> <M-L> <c-\><c-n>:tabmove +1<cr>
tnoremap <silent> <M-H> <c-\><c-n>:tabmove -1<cr>

" TODO 改成在fzf中搜索系统应用，快捷键改成altx
function! s:SystemExecuteCurrentFile(f)
    if g:isWindows | echo
    else
        exec 'silent !xdg-open ' . fnameescape(a:f) . ' > /dev/null'
    endif
endfunction
" 使用系统应用打开当前buffer文件
noremap <silent> <c-x> :call <SID>SystemExecuteCurrentFile(expand('%:p'))<cr>
