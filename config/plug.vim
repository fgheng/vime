call plug#begin(g:plugins_path)

" 补全类插件
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" 检索类插件
Plug 'junegunn/fzf.vim'
\ | Plug 'junegunn/fzf', { 'do': './install --bin' }
\ | Plug 'tpope/vim-fugitive'
" 文档类插件
Plug 'tyru/caw.vim'
" 生成注释文档, 不适用默认的映射，这样启动更快
Plug 'kkoomen/vim-doge', {'on': ['DogeGenerate']}

" 主题theme类插件
Plug 'ajmwagar/vim-deus'
Plug 'crusoexia/vim-monokai'
Plug 'rakr/vim-one'
Plug 'morhetz/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'sainnhe/forest-night'
Plug 'srcery-colors/srcery-vim'
Plug 'arcticicestudio/nord-vim'
Plug 'w0ng/vim-hybrid'
Plug 'altercation/vim-colors-solarized'

" 底栏
Plug 'itchyny/lightline.vim'
" Plug 'vim-airline/vim-airline'
" 彩虹括号
Plug 'luochen1990/rainbow'
" 高亮类插件
Plug 'sheerun/vim-polyglot'
" 函数列表
Plug 'liuchengxu/vista.vim', {'on': ['Vista!!', 'Vista']}
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
Plug 'easymotion/vim-easymotion', {'on':
            \ [
            \ '<Plug>(easymotion-bd-f)', '<Plug>(easymotion-overwin-f)',
            \ '<Plug>(easymotion-overwin-f2)', '<Plug>(easymotion-bd-jk)',
            \ '<Plug>(easymotion-overwin-line)', '<Plug>(easymotion-bd-w)',
            \ '<Plug>(easymotion-overwin-w)'
            \ ]}
" 对齐
Plug 'junegunn/vim-easy-align'
" 对齐线
Plug 'Yggdroot/indentLine' ", {'on': 'IndentLinesEnable'}
" 多光标
Plug 'mg979/vim-visual-multi'
" csv
Plug 'chrisbra/csv.vim', {'for': 'csv'}
Plug 'voldikss/vim-floaterm'
Plug 'vimwiki/vimwiki'
" 功能很强的折叠插件, zc zo
Plug 'pseewald/vim-anyfold'
Plug 'mhinz/vim-startify'
" 翻译
Plug 'iamcco/dict.vim', {'on':
            \ [
            \ '<Plug>DictSearch', '<Plug>DictVSearch', '<Plug>DictWSearch',
            \ '<Plug>DictWVSearch', '<Plug>DictRSearch', '<Plug>DictRVSearch'
            \ ]}
" tmux与vim窗口导航
Plug 'christoomey/vim-tmux-navigator'
" tmux.conf set -g focus-events on
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'roxma/vim-tmux-clipboard'
Plug 'edkolev/tmuxline.vim'
" buffer close
Plug 'rbgrouleff/bclose.vim', {'on': 'Bclose'}
" latex插件
Plug 'lervag/vimtex', {'for': 'tex'}
" 平滑滚动
Plug 'psliwka/vim-smoothie'
" 在命令行使用linux命令新建文件文件夹重命名当前buffer等
Plug 'tpope/vim-eunuch', {'on': ['Mkdir', 'Rename', 'Unlink', 'Delete', 'Move', 'Chmod', 'Cfind', 'Clocate', 'Lfine', 'Llocate', 'SudoEdit', 'SudoWrite', 'Wall', 'W']}
Plug 'davinche/DrawIt', {'on': 'DrawIt'}
" 窗口放大
Plug 'troydm/zoomwintab.vim', {'on': 'ZoomWinTabToggle'}
" vim中文文档
Plug 'yianwillis/vimcdoc'
" 依赖:python-pysdl2 sdl2 sdl2-mixer
Plug 'skywind3000/vim-keysound'
" vim 打开pdf
Plug 'makerj/vim-pdf', {'for': 'pdf'}
" debug
" Plug 'puremourning/vimspector'
" 运行代码
" plug 'skywind3000/asynctasks.vim', {'on': ['asynctask','asynctaskedit','asynctasklist','asynctaskmarco', 'asynctaskprofile']}
" plug 'skywind3000/asyncrun.vim', {'on': ['asyncrun', 'asyncstop']}
Plug 'nvim-treesitter/nvim-treesitter'
" 总是匹配tag
Plug 'valloric/MatchTagAlways', {'for': ['html', 'css', 'xml']}
if has('nvim')
    Plug 'norcalli/nvim-colorizer.lua'
else
    Plug 'RRethy/vim-hexokinase',  { 'do': 'make hexokinase' }
endif
" go to file
Plug 'tpope/vim-apathy'
call plug#end()
