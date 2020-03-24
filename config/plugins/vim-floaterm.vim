let g:floaterm_position='center'
let g:floaterm_rootmarkers=['.project', '.git', '.hg', '.svn', '.root', '.gitignore']

nmap <M-=> :FloatermToggle<cr>
tnoremap <M-=> <c-\><c-n>:FloatermToggle<cr>

nmap <leader>f :FloatermNew ranger<cr>
nmap <leader>g :FloatermNew lazygit<cr>
