" 依赖的软件
" nodejs, npm, ripgrep, clang, ctags, zathura-pdf-mupdf, texlive-most,
" texlive-lang, remote-neovim
call plug#begin(g:plugins_path)

Plug 'neoclide/coc.nvim', { 'branch': 'release' }
" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
" 这下面可以算是一组插件
Plug 'junegunn/fzf', { 'do': './install --bin' } | Plug 'junegunn/fzf.vim' | Plug 'tpope/vim-fugitive'
" Plug 'antoinemadec/coc-fzf' " coc与fzf的结合
" Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
" Plug 'liuchengxu/vim-clap', {'do': ':Clap install-binary'}
" latex插件
Plug 'lervag/vimtex', {'for': 'tex'} " pip install remote-neovim  zathura-pdf-mupdf xdotool texlive-most texlive-lang
" 快速注释插件
Plug 'scrooloose/nerdcommenter'
" 生成注释文档, 不适用默认的映射，这样启动更快
Plug 'kkoomen/vim-doge', {'on': ['DogeGenerate']}
" 主题
Plug 'rakr/vim-one'
Plug 'morhetz/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'NLKNguyen/papercolor-theme'
" 函数列表
Plug 'liuchengxu/vista.vim', {'on': ['Vista!!', 'Vista']}
" 底栏
Plug 'itchyny/lightline.vim'
" 关灯读小说
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' } | Plug 'junegunn/limelight.vim', { 'on': 'Limelight' }
" 彩虹括号
Plug 'luochen1990/rainbow'
" 自动补全括号
Plug 'jiangmiao/auto-pairs'
" 快速包围
Plug 'tpope/vim-surround'
" 重复上次的动作
Plug 'tpope/vim-repeat'
" 尾部空格
Plug 'ntpeters/vim-better-whitespace'
" 代码段
Plug 'honza/vim-snippets'
" 快速跳转窗口
Plug 't9md/vim-choosewin',  { 'on': 'ChooseWin' }
" 二进制
Plug 'Shougo/vinarise.vim', { 'on': 'Vinarise' }
" 快速移动
Plug 'rhysd/clever-f.vim'
" 对齐线
Plug 'Yggdroot/indentLine'
" 多光标
Plug 'mg979/vim-visual-multi'
" 放大窗口
Plug 'troydm/zoomwintab.vim', {'on': 'ZoomWinTabToggle'}
" csv
Plug 'chrisbra/csv.vim', {'for': 'csv'}
" 编译运行
Plug 'skywind3000/asynctasks.vim', {'on': ['AsyncTask','AsyncTaskEdit','AsyncTaskList','AsyncTaskMarco', 'AsyncTaskProfile']}
Plug 'skywind3000/asyncrun.vim', {'on': ['AsyncRun', 'AsyncStop']}
" debug
Plug 'puremourning/vimspector'
Plug 'voldikss/vim-floaterm'
Plug 'vimwiki/vimwiki'
" markdown内运行代码
Plug 'gpanders/vim-medieval'
"{'on': ['Eval', 'Eval!', 'EvalBlock!', 'EvalBlock']}
" 数据库
Plug 'tpope/vim-dadbod', {'on': 'DB'}
" Plug 'MattesGroeger/vim-bookmarks', {'on': ['BookmarkToggle', 'BookmarkAnnotate', 'BookmarkShowAll', 'BookmarkClear', 'BookmarkClearAll']}
" 功能很强的折叠插件, zc zo
Plug 'pseewald/vim-anyfold'
" 画图，使用leaderds结束
Plug 'davinche/DrawIt', {'on': 'DrawIt'}
" 高亮
Plug 'sheerun/vim-polyglot'
" python高亮，异步
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
" vim中文文档
Plug 'yianwillis/vimcdoc'
Plug 'mhinz/vim-startify'
" 翻译
" Plug 'voldikss/vim-translator'
Plug 'iamcco/dict.vim'

call plug#end()

" 判断该插件是否已经安装
fun! HasInstall(plugin_name) abort
	let s:plugin_path = g:plugins_path . "/" . a:plugin_name

	if !empty(glob(s:plugin_path))
		return v:true
	else
		return v:false
	endif
endfunction

" 判断插件列表是否有这个插件
fun! HasPlug(plugName)
    if index(g:plugs_order, a:plugName) > -1
        return v:true
    else
        return v:false
    endif
endfunction
