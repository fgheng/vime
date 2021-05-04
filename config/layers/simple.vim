" 够用就好了，我发现我常用的一些功能就是补全，git，以及文件浏览了
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" 检索
Plug 'junegunn/fzf', { 'do': {-> fzf#install()} }
Plug 'fszymanski/fzf-gitignore', {'do': ':UpdateRemotePlugins'}
Plug 'junegunn/fzf.vim'
Plug 'antoinemadec/coc-fzf',  {'branch': 'release'}

" 注释插件
Plug 'scrooloose/nerdcommenter'
" 生成注释文档
Plug 'kkoomen/vim-doge', {'do': {-> doge#install()}}

" 主题
Plug 'rakr/vim-one'
Plug 'sainnhe/forest-night'

" Plug 'datwaft/bubbly.nvim'
Plug 'itchyny/lightline.vim'
" Plug 'akinsho/nvim-bufferline.lua'

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

if has('nvim')
  Plug 'kyazdani42/nvim-tree.lua'
endif
Plug 'liuchengxu/vista.vim', {'on': ['Vista!!', 'Vista']}
Plug 'mg979/vim-visual-multi'

" tmux相关插件
if  executable("tmux") && strlen($TMUX)
  " tmux与vim窗口间导航
  Plug 'christoomey/vim-tmux-navigator'
  " tmux.conf set -g focus-events on neovim自带了
  " Plug 'tmux-plugins/vim-tmux-focus-events'
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
if has('nvim')
  Plug 'dstein64/nvim-scrollview'
endif
" 平滑滚动
Plug 'psliwka/vim-smoothie'
" 重复上次的动作
Plug 'tpope/vim-repeat'
" 快速移动
Plug 'phaazon/hop.nvim'
" Plug 'easymotion/vim-easymotion', {'on':
 " \ [
 " \ '<Plug>(easymotion-bd-f)', '<Plug>(easymotion-overwin-f)',
 " \ '<Plug>(easymotion-overwin-f2)', '<Plug>(easymotion-bd-jk)',
 " \ '<Plug>(easymotion-overwin-line)', '<Plug>(easymotion-bd-w)',
 " \ '<Plug>(easymotion-overwin-w)', '<Plug>(easymotion-s)',
 " \ ]}
" 翻译插件
Plug 'iamcco/dict.vim', {'on':
  \ [
  \ '<Plug>DictSearch', '<Plug>DictVSearch', '<Plug>DictWSearch',
  \ '<Plug>DictWVSearch', '<Plug>DictRSearch', '<Plug>DictRVSearch'
  \ ]}
" 语法检查
" Plug 'dpelle/vim-LanguageTool'
" Plug 'vim-scripts/cpp_cppcheck.vim'
Plug 'rktjmp/lush.nvim'
" Plug 'ntpeters/vim-better-whitespace'

" coc插件列表，可根据需要进行删减
let g:coc_global_extensions = [
    \ 'coc-vimlsp',
    \ 'coc-xml',
    \ 'coc-yank',
    \ 'coc-sh',
    \ 'coc-yaml',
    \ 'coc-cmake',
    \ 'coc-snippets',
    \ 'coc-clangd',
    \ 'coc-json',
    \ 'coc-lists',
    \ 'coc-word',
    \ 'coc-ci',
    \ 'coc-zi',
    \ 'coc-just-complete',
    \ 'coc-pyright',
    \ 'coc-marketplace',
  \ ]
