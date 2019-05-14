" https://zhuanlan.zhihu.com/p/61036165
"
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
" " 这是一个特征，当你的光标不在那一行时，LaTex 代码会被替代或隐藏。通过隐藏 \[、\] 和$等标志符，你可以更舒服地浏览文件。这一特征也以∩替代\bigcap，以∈替代\in 等。
" set conceallevel=1
" let g:tex_conceal='abdmg'

if &ft == 'tex'
    echo 'okkkkkk'
    setlocal spell
    set spelllang=nl,en_gb
    inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
endif
