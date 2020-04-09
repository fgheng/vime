let g:floaterm_position='center'
let g:floaterm_width=0.8
let g:floaterm_height=0.6
let g:floaterm_rootmarkers=['.project', '.git', '.hg', '.svn', '.root', '.gitignore']
let g:floaterm_autoinsert=v:true

nmap <M-+> :FloatermNew<cr>
nmap <M-=> :FloatermToggle<cr>
tnoremap <M-+> <c-\><c-n>:FloatermNew<cr>
tnoremap <M-=> <c-\><c-n>:FloatermToggle<cr>

function s:changeFlt(direction)
    if &ft == "floaterm"
        exec "normal <c-\><c-n>"
        if a:direction ==? "left"
            exec "FloatermPrev"
        elseif a:direction ==? "right"
            exec "FloatermNext"
        endif
    endif
endfunction
au FileType floaterm tnoremap <M-h> <c-\><c-n>:FloatermPrev<CR>
au FIleType floaterm tnoremap <M-l> <c-\><c-n>:FloatermNext<CR>

nmap <leader>f :FloatermNew ranger<cr>
nmap <leader>g :FloatermNew lazygit<cr>
