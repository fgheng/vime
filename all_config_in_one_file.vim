" 所有插件的配置都写在一个文件里，加载速度更快，但是不适合扩展
"
" ------------------ 基础配置 ------------------------
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
set autoindent " 使用空格进行缩进
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

" ------------------ 基础配置 ------------------------

" ------------------ 插件配置 ------------------------
"
" vim-plug
let s:plugins_path = '~/.cache/plugins' " 插件路径

call plug#begin(s:plugins_path)

Plug 'neoclide/coc.nvim', { 'branch': 'release' }
" 闭合标签
Plug 'alvan/vim-closetag'
" 总是匹配tag
Plug 'valloric/MatchTagAlways'
" latex插件
Plug 'lervag/vimtex' " pip install remote-neovim  zathura-pdf-mupdf xdotool texlive-most texlive-lang
" 快速注释插件
Plug 'scrooloose/nerdcommenter'
" vim中文文档
Plug 'yianwillis/vimcdoc'
" 主题
Plug 'flazz/vim-colorschemes'
" 底栏
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" 关灯读小说
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
Plug 'junegunn/limelight.vim', { 'on': 'Limelight' }
" 彩虹括号
Plug 'luochen1990/rainbow'
" 函数列表
Plug 'liuchengxu/vista.vim'
" 自动补全括号
Plug 'jiangmiao/auto-pairs'
" 快速包围
Plug 'tpope/vim-surround'
" 重复上次的动作
Plug 'tpope/vim-repeat'
" 撤回
" Plug 'simnalamburt/vim-mundo', {'on': 'MundoToggle'}
" Plug 'mbbill/undotree'
" 删除buffer
"Plug 'rbgrouleff/bclose.vim', {'on': 'Bclose'}
" 尾部空格
Plug 'ntpeters/vim-better-whitespace'
" 代码段
Plug 'honza/vim-snippets'
"Plug 'SirVer/ultisnips'
" 快速跳转窗口
Plug 't9md/vim-choosewin',  { 'on': 'ChooseWin' }
" 二进制
Plug 'Shougo/vinarise.vim', { 'on': 'Vinarise' }
" 快速移动
" Plug 'easymotion/vim-easymotion', {'on': ['<Plug>(easymotion-overwin-f)', '<Plug>(easymotion-overwin-line)']}
" 快速搜索
Plug 'rhysd/clever-f.vim'
" 对齐线
Plug 'Yggdroot/indentLine'
" 多光标
Plug 'mg979/vim-visual-multi'
" 放大窗口
Plug 'troydm/zoomwintab.vim', {'on': 'ZoomWinTabToggle'}
" 标签
Plug 'MattesGroeger/vim-bookmarks'
" 编译运行
Plug 'thinca/vim-quickrun'
" 在tmux和vim窗口间进行跳转
Plug 'christoomey/vim-tmux-navigator'
" table模式
Plug 'dhruvasagar/vim-table-mode'
Plug 'chrisbra/csv.vim'

if !has('nvim')
	Plug 'vim-utils/vim-alt-mappings'
endif

" pysdl2
" Plug 'skywind3000/vim-keysound'

call plug#end()

" 判断该插件是否已经安装
fun! HasInstall(plugin_name) abort
	let s:plugin_path = s:plugins_path . "/" . a:plugin_name

	if !empty(glob(s:plugin_path))
		return 1
	else
		return 0
	endif
endfunction

" 判断是否有这个插件
fun! HasPlug(plugName)
    if index(g:plugs_order, a:plugName) > -1
        return 1
    else
        return 0
    endif
endfunction

" ---------------- vim-plug

" ---------------- coc.nvim
if HasPlug("coc.nvim")

endif
" ---------------- coc.nvim

" ------------------ 主题配置 ------------------------
"  有关主题的一些配置
function! s:patch_lucius_colors()
	if has('termguicolors')
		set termguicolors
	endif
	hi normal     ctermbg=NONE guibg=NONE
	hi linenr     ctermbg=NONE guibg=NONE
	hi signcolumn ctermbg=NONE guibg=NONE
endfunction

" 判断主题是否安装
if HasInstall('vim-colorschemes')
	autocmd! colorscheme space-vim-dark call s:patch_lucius_colors()
	colorscheme space-vim-dark
	" autocmd! colorscheme gruvbox call s:patch_lucius_colors()
	" colorscheme gruvbox
endif

" 设置vim搜索匹配项的颜色
if !HasPlug('fzf.vim')
    hi Search ctermfg=17 ctermbg=190 guifg=#00005f guibg=#dfff00
    hi IncSearch ctermfg=17 ctermbg=190 guifg=#00005f guibg=#dfff00
    hi QuickFixLine ctermfg=17 ctermbg=190 guifg=#00005f guibg=#dfff00
endif

if HasPlug('coc.nvim')
    if !HasPlug('vim-multiple-cursors.vim')
        " coc多光标颜色
        hi CocCursorRange cterm=bold ctermfg=238 ctermbg=226 gui=bold guifg=#444444 guibg=#ffff00
    endif

    " coc yank背景颜色
    hi HighlightedyankRegion cterm=bold ctermfg=238 ctermbg=226 gui=bold guifg=#444444 guibg=#ffff00
endif

