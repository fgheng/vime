
language messages zh_CN.utf-8 " 中文提示
set cursorline "高亮当前行
set encoding=utf8
set helplang=cn
set number
set numberwidth=4
set relativenumber " 设置行号相关
set smartindent " 智能缩进
set autoindent " 自动换行缩进
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround "缩进取整到 'shiftwidth' 的倍数
set expandtab
set showmatch
set linebreak "软折行
set noswapfile " 禁止生成swap文件
set ignorecase " 忽略大小写
"set smartcase " 智能大小写
set incsearch " 搜索时即高亮
set hlsearch " 高亮匹配内容
set foldenable
set wildmenu
set wrap
set noea " 窗口分割的时候不平均分割
set ead=ver
" set noshowmode " 不显示模式
set cmdheight=1
"set autochdir   " 将文件所在路径设置为vim的当前路径
let autosave=10
set laststatus=0
set colorcolumn=80 " 高亮第80行
"set conceallevel=0  " json正常显示文本
set switchbuf=useopen,usetab,newtab "这样quickfix里面的跳转会先复用已有文件的窗口，再复用已有标签，最后没有的话新建标签
set tw=80
set shortmess+=c
set hidden " 终端隐藏后不结束
if has('nvim')
    set signcolumn=auto:3 " neovim的新特性，标识列自动变化
else
    set scl=yes
endif

"记住退出位置
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

set list
set lcs=tab:\ .,nbsp:%
