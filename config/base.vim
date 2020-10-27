" 基本配置
if &compatible
    set nocompatible                                            " 不要兼容vi
endif

if has('syntax')
    syntax enable
    syntax on
endif

if has('autocmd')
    filetype plugin indent on
endif

if has('multi_byte')
    set encoding=utf-8                                          " 编码
    set fileencoding=utf-8
    set fileencodings=ucs-bom,utf-8,gb18030,cp936,latin1        " 编码猜测
endif

set number
set relativenumber                                          " 设置相对行号
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
set expandtab                                               " tab扩展为空格
set tabstop=4
set softtabstop=4                                           " 连续数量的空格看作一个制表符
set shiftwidth=4
set smarttab
set shiftround
if has('folding')
    set foldenable
    set foldmethod=indent                                     " 基于缩进的折叠
    set foldlevel=99                                          " 默认打开所有缩进
endif

set nobackup
set nowritebackup
set shortmess+=c
set sessionoptions+=globals
set autoread                                                " 文件在外部被修改过，重新读入
set autowrite                                               " 自动写回
set confirm                                                 " 显示确认对话框
set noshowmode
set ttimeout
set timeoutlen=500
set ttimeoutlen=10
set updatetime=100                                  " 更新时间100ms 默认4000ms 写入swap的时间
set mouse=n                                         " 允许使用鼠标, normal生效，a则是全模式生效

set winaltkeys=no
set lazyredraw                                      " 延迟绘制，提升性能

set showmatch
set matchtime=2
set ffs=unix,dos,mac                                " 文件换行符，默认使用unix换行符

if has('nvim') == 0 && has('patch-8.1.2020')
    set cursorlineopt=number cursorline
endif

if has('patch-8.1.1564')
    set signcolumn=yes
    " set signcolumn=number
else
    set signcolumn=yes
endif

" 定位到退出位置并移动到屏幕中央
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif | normal! zvzz
endif

" 一下内容来自韦大的配置
" 文件搜索和补全时忽略下面的扩展名
set suffixes=.bak,~,.o,.h,.info,.swp,.obj,.pyc,.pyo,.egg-info,.class

set wildignore=*.o,*.obj,*~,*.exe,*.a,*.pdb,*.lib "stuff to ignore when tab completing
set wildignore+=*.so,*.dll,*.swp,*.egg,*.jar,*.class,*.pyc,*.pyo,*.bin,*.dex
set wildignore+=*.zip,*.7z,*.rar,*.gz,*.tar,*.gzip,*.bz2,*.tgz,*.xz    " MacOSX/Linux
set wildignore+=*DS_Store*,*.ipch
set wildignore+=*.gem
set wildignore+=*.png,*.jpg,*.gif,*.bmp,*.tga,*.pcx,*.ppm,*.img,*.iso
set wildignore+=*.so,*.swp,*.zip,*/.Trash/**,*.pdf,*.dmg,*/.rbenv/**
set wildignore+=*/.nx/**,*.app,*.git,.git
set wildignore+=*.wav,*.mp3,*.ogg,*.pcm
set wildignore+=*.mht,*.suo,*.sdf,*.jnlp
set wildignore+=*.chm,*.epub,*.pdf,*.mobi,*.ttf
set wildignore+=*.mp4,*.avi,*.flv,*.mov,*.mkv,*.swf,*.swc
set wildignore+=*.ppt,*.pptx,*.docx,*.xlt,*.xls,*.xlsx,*.odt,*.wps
set wildignore+=*.msi,*.crx,*.deb,*.vfd,*.apk,*.ipa,*.bin,*.msu
set wildignore+=*.gba,*.sfc,*.078,*.nds,*.smd,*.smc
set wildignore+=*.linux2,*.win32,*.darwin,*.freebsd,*.linux,*.android
