let g:floaterm_position='center'
let g:floaterm_width=0.8
let g:floaterm_height=0.6
let g:floaterm_rootmarkers=['.project', '.git', '.hg', '.svn', '.root', '.gitignore']
let g:floaterm_autoinsert=v:true

nmap <M-+> :FloatermNew<cr>
nmap <M-=> :FloatermToggle<cr>
tnoremap <M-+> <c-\><c-n>:FloatermNew<cr>
tnoremap <M-=> <c-\><c-n>:FloatermToggle<cr>
tnoremap <M-h> <c-\><c-n>:FloatermPrev<CR>
tnoremap <M-l> <c-\><c-n>:FloatermNext<CR>

nmap <leader>f :FloatermNew ranger<cr>
nmap <leader>g :FloatermNew lazygit<cr>

au FileType floaterm noremap <c-h>
au FileType floaterm noremap <c-j>
au FileType floaterm noremap <c-k>
au FileType floaterm noremap <c-l>
au FileType floaterm noremap <M-H>
au FileType floaterm noremap <M-J>
au FileType floaterm noremap <M-K>
au FileType floaterm noremap <M-L>

au BufLeave floaterm noremap <c-h> <C-w>h
au BufLeave floaterm noremap <c-j> <C-w>j
au BufLeave floaterm noremap <c-k> <C-w>k
au BufLeave floaterm noremap <c-l> <C-w>l
au BufLeave floaterm noremap <M-H> <C-w>h
au BufLeave floaterm noremap <M-J> <C-w>j
au BufLeave floaterm noremap <M-K> <C-w>k
au BufLeave floaterm noremap <M-L> <C-w>l
