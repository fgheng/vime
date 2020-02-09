" 插件存储路径
let s:plugins_path = '~/.cache/vim/plugins'
" 依赖的软件
" nodejs, npm, ripgrep, clang, ctags, zathura-pdf-mupdf, texlive-most,
" texlive-lang, remote-neovim, pysdl2, sdl2_mixer

call plug#begin(s:plugins_path)

Plug 'neoclide/coc.nvim', { 'branch': 'release' }
" latex插件
Plug 'lervag/vimtex', {'for': 'tex'} " pip install remote-neovim  zathura-pdf-mupdf xdotool texlive-most texlive-lang
" markdown 插件
Plug 'plasticboy/vim-markdown', {'for': ['md', 'markdown']}
" 快速注释插件
Plug 'scrooloose/nerdcommenter'
" 主题
Plug 'rakr/vim-one'
Plug 'Rigellute/shades-of-purple.vim'
Plug 'haishanh/night-owl.vim'
Plug 'tomasiser/vim-code-dark'
Plug 'dunstontc/vim-vscode-theme'
Plug 'altercation/vim-colors-solarized'
Plug 'KeitaNakamura/neodark.vim'
" 底栏
Plug 'itchyny/lightline.vim'
" 关灯读小说
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
Plug 'junegunn/limelight.vim', { 'on': 'Limelight' }
" 彩虹括号
Plug 'luochen1990/rainbow'
" 函数列表
Plug 'liuchengxu/vista.vim', {'on': 'Vista'}
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
" , {'on': '<Plug>(clever-f-f)'}
" 对齐线
Plug 'Yggdroot/indentLine'
" 多光标
Plug 'mg979/vim-visual-multi'
" 放大窗口
Plug 'troydm/zoomwintab.vim', {'on': 'ZoomWinTabToggle'}
" 标签
Plug 'MattesGroeger/vim-bookmarks'
" , {'on':['<Plug>BookmarkToogle', '<Plug>BookmarkShowAll', '<Plug>BookmarkClear']}
" 编译运行
Plug 'thinca/vim-quickrun', {'on': '<Plug>(quickrun)'}
" table模式
Plug 'dhruvasagar/vim-table-mode', {'on':'TableModeToggle'}
" csv
Plug 'chrisbra/csv.vim', {'for': 'csv'}

" 需要安装pysdl2, sdl2_mixer
" 快速打开终端, neovim需要pip install neovim-remote
Plug 'skywind3000/vim-terminal-help'

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
