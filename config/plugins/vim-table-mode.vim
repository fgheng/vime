" https://github.com/dhruvasagar/vim-table-mode
" 使用命令启动TableModeToggle
" 在插入模式输入|然后输入内容然后在输入|然后在输入内容|即可
let g:table_mode_corner='|' " 默认是+
" let g:table_mode_corner_corner='+'
" let g:table_mode_header_fillchar='='

function! s:isAtStartOfLine(mapping)
  let text_before_cursor = getline('.')[0 : col('.')-1]
  let mapping_pattern = '\V' . escape(a:mapping, '\')
  let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
  return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
endfunction

inoreabbrev <expr> <bar><bar>
          \ <SID>isAtStartOfLine('\|\|') ?
          \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
inoreabbrev <expr> __
          \ <SID>isAtStartOfLine('__') ?
          \ '<c-o>:silent! TableModeDisable<cr>' : '__'

" 格式化已有的table, 或者将一行转换为table,默认是空格分割
" 1. 选中，然后执行命令:tableize, 或者leadertt
" 2. tableize/;可以用;分割，或者leaderT

" 在格子间移动
" [| ]| {| }|

" 删除
" 删除行:leadert dd
" 删除列:leadert dc
