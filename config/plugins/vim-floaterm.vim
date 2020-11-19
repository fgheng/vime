let g:floaterm_position='center'
let g:floaterm_width=0.8
let g:floaterm_height=0.6
let g:floaterm_rootmarkers=['.project', '.git', '.hg', '.svn', '.root', '.gitignore']
" let g:floaterm_autoinsert=v:false

nmap <silent> <M-+> :FloatermNew<cr>
nmap <silent> <M-=> :FloatermToggle<cr>
tnoremap <silent> <M-+> <c-\><c-n>:FloatermNew<cr>
tnoremap <silent> <M-=> <c-\><c-n>:FloatermToggle<cr>

augroup vime_floaterm_group
    autocmd!
    au FileType floaterm tnoremap <buffer> <silent> <M-h> <c-\><c-n>:FloatermPrev<CR>
    au FIleType floaterm tnoremap <buffer> <silent> <M-l> <c-\><c-n>:FloatermNext<CR>
augroup END
