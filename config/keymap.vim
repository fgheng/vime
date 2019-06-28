"------------------------------------------- base key map
inoremap jk <esc>
"nnoremap ;; <esc>:
" nnoremap q <esc>:close<cr>
" vnoremap q <esc>:close<cr>
nnoremap q <esc>:close<cr>
vnoremap q <esc>:close<cr>
nnoremap <BackSpace> :nohl<cr>

inoremap <M-h> <esc>I
inoremap <M-l> <esc>A
"inoremap <M-j> <down>
"inoremap <M-k> <up>

" inoremap <c-h> <esc>xi
" inoremap <c-l> <esc><right>xi
" inoremap <c-w>

" 窗口
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
" 更改窗口大小
nnoremap <C-w>[ :vertical resize -3<CR>
nnoremap <C-w>] :vertical resize +3<CR>
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
" 分割窗口
nnoremap <c-w>s <esc><c-w>s<esc><c-w>j
nnoremap <c-w>v <esc><c-w>v<esc><c-w>l
nnoremap <c-w>k :abo split <cr>
nnoremap <c-w>h :abo vsplit <cr>
nnoremap <c-w>j :rightbelow split <cr>
nnoremap <c-w>l :rightbelow vsplit <cr>

imap <C-s> <esc>:w<cr>
imap <M-o> <esc>o
imap <M-O> <esc>O

" buffer 操作
"nnoremap <C-c>  :bd<CR>
nnoremap <C-x>  :Bclose<CR>

noremap <space><space> <esc>:wal<cr>

nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

"tabline operation
nnoremap <leader>tn :tabnew<cr>
nnoremap <leader>te :tabedit
nnoremap <leader>tc :tabclose<cr>
nnoremap <leader>tm :tabmove
" gt gT
"nnoremap  <m-0> :tabnext<cr>
"nnoremap  <m-9> :tabprevious<CR>
"tnoremap  <m-0> <c-\><c-n>:tabnext<cr>
"tnoremap  <m-9> <c-\><c-n>:tabprevious<CR>

nnoremap  <M-l> :tabnext<cr>
nnoremap  <M-h> :tabprevious<CR>
tnoremap  <M-l> <c-\><c-n>:tabnext<cr>
tnoremap  <M-h> <c-\><c-n>:tabprevious<CR>

"yank to end
nnoremap Y y$

" terminal
tnoremap <Esc> <C-\><C-n>
tnoremap <c-j> <c-\><c-n><c-w>j
tnoremap <c-k> <c-\><c-n><c-w>k
tnoremap <c-l> <c-\><c-n><c-w>l
tnoremap <c-h> <c-\><c-n><c-w>h

"------------------------------------------- ale
if HasPlug('ale')
    nmap <silent> <space>{ <Plug>(ale_previous_wrap)
    nmap <silent> <space>} <Plug>(ale_next_wrap)
endif

"------------------------------------------- leaderf
if HasPlug('LeaderF')
    nnoremap <M-f> :LeaderfFile<CR>
    "nnoremap <M-t> :LeaderfBufTag<CR>
    "nnoremap <M-T> :LeaderfBufTagAll<CR>
    nnoremap <M-o> :LeaderfBufferAll<CR>
    "nnoremap <M-b> :LeaderfTabBufferAll<CR><TAB>
    nnoremap <M-s> :LeaderfLine<CR>
    nnoremap <M-S> :<C-U><C-R>=printf("Leaderf rg -S --fullPath %s", getcwd())<cr><cr>
    nnoremap <M-r> :LeaderfMru<CR>
endif

"------------------------------------------- fzf
if HasPlug('fzf')
    nnoremap <M-f> :Files<CR>
    "nnoremap <M-t> :BTags<CR>
    "nnoremap <M-T> :Tags<CR>
    nnoremap <M-o> :Buffers<CR>
    nnoremap <M-s> :BLines<CR>
    nnoremap <M-S> :Rg<CR>
    nnoremap <M-r> :History<CR>
    nnoremap <M-g> :GFiles?<CR>
    nnoremap <M-G> :GFiles<CR>
    nnoremap <M-m> :Marks<CR>
endif

"------------------------------------------- easymotion
if HasPlug('vim-easymotion')
    nmap gk <Plug>(easymotion-overwin-f)
    nmap gl <Plug>(easymotion-overwin-line)
    "imap <M-k> <esc><Plug>(easymotion-overwin-f)
    "imap <M-j> <esc><Plug>(easymotion-overwin-line)
    " nmap <Leader>w <Plug>(easymotion-overwin-w)
endif

"------------------------------------------- goyo
if HasPlug('goyo.vim')
    nnoremap <F7> <esc>:Goyo<cr>
    "setlocal nonumber
    "setlocal norelativenumber
endif

"------------------------------------------- ChooseWin
if HasPlug('vim-choosewin')
    nnoremap <silent> - :ChooseWin<CR>
endif

"------------------------------------------- Autoformat
if HasPlug('vim-autoformat')
    nnoremap <M-i> :Autoformat<cr>
endif

"------------------------------------------- matchtag
if HasPlug('MatchTagAlways')
    if &ft == 'html' || &ft == 'xhtml' || &ft == 'htm' || &ft == 'xml'
        nnoremap <space>5 :MtaJumpToOtherTag<cr>
    endif
endif

"------------------------------------------- vimtranslateme
if HasPlug('vim-translate-me')
    nmap <silent> <M-d> <Plug>TranslateW
    vmap <silent> <M-d> <Plug>TranslateWV
    nmap <silent> <Leader>r <Plug>TranslateR
    vmap <silent> <Leader>r <Plug>TranslateRV
endif

"------------------------------------------- mundo
if HasPlug('vim-mundo')
    map <F4> <esc>:MundoToggle<cr>
endif

"------------------------------------------- Startify
if HasPlug('vim-startify')
    noremap <leader>s <esc>:Startify<cr>
    "au FileType startify noremap q :q<cr>
endif

"-------------------------------------------- quickfix
" let g:quickfix_is_open = 0
" function! QuickfixToggle()
"      if g:quickfix_is_open
"         cclose
"         let g:quickfix_is_open = 0
"         execute g:quickfix_return_to_window . "wincmd w"
"     else
"         let g:quickfix_return_to_window = winnr()
"         copen
"         let g:quickfix_is_open = 1
"     endif
" endfunction

" nnoremap <F10> :call QuickfixToggle()<cr>


"-------------------------------------------- zoomwintab
if HasPlug('zoomwintab.vim')
    nnoremap  <c-w>o :ZoomWinTabToggle<cr>
endif

"-------------------------------------------- tagbar
if HasPlug('tagbar')
    nnoremap <F3> :TagbarToggle<cr>
    "inoremap <F3> <esc>:TagbarToggle<cr>
endif
