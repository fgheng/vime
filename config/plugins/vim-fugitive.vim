" 添加当前文件到index
nnoremap <leader>gw <esc>:Gwrite<cr>
" 提交
nnoremap <leader>gc <esc>:Git commit<cr>
" 恢复当前文件到上个版本
nnoremap <leader>gr <esc>:Gread<cr>
" 显示提交日志
nnoremap <leader>gl <esc>:Git log<cr>
" 显示当前git状态
nnoremap <leader>gg <esc>:Git<cr>

if !common#functions#HasPlug("vgit.nvim")
    " 查看当前文件与提交文件的不同
    nnoremap <leader>gd <esc>:Gvdiffsplit<cr>
    nnoremap <leader>gb <esc>:Git blame<cr>
endif
