
augroup vime_neoformat_group
    " 保存时自动格式化
    autocmd!
    autocmd BufWritePre * undojoin | Neoformat
augroup END

command! -nargs=0 Format exec 'Neoformat'
