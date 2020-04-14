" 窗口
noremap <c-h> <C-w>h
noremap <c-j> <C-w>j
noremap <c-k> <C-w>k
noremap <c-l> <C-w>l
noremap <M-H> <C-w>h
noremap <M-J> <C-w>j
noremap <M-K> <C-w>k
noremap <M-L> <C-w>l
tnoremap  <c-h> <c-\><c-n><c-w>h
tnoremap  <c-j> <c-\><c-n><c-w>j
tnoremap  <c-k> <c-\><c-n><c-w>k
tnoremap  <c-l> <c-\><c-n><c-w>l

inoremap jk <esc>
nnoremap q <esc>:close<cr>
vnoremap q <esc>:close<cr>
" alt q执行宏录制功能
nnoremap <M-q> q
nnoremap <BackSpace> :nohl<cr>

" terminal
if has('nvim')
	au TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
else
	tnoremap <Esc> <C-\><C-n>
endif

" 更改窗口大小
nnoremap <M-{> :vertical resize -5<CR>
nnoremap <M-}> :vertical resize +5<CR>

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

noremap <space><space> <esc>:w<cr>

nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" 复制到末尾
nnoremap Y y$

" termina 使用alt h l
" function s:changeFlt(direction)
"     if HasPlug('vim-floaterm')
"         if &ft ==? "floaterm"
"             exec "normal <c-\><c-n>"
"             if a:direction ==? "left"
"                 exec "FloatermPrev"
"             elseif a:direction ==? "right"
"                 exec "FloatermNext"
"             endif
"         endif
"     else
"         if a:direction ==? "left"
"             if &bt ==? 'terminal'
"                 exec "normal <c-\><c-n>:tabnext<cr>"
"             else
"             endif
"         elseif a:direction ==? 'right'
"         endif
"     endif
" endfunction
if !HasPlug('vim-airline')
	nnoremap  <M-l> :tabnext<cr>
	nnoremap  <M-h> :tabprevious<CR>
	tnoremap  <M-l> <c-\><c-n>:tabnext<cr>
	tnoremap  <M-h> <c-\><c-n>:tabprevious<CR>
endif

function s:new_tab_before() abort
	exec "tabnew | -tabmove"
endfunction
" 在前面新建一个tab
nnoremap <silent> <leader>tN :call <SID>new_tab_before()<cr>
" 在后面新建一个tab
nnoremap <silent> <leader>tn :tabnew<cr>
nnoremap <silent> <leader>tc :tabclose<cr>
" nnoremap  <leader>tm :tabmove 1<cr>
" nnoremap  <leader>tM :tabmove -1<cr>

function! SystemExecuteCurrentFile(f)
	exec 'silent !xdg-open ' . fnameescape(a:f) . ' > /dev/null'
endfunction

" 使用系统应用打开文件
noremap <silent> <F6> :call SystemExecuteCurrentFile(expand('%:p'))<cr>
