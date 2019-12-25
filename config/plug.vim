let s:plugin_path = '~/.cache/plugins'


call plug#begin(s:plugin_path)

Plug 'neoclide/coc.nvim', { 'branch': 'release' }
" git
" Plug 'tpope/vim-fugitive'
" Plug 'junegunn/gv.vim'
" Plug 'gregsexton/gitv'
" 闭合标签
Plug 'alvan/vim-closetag'
" 总是匹配tag
Plug 'valloric/MatchTagAlways'
" latex插件
Plug 'lervag/vimtex' " pip install remote-neovim  zathura-pdf-mupdf xdotool texlive-most texlive-lang
" markdown 插件
" Plug 'plasticboy/vim-markdown'
" 绘制dot图的插件
" Plug 'wannesm/wmgraphviz.vim'
"Plug 'liuchengxu/graphviz.vim'
" 快速注释插件
Plug 'scrooloose/nerdcommenter'
" vim中文文档
Plug 'yianwillis/vimcdoc'
" 主题
Plug 'flazz/vim-colorschemes'
"Plug 'Rigellute/shades-of-purple.vim'
"Plug 'haishanh/night-owl.vim'
"Plug 'tomasiser/vim-code-dark'
"Plug 'dunstontc/vim-vscode-theme'
" Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
"Plug 'mhinz/vim-startify', {'on': 'Startify'}
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
" -------- 其他
" 需要按照python-pysdl2 sdl2_mixer
" TODO 需要将依赖进行集成
"Plug 'skywind3001/vim-keysound'
" 快速替换多个文件的内容
" Plug 'brooth/far.vim'
" table模式
Plug 'dhruvasagar/vim-table-mode'
" Plug 'vim/killersheep'
" csv
Plug 'chrisbra/csv.vim'

if !has('nvim')
	Plug 'vim-utils/vim-alt-mappings'
endif

" pysdl2
" Plug 'skywind3000/vim-keysound'

call plug#end()

" 判断该插件是否已经安装
fun! HasInstall(plugin_name) abort
	if !empty(glob(s:plugin_path . "/" . a:plugin_name))
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
