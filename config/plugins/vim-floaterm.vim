let g:floaterm_position='center'
let g:floaterm_width=0.8
let g:floaterm_height=0.6
let g:floaterm_rootmarkers=['.project', '.git', '.hg', '.svn', '.root', '.gitignore']
let g:floaterm_autoinsert=v:true

nmap <M-+> :FloatermNew<cr>
nmap <M-=> :FloatermToggle<cr>
tnoremap <M-+> <c-\><c-n>:FloatermNew<cr>
tnoremap <M-=> <c-\><c-n>:FloatermToggle<cr>

augroup my-floaterm
    autocmd!
    au FileType floaterm tnoremap <buffer> <M-h> <c-\><c-n>:FloatermPrev<CR>
    au FIleType floaterm tnoremap <buffer> <M-l> <c-\><c-n>:FloatermNext<CR>
    " au User Startified setlocal buflisted
augroup END
