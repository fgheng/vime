set number
set relativenumber " 设置相对行号
set cursorline "高亮当前行
set incsearch " 搜索时即高亮
set hlsearch " 高亮匹配内容
set wrap
set smartindent " 智能缩进
set autoindent " 自动换行缩进
set linebreak "软折行
set noswapfile " 禁止生成swap文件
set colorcolumn=80 " 高亮第80行
set hidden " 终端隐藏后不结束
set ignorecase " 忽略大小写
set infercase       " Adjust case in insert completion mode
set history=500 " 历史命令
set splitbelow " 在下方分割
"" tab
set autoindent " 使用空格进行缩进
" set expandtab " tab扩展为空格
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set smartindent
set shiftround
set list
set listchars=tab:→·,nbsp:⣿,extends:»,precedes:«
set listchars+=eol:¬
set listchars+=trail:· " 尾部空白
set listchars+=space:· " 空白
set pumheight=20 " 设置弹出框大小, 0 则有多少显示多少

set nobackup
set noswapfile
set autoread " 文件在外部被修改过，重新读入
set autowrite " 自动写回
set confirm " 显示确认对话框
set laststatus=2
set showtabline=0
set noshowmode
set timeout ttimeout
set timeoutlen=500
set ttimeoutlen=10
set updatetime=100
set shortmess+=c

set mouse=a " 允许使用鼠标
set cmdheight=1

au FileType c,cpp,java set mps+==:;
"-----------------------------
"set backspace=2
"set backspace=indent,eol,start
"set shortmess=aFc
"set signcolumn=yes
"set completefunc=emoji#complete
"set completeopt =longest,menu
"set completeopt-=preview
"-----------------------------
"language messages zh_CN.utf-8 " 中文提示
"set grepprg=rg\ --vimgrep\ $*
"set encoding=utf8
"set helplang=cn
""set softtabstop=4
"set shiftwidth=4
"set shiftround "缩进取整到 'shiftwidth' 的倍数
"set expandtab
"set showmatch
"set foldenable
"set wildmenu
"set smartcase " 智能大小写, 只有在小写时忽略大小写
""set noea " 窗口分割的时候不平均分割
"set ead=ver
"set noshowmode " 不显示模式
"set cmdheight=1
""set autochdir   " 将文件所在路径设置为vim的当前路径
"set autowrite " 在切换文件的时候自动存盘
"let autosave=10
"set backup " 在当前文件下生成备份文件
""set conceallevel=0  " json正常显示文本, conceal是隐藏
"set switchbuf=useopen,usetab,newtab "这样quickfix里面的跳转会先复用已有文件的窗口，再复用已有标签，最后没有的话新建标签
"set tw=80 " 文本宽度

if has('nvim')
    "set signcolumn=auto:2 " neovim的新特性，标识列自动变化
    set signcolumn=yes
else
    set scl=yes
endif

"记住退出位置
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" tex文件
" let g:tex_flavor='latex'
