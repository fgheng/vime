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

" au FileType floaterm nunmap <c-h>
" au FileType floaterm nunmap <c-j>
" au FileType floaterm nunmap <c-k>
" au FileType floaterm nunmap <c-l>
" au FileType floaterm nunmap <M-H>
" au FileType floaterm nunmap <M-J>
" au FileType floaterm nunmap <M-K>
" au FileType floaterm nunmap <M-L>
