" 基本配置
set nocompatible                                            " 不要兼容vi
syntax on                                                   " vimwiki 和 anyfold需要 pyplot也要
filetype plugin indent on

set encoding=utf-8                                          " 编码
set fileencodings=ucs-bom,utf-8,gb18030,cp936,latin1        " 编码猜测
set number
set relativenumber                                          " 设置相对行号
set incsearch                                               " 搜索时即高亮
set hlsearch                                                " 高亮匹配内容
set wrap
set smartindent                                             " 智能缩进
set autoindent                                              " 自动换行缩进
set linebreak                                               " 软折行
set noswapfile                                              " 禁止生成swap文件
set hidden                                                  " 终端隐藏后不结束
set ignorecase                                              " 忽略大小写
" set smartcase
set infercase                                               " Adjust case in insert completion mode
set history=500                                             " 历史命令
set splitbelow                                              " 在下方分割
set autoindent                                              " 使用空格进行缩进
set expandtab                                               " tab扩展为空格
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set smartindent
set shiftround
"set foldmethod=indent
set list                                                    " 只有setlist后面的才会起作用
set listchars=tab:\|\→·,nbsp:⣿,extends:»,precedes:«
set listchars+=eol:¬
set listchars+=trail:·                                      " 尾部空白
set listchars+=space:\                                     " 空白
set pumheight=20                                            " 设置弹出框大小, 0 则有多少显示多少

set nobackup                                                " coc
set nowritebackup                                           " coc
set shortmess+=c                                            " coc
set signcolumn=yes                                          " coc
set sessionoptions+=globals                                 " coc
set noswapfile
set autoread                                                " 文件在外部被修改过，重新读入
set autowrite                                               " 自动写回
set confirm                                                 " 显示确认对话框
set noshowmode
set timeout ttimeout
set timeoutlen=500
set ttimeoutlen=10
set updatetime=100                                  " 更新时间100ms 默认4000ms 写入swap的时间
set shortmess+=c

set mouse=n                                         " 允许使用鼠标, normal生效，a则是全模式生效
set cmdheight=1
set conceallevel=0                                  " json文件不显示引号
" set laststatus=2                                    " 状态栏, lightline中更改了
" set showtabline=2                                   " 总是显示tab标签栏
set re=1
set cursorline                                      " 高亮当前行
set cursorcolumn                                    " 高亮当前列
set guicursor=
set textwidth=80
set colorcolumn=+1                      " 高亮textwidth后的列

if has('nvim') == 0 && has('patch-8.1.2020')
    set cursorlineopt=number cursorline
endif

if has('nvim')
    " set signcolumn=auto:2
    set signcolumn=yes
else
    set scl=yes
endif

" 定位到退出位置并移动到屏幕中央
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif | normal! zvzz
endif
