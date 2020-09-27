let NERDTreeMinimalUI = 1 " 最小化显示，不显示问号
let NERDTreeDirArrows = 1
let NERDChristmasTree = 1

" nerdtree的git插件
if g:HasPlug('nerdtree-git-plugin')
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

" 只有一个窗口和nerdtree的时候，退出窗口即退出vim而不保留nerdtree
autocmd BUFENTER * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" 避免在nerdtree中打开文件
autocmd BufEnter * if bufname('#') =~# "^NERD_tree_" && winnr('$') > 1 | b# | endif

" 如果使用vim-plug的话，加上这一句可以避免光标在nerdtree
" 中的时候进行插件升级而导致nerdtree崩溃
let g:plug_window = 'noautocmd vertical topleft new'

" 在nerdtree中删除文件之后，自动删除vim中相应的buffer
let NERDTreeAutoDeleteBuffer = 1

" 进入目录自动将workspace更改为此目录
let g:NERDTreeChDirMode = 2

map <F2> :NERDTreeToggle<CR>

" 自定义快捷键
autocmd VimEnter * call NERDTreeAddKeyMap({
        \ 'key': 'foo',
        \ 'callback': 'NERDTreeEchoPathHandler',
        \ 'quickhelpText': 'echo full path of current node',
        \ 'override': 1,
        \ 'scope': 'DirNode' })

function! NERDTreeEchoPathHandler(dirnode)
    echo a:dirnode.path.str()
endfunction

autocmd VimEnter * call NERDTreeAddKeyMap({
\                       'key': '<cr>',
\                       'callback': {-> feedkeys("o", 'int')},
\                      })

" 复制路径
autocmd VimEnter * call NERDTreeAddKeyMap({
        \ 'key': 'foo',
        \ 'callback': function('<SID>NERDTreeCustomMapsCopyFilePath'),
        \ 'quickhelpText': 'echo full path of current node',
        \ 'override': 1,
        \ 'scope': 'DirNode' })
function! s:NERDTreeCustomMapsCopyFilePath()
endfunction

autocmd VimEnter * call NERDTreeAddKeyMap({
        \ 'key': 'l',
        \ 'callback': function('<SID>NERDTreeCustomMapsExpandOrOpenFile'),
        \ 'quickhelpText': 'open dir or open file',
        \ 'override': 1,
        \ 'scope': 'Node' })

function! s:NERDTreeCustomMapsExpandOrOpenFile(node)
    let s = a:node.GetSelected()

    if s.path.isDirectory
        echom "yes is a directory"
    endif
    " let n = g:NERDTreeFileNode.GetSelected()
    " let d = g:NERDTreeDirNode.GetSelected()

    " if n != {}
        " if !n.path.isDirectory
            " call n.open()
        " else
            " call n.activate(0)
        " endif
    " endif

    " if d != {}

    " endif
endfunction


autocmd VimEnter * call NERDTreeAddKeyMap({
       \ 'key': 'o',
       \ 'callback': "NERDTreeCustomMapsOpenAClose",
       \ 'quickhelpText': 'open current file and close tree' })

function! s:NERDTreeCustomMapsOpenAClose()
    let n = g:NERDTreeFileNode.GetSelected()
    if n != {}
        if !n.path.isDirectory
            call n.open()
            NERDTreeClose
        else
            " if the node is a dir then just activate it as norm
            call n.activate(0)
        endif
    endif
endfunction

" 另两种方法
" autocmd FileType nerdtree nmap <buffer> y go
" let g:NERDTreeMapPreview = "<CR>"
