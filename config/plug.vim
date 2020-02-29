" 插件存储路径
let s:plugins_path = '~/.cache/vim/plugins'
" 依赖的软件
" nodejs, npm, ripgrep, clang, ctags, zathura-pdf-mupdf, texlive-most,
" texlive-lang, remote-neovim, pysdl2, sdl2_mixer

call plug#begin(s:plugins_path)

Plug 'neoclide/coc.nvim', { 'branch': 'release' }
" 这下面可以算是一组插件
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
" Plug 'antoinemadec/coc-fzf' " coc与fzf的结合
" latex插件
Plug 'lervag/vimtex', {'for': 'tex'} " pip install remote-neovim  zathura-pdf-mupdf xdotool texlive-most texlive-lang
" 快速注释插件
Plug 'scrooloose/nerdcommenter'
" 生成注释文档
Plug 'kkoomen/vim-doge'
" 主题
Plug 'rakr/vim-one'
Plug 'KeitaNakamura/neodark.vim'
Plug 'arzg/vim-colors-xcode'
Plug 'morhetz/gruvbox'
" 函数列表
Plug 'liuchengxu/vista.vim', {'on': ['Vista!!', 'Vista']}
" 底栏
" Plug 'vim-airline/vim-airline'
Plug 'itchyny/lightline.vim'
" Plug 'liuchengxu/eleline.vim'
" 关灯读小说
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
Plug 'junegunn/limelight.vim', { 'on': 'Limelight' }
" 彩虹括号
Plug 'luochen1990/rainbow'
" 自动补全括号
Plug 'jiangmiao/auto-pairs'
" Plug 'Krasjet/auto.pairs'
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
" table模式
Plug 'dhruvasagar/vim-table-mode'
" csv
Plug 'chrisbra/csv.vim', {'for': 'csv'}
" 编译运行
" Plug 'thinca/vim-quickrun', {'on': '<Plug>(quickrun)'}
Plug 'skywind3000/asynctasks.vim'
Plug 'skywind3000/asyncrun.vim'
" debug
Plug 'puremourning/vimspector'
" 快速打开终端, neovim需要pip install neovim-remote
Plug 'skywind3000/vim-terminal-help'
Plug 'vimwiki/vimwiki'
", {'on':['VimwikiIndex', 'VimwikiDiaryIndex', 'VimwikiMakeDiaryNote', 'VimwikiMakeTomorrowDiaryNote', 'VimwikiMakeYesterdayDiaryNote', 'VimwikiTabIndex', 'VimwikiTabMakeDiaryNote']}
" 数据库
Plug 'tpope/vim-dadbod', {'on': 'DB'}
" 日期插件
" Plug 'itchyny/calendar.vim', {'on': 'Calendar'}
" Plug 'MattesGroeger/vim-bookmarks'
" Plug 'camspiers/animate.vim'
" Plug 'camspiers/lens.vim'

call plug#end()

" 判断该插件是否已经安装
fun! HasInstall(plugin_name) abort
	let s:plugin_path = s:plugins_path . "/" . a:plugin_name

	if !empty(glob(s:plugin_path))
		return v:true
	else
		return v:false
	endif
endfunction

" 判断是否有这个插件
fun! HasPlug(plugName)
    if index(g:plugs_order, a:plugName) > -1
        return v:true
    else
        return v:false
    endif
endfunction
