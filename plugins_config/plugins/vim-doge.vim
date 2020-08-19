" 选择注释风格
" Example:
" let g:doge_doc_standard_python = 'numpy'
" 如果想为buffer设定风格
" :let b:doge_doc_standard = 'numpy'
" 全部风格

" 不使用默认映射，vim-plug根据命令启动，启动速度更快
let g:doge_enable_mappings=0
" let g:doge_mapping='<leader>d'
nmap <leader>d :DogeGenerate<cr>

" 跳转
let g:doge_mapping_comment_jump_forward='<M-j>'
let g:doge_mapping_comment_jump_backward='<M-k>'

" 以交互方式跳转生成的注释中的所有TODO项目。
let g:doge_comment_interactive=1

" 到达起点或终点时，继续在占位符之间循环
let g:doge_comment_jump_wrap=1

" 为其他文件设置别名，vue用js的注释
let g:doge_filetype_aliases = {
\  'javascript': ['vue']
\}
