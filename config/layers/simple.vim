
" 检索
Plug 'junegunn/fzf', { 'do': {-> fzf#install()} }
Plug 'fszymanski/fzf-gitignore', {'do': ':UpdateRemotePlugins'}
Plug 'junegunn/fzf.vim'

" 注释插件
Plug 'scrooloose/nerdcommenter'
" 生成注释文档
Plug 'kkoomen/vim-doge', {'do': {-> doge#install()}}

" 主题
Plug 'glepnir/zephyr-nvim'
Plug 'rakr/vim-one'
Plug 'npxbr/gruvbox.nvim'

Plug 'itchyny/lightline.vim'

" 自动补全括号
Plug 'jiangmiao/auto-pairs'

" 代码段
Plug 'honza/vim-snippets'

" 快速选择窗口
Plug 't9md/vim-choosewin'
" 彩虹括号
if has('nvim')
    Plug 'p00f/nvim-ts-rainbow'
else
    Plug 'luochen1990/rainbow'
endif

Plug 'kyazdani42/nvim-web-devicons'
if has('nvim')
  Plug 'kyazdani42/nvim-tree.lua'
endif
Plug 'liuchengxu/vista.vim', {'on': ['Vista!!', 'Vista']}
Plug 'mg979/vim-visual-multi'

" tmux相关插件
if  executable("tmux") && strlen($TMUX)
  " tmux与vim窗口间导航
  Plug 'christoomey/vim-tmux-navigator'
  " 在tmux和vim之间进行复制与粘贴
  Plug 'roxma/vim-tmux-clipboard'
  " tmux补全插件
  Plug 'wellle/tmux-complete.vim'
endif

if has('nvim')
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'nvim-treesitter/nvim-treesitter-textobjects'
  Plug 'nvim-treesitter/nvim-treesitter-refactor'
  Plug 'romgrk/nvim-treesitter-context'
else
  Plug 'sheerun/vim-polyglot'
  Plug 'octol/vim-cpp-enhanced-highlight'
endif

Plug 'fgheng/ResizeWindow.vim'
" 显示滚动条
if has('nvim')
  Plug 'dstein64/nvim-scrollview'
  Plug 'norcalli/nvim-colorizer.lua'
endif
" 平滑滚动
" Plug 'psliwka/vim-smoothie'
Plug 'glepnir/indent-guides.nvim'
" 重复上次的动作
Plug 'tpope/vim-repeat'
" 快速移动
Plug 'phaazon/hop.nvim'
" 翻译插件
Plug 'iamcco/dict.vim', {'on':
  \ [
  \ '<Plug>DictSearch', '<Plug>DictVSearch', '<Plug>DictWSearch',
  \ '<Plug>DictWVSearch', '<Plug>DictRSearch', '<Plug>DictRVSearch'
  \ ]}
Plug 'rktjmp/lush.nvim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'ZSaberLv0/ZFVimDirDiff'
Plug 'junegunn/vim-easy-align'