if !HasPlug("vim-airline")
	set statusline=%F%m%r%h%w%=\ [ft=%Y]\ %{\"[fenc=\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\"+\":\"\").\"]\"}\ [ff=%{&ff}]\ [asc=%03.3b]\ [hex=%02.2B]\ [pos=%04l,%04v][%p%%]\ [len=%L]
endif
" ------------------ 主题配置 ------------------------

" ------------------ 按键映射配置 ------------------------
inoremap jk <esc>
nnoremap q <esc>:close<cr>
vnoremap q <esc>:close<cr>
nnoremap <BackSpace> :nohl<cr>

" 使用autopair, c-h表示向前删除
inoremap <c-l> <esc><right>xi

" 窗口
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
" 更改窗口大小
nnoremap <C-w>[ :vertical resize -3<CR>
nnoremap <C-w>] :vertical resize +3<CR>
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
" 分割窗口
nnoremap <c-w>s <esc><c-w>s<esc><c-w>j
nnoremap <c-w>v <esc><c-w>v<esc><c-w>l
nnoremap <c-w>k :abo split <cr>
nnoremap <c-w>h :abo vsplit <cr>
nnoremap <c-w>j :rightbelow split <cr>
nnoremap <c-w>l :rightbelow vsplit <cr>

" nnoremap <F5> :copen<cr>

" 插入模式下的一些快捷键
inoremap <C-s> <esc>:w<cr>
inoremap <C-a> <esc>ggVG
inoremap <M-o> <esc>o
inoremap <M-O> <esc>O
inoremap <M-h> <esc>I
inoremap <M-l> <esc>A

" buffer 操作
if HasPlug('bclose.vim')
    nnoremap <C-x>  :Bclose<CR>
else
    nnoremap <c-x> :bd<cr>
endif

noremap <space><space> <esc>:w<cr>

nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

"tabl operation
nnoremap <leader>tn :tabnew<cr>
nnoremap <leader>te :tabedit
nnoremap <leader>tc :tabclose<cr>
nnoremap <leader>tm :tabmove


"yank to end
nnoremap Y y$

" terminal
tnoremap <Esc> <C-\><C-n>
tnoremap <c-j> <c-\><c-n><c-w>j
tnoremap <c-k> <c-\><c-n><c-w>k
tnoremap <c-l> <c-\><c-n><c-w>l
tnoremap <c-h> <c-\><c-n><c-w>h

" vim-airline
if !HasPlug('vim-airline')
    nnoremap  <M-l> :tabnext<cr>
    nnoremap  <M-h> :tabprevious<CR>
    tnoremap  <M-l> <c-\><c-n>:tabnext<cr>
    tnoremap  <M-h> <c-\><c-n>:tabprevious<CR>
endif

" ale
if HasPlug('ale')
    nmap <silent> <space>{ <Plug>(ale_previous_wrap)
    nmap <silent> <space>} <Plug>(ale_next_wrap)
endif

" leaderf
if HasPlug('LeaderF')
    nnoremap <M-f> :LeaderfFile<CR>
    "nnoremap <M-t> :LeaderfBufTag<CR>
    "nnoremap <M-T> :LeaderfBufTagAll<CR>
    nnoremap <M-o> :LeaderfBufferAll<CR>
    "nnoremap <M-b> :LeaderfTabBufferAll<CR><TAB>
    nnoremap <M-s> :LeaderfLine<CR>
    nnoremap <M-S> :<C-hhhU><C-R>=printf("Leaderf rg -S --fullPath %s", getcwd())<cr><cr>
    nnoremap <M-r> :LeaderfMru<CR>
endif

" fzf
if HasPlug('fzf')
    nnoremap <M-f> :Files<CR>
    nnoremap <M-t> :BTags<CR>
    nnoremap <M-T> :Tags<CR>
    nnoremap <M-o> :Buffers<CR>
    " nnoremap / :BLines<CR>
    " nnoremap ? :Rg<CR>
    nnoremap <M-s> :BLines<CR>
    nnoremap <M-S> :Rg<CR>
    nnoremap <M-r> :History<CR>
    nnoremap <M-g> :GFiles?<CR>
    nnoremap <M-G> :GFiles<CR>
    nnoremap <M-m> :Marks<CR>
    nnoremap <M-w> :Windows<CR>
endif

" easymotion
if HasPlug('vim-easymotion')
    nmap gk <Plug>(easymotion-overwin-f)
    nmap gl <Plug>(easymotion-overwin-line)
    "imap <M-k> <esc><Plug>(easymotion-overwin-f)
    "imap <M-j> <esc><Plug>(easymotion-overwin-line)
    " nmap <Leader>w <Plug>(easymotion-overwin-w)
endif

" goyo
if HasPlug('goyo.vim')
    nnoremap <F7> <esc>:Goyo<cr>
    "setlocal nonumber
    "setlocal norelativenumber
endif

" ChooseWin
if HasPlug('vim-choosewin')
    nnoremap <silent> - :ChooseWin<CR>
endif

" Autoformat
if HasPlug('vim-autoformat')
    nnoremap <M-i> :Autoformat<cr>
endif

" Startify
if HasPlug('vim-startify')
    noremap <leader>s <esc>:Startify<cr>
    "au FileType startify noremap q :q<cr>
endif

" zoomwintab
if HasPlug('zoomwintab.vim')
    nnoremap  <c-w>o :ZoomWinTabToggle<cr>
endif

" tagbar
if HasPlug('tagbar')
    nnoremap <F3> :TagbarToggle<cr>
    "inoremap <F3> <esc>:TagbarToggle<cr>
endif
" ------------------ 按键映射配置 ------------------------
