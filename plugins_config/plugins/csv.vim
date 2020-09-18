" 使用所有行的最大宽度作为本列的最大宽度，默认是10000，即前10000行
let b:csv_arrange_user_all_rows = 1
" 对齐方式，r右对齐，l左对齐，c中心对齐，.小数对齐
" 一个元素代表一列使用*表示从当前到最后
"let b:csv_arrange_align = 'lc.l'
let b:csv_arrange_align = 'l*'
