" 窗口相关快捷键
noremap <c-h> <C-w>h
noremap <c-j> <C-w>j
noremap <c-k> <C-w>k
noremap <c-l> <C-w>l
tnoremap <c-h> <c-\><c-n><c-w>h
tnoremap <c-j> <c-\><c-n><c-w>j
tnoremap <c-k> <c-\><c-n><c-w>k
tnoremap <c-l> <c-\><c-n><c-w>l
" 更改窗口垂直大小
nnoremap <M--> :resize +3<CR>
nnoremap <M-_> :resize -3<CR>
" 更改窗口水平大小
nnoremap <M-(> :vertical resize -3<CR>
nnoremap <M-)> :vertical resize +3<CR>
" 分割窗口
nnoremap <c-w>k :abo split <cr>
nnoremap <c-w>h :abo vsplit <cr>
nnoremap <c-w>j :rightbelow split <cr>
nnoremap <c-w>l :rightbelow vsplit <cr>
" 关闭窗口
nnoremap <silent> q <esc>:close<cr>
vnoremap <silent> q <esc>:close<cr>

" 关闭搜索颜色
nnoremap <BackSpace> :nohl<cr>

" 使用leader q执行宏录制功能
nnoremap <leader>q q
" jk表示esc
inoremap jk <esc>

" 使用esc退出终端
if has('nvim')
    au TermOpen term://* tnoremap <buffer> <Esc> <c-\><c-n> | startinsert
    au BufEnter term://* startinsert
else
    au TerminalOpen term://* tnoremap <buffer> <Esc> <C-\><C-n> | startinsert
    " au BufEnter term://* startinsert
endif

" 新建终端
nnoremap <leader>tt :terminal<cr>

" 插入模式下的一些快捷键
inoremap <M-o> <esc>o
inoremap <M-O> <esc>O
inoremap <M-h> <HOME>
inoremap <M-l> <END>
inoremap <c-h> <left>
inoremap <c-j> <down>
inoremap <c-k> <up>
inoremap <c-l> <right>

" 两个连续的space保存所有需要保存的文件
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

function! s:writeCurrent() abort
    if !&readonly && &buftype =~# '^\%(acwrite\)\=$' && expand('%') !=# ''
        silent write
    endif
endfunction
" noremap <silent> <space><space> <esc>:call <SID>Wall()<cr>
noremap <silent> <space><space> <esc>:call <SID>writeCurrent()<cr>

nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" 复制到末尾
nnoremap Y y$

" tab相关
function! s:tabOrBuf(direction) abort
    " 0 <- 1 ->
    if tabpagenr('$') > 1
        if a:direction == 0 | exec 'tabprevious'
        elseif a:direction == 1 | exec 'tabnext'
        endif
    else
        if a:direction == 0 | exec 'bprevious'
        elseif a:direction == 1 | exec 'bnext'
        endif
    endif
endfunction
if !g:HasPlug('vim-airline') && !g:HasPlug('vim-crystalline')
    nnoremap  <M-l> :call <SID>tabOrBuf(1)<cr>
    nnoremap  <M-h> :call <SID>tabOrBuf(0)<CR>
    tnoremap  <M-l> <c-\><c-n>:<SID>tabOrBuf(1)<cr>
    tnoremap  <M-h> <c-\><c-n>:<SID>tabOrBuf(0)<CR>
endif
nnoremap <silent> <leader>tn :tabnew<cr>
nnoremap <silent> <leader>tc :tabclose<cr>
nnoremap <silent> <M-L> :tabmove +1<cr>
nnoremap <silent> <M-H> :tabmove -1<cr>
tnoremap <silent> <M-L> <c-\><c-n>:tabmove +1<cr>
tnoremap <silent> <M-H> <c-\><c-n>:tabmove -1<cr>

" TODO 改成在fzf中搜索系统应用，快捷键改成altx
function! s:SystemExecuteCurrentFile(f)
    exec 'silent !xdg-open ' . fnameescape(a:f) . ' > /dev/null'
endfunction
" 使用系统应用打开当前buffer文件
noremap <silent> <M-x> :call <SID>SystemExecuteCurrentFile(expand('%:p'))<cr>
