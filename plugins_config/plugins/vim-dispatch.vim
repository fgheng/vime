nnoremap <leader>r :Dispatch<cr>
autocmd FileType java let b:dispatch = 'javac %'
autocmd FileType python let b:dispatch = 'python %'
autocmd FileType base let b:dispatch = 'sh %'
autocmd FileType javascript let b:dispatch = 'nodejs %'
