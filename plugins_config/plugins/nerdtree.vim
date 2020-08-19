
" UI
let NERDTreeMinimalUI = 1 " 最小化显示，不显示?
let NERDChristmasTree = 1

if g:HasPlug('nerdtree-git-plugin')
    let g:NERDTreeIndicatorMapCustom = {
        \ "Modified"  : "✹",
        \ "Staged"    : "✚",
        \ "Untracked" : "✭",
        \ "Renamed"   : "➜",
        \ "Unmerged"  : "═",
        \ "Deleted"   : "✖",
        \ "Dirty"     : "✗",
        \ "Clean"     : "✔︎",
        \ 'Ignored'   : '☒',
        \ "Unknown"   : "?"
        \ }
endif

" 打开就显示nerdtree
autocmd StdinReadPre * let s:std_in=1

" 只有一个窗口和nerdtree的时候，退出窗口即退出vim而不是保留nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" 避免在nerdtree中打开文件
autocmd BufEnter * if bufname('#') =~# "^NERD_tree_" && winnr('$') > 1 | b# | endif
" 如果使用vim-plug的话，这一句也要加上
let g:plug_window = 'noautocmd vertical topleft new'

" 在nerdtree中删除文件之后，自动删除vim中相应的buffer
let NERDTreeAutoDeleteBuffer = 1

" 进入目录自动将workspace更改为此目录
let g:NERDTreeChDirMode = 2

map <F2> :NERDTreeToggle<CR>
