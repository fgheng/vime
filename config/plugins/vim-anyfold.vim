" set foldlevel=0                  " close all folds or
set foldlevel=99                   " Open all folds
let g:anyfold_fold_comments=1
hi Folded term=underline

" 大文件
" activate anyfold by default
" augroup vime_anyfold_group
    " autocmd!
    " autocmd Filetype * AnyFoldActivate
" augroup END

" " disable anyfold for large files
" let g:LargeFile = 1000000 " file is large if size greater than 1MB
" function LargeFile()
"     augroup vime_anyfold
"         autocmd! " remove AnyFoldActivate
"         autocmd Filetype * setlocal foldmethod=indent " fall back to indent folding
"     augroup END
" endfunction
" autocmd BufReadPre,BufRead * let f=getfsize(expand("<afile>")) | if f > g:LargeFile || f == -2 | call LargeFile() | endif
