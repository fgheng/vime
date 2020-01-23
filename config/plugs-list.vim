" 这里是现在或者曾经使用过的插件列表
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
" git
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'gregsexton/gitv'
" 总是匹配tag
Plug 'valloric/MatchTagAlways', {'for': ['html', 'css', 'xml']}
" latex插件
Plug 'lervag/vimtex', {'for': 'tex'} " pip install remote-neovim  zathura-pdf-mupdf xdotool texlive-most texlive-lang
" markdown 插件
Plug 'plasticboy/vim-markdown', {'for': ['md', 'markdown']}
" 快速注释插件
Plug 'scrooloose/nerdcommenter'
" vim中文文档
Plug 'yianwillis/vimcdoc'
" 主题
Plug 'flazz/vim-colorschemes'
Plug 'rakr/vim-one'
Plug 'Rigellute/shades-of-purple.vim'
Plug 'haishanh/night-owl.vim'
Plug 'tomasiser/vim-code-dark'
Plug 'dunstontc/vim-vscode-theme'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'mhinz/vim-startify', {'on': 'Startify'}
" 底栏
Plug 'itchyny/lightline.vim'
Plug 'vim-airline/vim-airline'
"底栏主题
Plug 'vim-airline/vim-airline-themes'
Plug 'jacoborus/tender.vim'

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
Plug 'simnalamburt/vim-mundo', {'on': 'MundoToggle'}
Plug 'mbbill/undotree'
" 删除buffer
Plug 'rbgrouleff/bclose.vim', {'on': 'Bclose'}
" 尾部空格
Plug 'ntpeters/vim-better-whitespace'
" 代码段
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips' " 快捷键跳转到下一处要填写的地方,使用coc代替
" 快速跳转窗口
Plug 't9md/vim-choosewin',  { 'on': 'ChooseWin' }
" 二进制
Plug 'Shougo/vinarise.vim', { 'on': 'Vinarise' }
Plug 'fidian/hexmode'
" 快速移动
Plug 'easymotion/vim-easymotion', {'on': ['<Plug>(easymotion-overwin-f)', '<Plug>(easymotion-overwin-line)']}
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
Plug 'thinca/vim-quickrun', {'on': '<Plug>(quickrun)'}
" 在tmux和vim窗口间进行跳转
Plug 'christoomey/vim-tmux-navigator'
" -------- 其他
" table模式
Plug 'dhruvasagar/vim-table-mode'
" csv
Plug 'chrisbra/csv.vim', {'for': 'csv'}

if !has('nvim')
	Plug 'vim-utils/vim-alt-mappings'
endif

" 需要安装pysdl2, sdl2_mixer
Plug 'skywind3000/vim-keysound'
Plug 'mcchrish/nnn.vim'
" 快速打开终端, neovim需要pip install neovim-remote
Plug 'skywind3000/vim-terminal-help'

