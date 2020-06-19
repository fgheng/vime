" 全局变量
" session目录
let g:session_dir = $HOME.'/.cache/vim/sessions'
" 设置vim-plug插件安装路径
let g:plugins_path = $HOME.'/.cache/vim/plugins'

" 基础配置
set number
set relativenumber                                  " 设置相对行号
set incsearch                                       " 搜索时即高亮
set hlsearch                                        " 高亮匹配内容
set wrap
set smartindent                                     " 智能缩进
set autoindent                                      " 自动换行缩进
set linebreak                                       " 软折行
set noswapfile                                      " 禁止生成swap文件
set hidden                                          " 终端隐藏后不结束
set ignorecase                                      " 忽略大小写
" set smartcase
set infercase                                       " Adjust case in insert completion mode
set history=500                                     " 历史命令
set splitbelow                                      " 在下方分割
set autoindent                                      " 使用空格进行缩进
set expandtab                                       " tab扩展为空格
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set smartindent
set shiftround
"set foldmethod=indent
set list                                            " 只有setlist后面的才会起作用
set listchars=tab:\|\→·,nbsp:⣿,extends:»,precedes:«
set listchars+=eol:¬
set listchars+=trail:·                              " 尾部空白
" set listchars+=space:\                             " 空白
set pumheight=20                                    " 设置弹出框大小, 0 则有多少显示多少

set nobackup                                        " coc
set nowritebackup                                   " coc
set shortmess+=c                                    " coc
set signcolumn=yes                                  " coc
set sessionoptions+=globals                         " coc
set noswapfile
set autoread                                        " 文件在外部被修改过，重新读入
set autowrite                                       " 自动写回
set confirm                                         " 显示确认对话框
set noshowmode
set timeout ttimeout
set timeoutlen=500
set ttimeoutlen=10
set updatetime=100                                  " 更新时间100ms 默认4000ms 写入swap的时间
set shortmess+=c

set mouse=a                                         " 允许使用鼠标
set cmdheight=1
set conceallevel=0                                  " json文件不显示引号

set laststatus=2                                    " 状态栏, lightline中更改了
set showtabline=2                                   " 总是显示tab标签栏

set re=1

set nocompatible                                    " vimwiki需要
filetype plugin on                                  " vimwiki 和 anyfold需要
syntax on                                           " vimwiki 和 anyfold需要 pyplot也要

au FileType c,cpp,java set mps+==:;                 " 按下%可以在=和;直接跳转

if has('nvim')
    " neovim的新特性，标识列自动变化
    " set signcolumn=auto:2
    set signcolumn=yes
else
    set scl=yes
endif

"记住退出位置
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" vim alt配置
if !has('nvim')
    function! Terminal_MetaMode(mode)
        set ttimeout
        if $TMUX != ''
            set ttimeoutlen=30
        elseif &ttimeoutlen > 80 || &ttimeoutlen <= 0
            set ttimeoutlen=80
        endif
        if has('nvim') || has('gui_running')
            return
        endif
        function! s:metacode(mode, key)
            if a:mode == 0
                exec "set <M-".a:key.">=\e".a:key
            else
                exec "set <M-".a:key.">=\e]{0}".a:key."~"
            endif
        endfunc
        for i in range(10)
            call s:metacode(a:mode, nr2char(char2nr('0') + i))
        endfor
        for i in range(26)
            call s:metacode(a:mode, nr2char(char2nr('a') + i))
            call s:metacode(a:mode, nr2char(char2nr('A') + i))
        endfor
        if a:mode != 0
            for c in [',', '.', '/', ';', '[', ']', '{', '}']
                call s:metacode(a:mode, c)
            endfor
            for c in ['?', ':', '-', '_']
                call s:metacode(a:mode, c)
            endfor
        else
            for c in [',', '.', '/', ';', '{', '}']
                call s:metacode(a:mode, c)
            endfor
            for c in ['?', ':', '-', '_']
                call s:metacode(a:mode, c)
            endfor
        endif
    endfunc

    call Terminal_MetaMode(0)
endif

" 退出vim自动保存session
function SaveSession()
    exec "mksession! " . g:session_dir . "/session.vim"
endfunction
autocmd VimLeavePre * call SaveSession()
