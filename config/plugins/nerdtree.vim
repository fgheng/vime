let NERDTreeMinimalUI = 1 " 最小化显示，不显示问号
let NERDTreeDirArrows = 1
let NERDChristmasTree = 1

" nerdtree的git插件
if common#functions#HasPlug('nerdtree-git-plugin')
    let g:NERDTreeGitStatusIndicatorMapCustom = {
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

" 如果使用vim-plug的话，加上这一句可以避免光标在nerdtree
" 中的时候进行插件升级而导致nerdtree崩溃
let g:plug_window = 'noautocmd vertical topleft new'
" 在nerdtree中删除文件之后，自动删除vim中相应的buffer
let NERDTreeAutoDeleteBuffer = 1
" 进入目录自动将workspace更改为此目录
let g:NERDTreeChDirMode = 2

function! s:NERDTreeCustomCROpen(node) abort
    let l:newRoot = a:node.GetSelected()

    if l:newRoot.path.isDirectory
        call b:NERDTree.changeRoot(l:newRoot)
    else
        call l:newRoot.activate({'reuse': 'all', 'where': 'p'})
    endif
endfunction

function! NERDTreeYankCurrentNode(node)
    " let n = g:NERDTreeFileNode.GetSelected()
    let l:s = a:node.GetSelected()
    if l:s != {}
        call setreg('"', l:s.path.str())
    endif
endfunction

" 自定义快捷键
map <F2> :NERDTreeFocus<CR>
" 水平或者垂直窗口打开
let g:NERDTreeMapOpenSplit = "w"
let g:NERDTreeMapOpenVSplit = "W"
" 展开与关闭节点或者打开文件
let g:NERDTreeMapActivateNode = 'l'
let g:NERDTreeMapOpenRecursively = 'L'
let g:NERDTreeMapCloseDir = 'h'
" 显示隐藏文件
let g:NERDTreeMapToggleHidden = '.'
" 回到上一级目录
let g:NERDTreeMapUpdirKeepOpen = '<backspace>'
" 在新的tab打开
let g:NERDTreeMapOpenInTab = 't'
" 在节点之间跳转，无效
let g:NERDTreeMapJumpNextSibling = 'J'
let g:NERDTreeMapJumpPrevSibling = 'K'

augroup vime_nerdtree_group
    autocmd!
    " 只有一个窗口和nerdtree的时候，退出窗口即退出vim而不保留nerdtree
    autocmd BUFENTER * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

    " 避免在nerdtree中打开文件
    autocmd BufEnter * if bufname('#') =~# "^NERD_tree_" && winnr('$') > 1 | b# | endif

    autocmd FileType nerdtree nmap <buffer> <CR> bb

    " 自定义打开目录操作
    " TODO 如何直接定义<CR>作为快捷键?
    autocmd VimEnter * call NERDTreeAddKeyMap({
        \ 'key': 'bb',
        \ 'callback': function('<SID>NERDTreeCustomCROpen'),
        \ 'quickhelpText': 'go to dir and change cwd to it or open a file',
        \ 'scope': 'Node',
        \ 'override': 1,
        \ })

    " 复制路径
    autocmd VimEnter * call NERDTreeAddKeyMap({
            \ 'key': 'yp',
            \ 'callback': 'NERDTreeYankCurrentNode',
            \ 'quickhelpText': 'put full path of current node into the default register',
            \ 'scope': 'Node',
            \ 'override': 1,
            \ })
augroup END
