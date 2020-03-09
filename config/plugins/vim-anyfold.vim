filetype plugin indent on " required

autocmd Filetype * AnyFoldActivate               " activate for all filetypes
" or
"autocmd Filetype <your-filetype> AnyFoldActivate " activate for a specific filetype

" set foldlevel=0  " close all folds
" or
set foldlevel=99 " Open all folds
hi Folded term=underline

" 大文件
" activate anyfold by default
" augroup anyfold
"     autocmd!
"     autocmd Filetype * AnyFoldActivate
" augroup END

" " disable anyfold for large files
" let g:LargeFile = 1000000 " file is large if size greater than 1MB
" function LargeFile()
"     augroup anyfold
"         autocmd! " remove AnyFoldActivate
"         autocmd Filetype * setlocal foldmethod=indent " fall back to indent folding
"     augroup END
" endfunction
" autocmd BufReadPre,BufRead * let f=getfsize(expand("<afile>")) | if f > g:LargeFile || f == -2 | call LargeFile() | endif
