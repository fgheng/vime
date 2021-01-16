" 开启gitgutter
let g:gigutter_enable = 1
" 开启行高亮
let g:gitgutter_highlight_lines = 0
" 开启行号高亮
let g:gitgutter_highlight_linenrs = 1
" 关闭默认快捷键
let g:gitgutter_map_keys = 0
" 折叠相关
" set foldtext=gitgutter#fold#foldtext()
" 文件更改数量超过500将会压缩显示
let g:gitgutter_max_signs = 500
let g:gitgutter_preview_win_floating = 1

" 关闭column的提示符号
if common#functions#HasCocPlug('coc-git')
    let g:gitgutter_signs = 0
else
    let g:gitgutter_signs = 1
    let g:gitgutter_sign_added = '▎'
    let g:gitgutter_sign_modified = '▎'
    let g:gitgutter_sign_removed = '▎'
    let g:gitgutter_sign_removed_first_line = '▔'
    let g:gitgutter_sign_modified_removed = '▋'
endif

highlight link GitGutterAddLineNr SignifySignAdd
highlight link GitGutterChangeLineNr SignifySignChange
highlight link GitGutterDeleteLineNr SignifySignDelete
highlight link GitGutterChangeDeleteLineNr SignifySignDelete

" coc-git优先
if !common#functions#HasCocPlug('coc-git')
    " 导航到修改块
    nnoremap <leader>gj :GitGutterNextHunk<cr>
    nnoremap <leader>gk :GitGutterPrevHunk<cr>
    " 显示光标处的修改信息
    nnoremap <leader>gp :GitGutterPreviewHunk<cr>
    " 撤销当前块的修改
    nnoremap <leader>gu :GitGutterUndoHunk<cr>
    nnoremap <leader>gh :GitGutterStageHunk<cr>
endif
