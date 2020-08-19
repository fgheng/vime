" 一些插件列表
" nodejs, npm, ripgrep, clang, ctags, zathura-pdf-mupdf, texlive-most,
" texlive-lang, remote-neovim
Plug 'neovim/nvim-lsp'
Plug 'ycm-core/YouCompleteMe'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' } |
    \ Plug 'vn-ki/coc-clap' |
    \ Plug 'liuchengxu/vista.vim'
" 检索类插件 下面的是fzf-preview.vim，
" 当然也可以选择fzf.vim
Plug 'yuki-ycino/fzf-preview.vim', { 'branch': 'release', 'do': ':UpdateRemotePlugins' } \ | Plug 'junegunn/fzf', { 'do': {-> fzf#install()} }
\ | Plug 'tpope/vim-fugitive'
\ | Plug 'LeafCage/yankround.vim'
\ | Plug 'neoclide/coc.nvim', { 'branch': 'release' }
\ | Plug 'lambdalisue/gina.vim'
Plug 'Yggdroot/LeaderF'
" latex插件
Plug 'lervag/vimtex', {'for': 'tex'}
Plug 'scrooloose/nerdcommenter'
" vim中文文档
Plug 'yianwillis/vimcdoc'
" 关灯读小说
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
\ | Plug 'junegunn/limelight.vim', { 'on': 'Limelight' }
Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }
" 代码段同步更改
Plug 'SirVer/ultisnips'
" 快速移动
Plug 'rhysd/clever-f.vim'
Plug 'unblevable/quick-scope'
Plug 'voldikss/vim-translator'
" 放大窗口
Plug 'troydm/zoomwintab.vim', {'on': 'ZoomWinTabToggle'}
" 平滑滚动
Plug 'psliwka/vim-smoothie'
" 二进制
Plug 'Shougo/vinarise.vim', { 'on': 'Vinarise' }
" 编译运行
Plug 'skywind3000/asynctasks.vim', {'on': ['AsyncTask','AsyncTaskEdit','AsyncTaskList','AsyncTaskMarco', 'AsyncTaskProfile']}
Plug 'skywind3000/asyncrun.vim', {'on': ['AsyncRun', 'AsyncStop']}
" debug
Plug 'puremourning/vimspector'
" markdown内运行代码
Plug 'gpanders/vim-medieval', {'on': ['Eval', 'Eval!', 'EvalBlock!', 'EvalBlock']}
Plug 'dbridges/vim-markdown-runner'
" 数据库
Plug 'kristijanhusak/vim-dadbod-ui' | Plug 'tpope/vim-dadbod', {'on': 'DB'}
" 书签
Plug 'MattesGroeger/vim-bookmarks', {'on': ['BookmarkToggle', 'BookmarkAnnotate', 'BookmarkShowAll', 'BookmarkClear', 'BookmarkClearAll']}
" 画图，使用leaderds结束
Plug 'davinche/DrawIt', {'on': 'DrawIt'}
" jk加速
Plug 'rhysd/accelerated-jk'
" 输入法切换
Plug 'rlue/vim-barbaric'
Plug 'preservim/nerdtree' | Plug 'Xuyuanp/nerdtree-git-plugin'
if has('nvim')
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/defx.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
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
" 起始界面
Plug 'hardcoreplayers/dashboard-nvim'
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
Plug 'SirVer/ultisnips'
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
Plug 'dstein64/vim-startuptime', {'on':'StartupTime'}
" 窗口聚焦
Plug 'TaDaa/vimade'

if !has('nvim')
	Plug 'vim-utils/vim-alt-mappings'
endif

" 需要安装pysdl2, sdl2_mixer
Plug 'skywind3000/vim-keysound'
Plug 'mcchrish/nnn.vim'
" 快速打开终端, neovim需要pip install neovim-remote
Plug 'skywind3000/vim-terminal-help'
" grammarly语法
Plug 'dpelle/vim-LanguageTool'

" python高亮，异步
if has('nvim')
    plug 'numirias/semshi', {'do': ':updateremoteplugins', 'for': 'python'}
endif
" c++ 高亮
plug 'jackguo380/vim-lsp-cxx-highlight', {
          \ 'for': [
          \ 'cpp', 'c', 'cu', 'h', 'hpp', 'hh', 'objc', 'objcpp'
          \ ]}
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'ap/vim-css-color'
if has('nvim')
    Plug 'norcalli/nvim-colorizer.lua'
else
    Plug 'RRethy/vim-hexokinase',  { 'do': 'make hexokinase' }
endif
Plug 'francoiscabrol/ranger.vim'
" 颜色编辑器
Plug 'rbtnn/vim-coloredit'
