" 代码补全插件
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
" 检索类插件 下面的是fzf-preview.vim，
" 当然也可以选择fzf.vim
" Plug 'yuki-ycino/fzf-preview.vim', { 'branch': 'release', 'do': ':UpdateRemotePlugins' }
"\ | Plug 'junegunn/fzf', { 'do': {-> fzf#install()} }
"\ | Plug 'tpope/vim-fugitive'
"\ | Plug 'LeafCage/yankround.vim'
"\ | Plug 'neoclide/coc.nvim', { 'branch': 'release' }
"\ | Plug 'lambdalisue/gina.vim'
" 可以选择fzf.vim
Plug 'junegunn/fzf.vim'
\ | Plug 'junegunn/fzf', { 'do': {-> fzf#install()} }
\ | Plug 'tpope/vim-fugitive'
\ | Plug 'antoinemadec/coc-fzf'
\ | Plug 'neoclide/coc.nvim', {'branch': 'release'}
"\ | Plug 'svermeulen/vim-yoink'
" 注释插件
Plug 'tyru/caw.vim'
" 生成注释文档
Plug 'kkoomen/vim-doge', {'on': 'DogeGenerate'}
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
" 彩虹括号
Plug 'luochen1990/rainbow'
" 函数列表
Plug 'liuchengxu/vista.vim' ", {'on': ['Vista!!', 'Vista']}
" 自动补全括号
Plug 'jiangmiao/auto-pairs'
" 快速包围
Plug 'tpope/vim-surround'
" 重复上次的动作
Plug 'tpope/vim-repeat'
" 显示清除尾部空格
Plug 'ntpeters/vim-better-whitespace'
" 代码段
Plug 'honza/vim-snippets'
" 快速选择窗口
Plug 't9md/vim-choosewin',  { 'on': 'ChooseWin' }
" 快速移动
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
" csv插件
Plug 'chrisbra/csv.vim', {'for': 'csv'}
autocmd! User csv.vim echom "hello -------csv"

" 悬浮终端
Plug 'voldikss/vim-floaterm'
" 笔记插件，支持markdown
Plug 'vimwiki/vimwiki'
" 功能很强的折叠插件, zc zo
Plug 'pseewald/vim-anyfold'
" 起始界面
Plug 'mhinz/vim-startify'
" 翻译插件
Plug 'iamcco/dict.vim', {'on':
        \ [
        \ '<Plug>DictSearch', '<Plug>DictVSearch', '<Plug>DictWSearch',
        \ '<Plug>DictWVSearch', '<Plug>DictRSearch', '<Plug>DictRVSearch'
        \ ]}
" tmux相关插件
if strlen($TMUX) && executable("tmux")
    " tmux与vim窗口间导航
    Plug 'christoomey/vim-tmux-navigator'
    " tmux.conf set -g focus-events on
    Plug 'tmux-plugins/vim-tmux-focus-events'
    " 在tmux和vim之间进行复制与粘贴
    Plug 'roxma/vim-tmux-clipboard'
    " 使用vim的主题配置tmux主题
    Plug 'edkolev/tmuxline.vim', {'on': 'Tmuxline'}
endif
" 关闭buffer而不关闭窗口
Plug 'rbgrouleff/bclose.vim', {'on': 'Bclose'}
" latex插件
Plug 'lervag/vimtex', {'for': 'tex'}
" 平滑滚动
Plug 'psliwka/vim-smoothie'
" 在命令行使用linux命令新建文件文件夹重命名当前buffer等
Plug 'tpope/vim-eunuch', {'on': ['Mkdir', 'Rename', 'Unlink', 'Delete', 'Move', 'Chmod', 'Cfind', 'Clocate', 'Lfine', 'Llocate', 'SudoEdit', 'SudoWrite', 'Wall', 'W']}
" 绘图插件
Plug 'davinche/DrawIt', {'on': 'DrawIt'}
" 最大化窗口，ctrl w o
Plug 'troydm/zoomwintab.vim', {'on': 'ZoomWinTabToggle'}
" vim中文文档
Plug 'yianwillis/vimcdoc'
" 模拟机械键盘，依赖:python-pysdl2 sdl2 sdl2-mixer
" if has('nvim')
"     Plug 'skywind3000/vim-keysound'
" endif
" vim打开pdf
Plug 'makerj/vim-pdf', {'for': 'pdf'}
" debug
" Plug 'puremourning/vimspector'
" 运行代码
" plug 'skywind3000/asynctasks.vim', {'on': ['asynctask','asynctaskedit','asynctasklist','asynctaskmarco', 'asynctaskprofile']}
" plug 'skywind3000/asyncrun.vim', {'on': ['asyncrun', 'asyncstop']}
if has('nvim')
    Plug 'nvim-treesitter/nvim-treesitter'
else
    " 语法高亮包，使用treesitter代替
    Plug 'sheerun/vim-polyglot'
endif
" 总是匹配tag
Plug 'valloric/MatchTagAlways', {'for': ['html', 'css', 'xml']}
" 显示颜色
if has('nvim')
    Plug 'norcalli/nvim-colorizer.lua'
else
    Plug 'RRethy/vim-hexokinase',  { 'do': 'make hexokinase' }
endif
" 加强版的 go to file
Plug 'tpope/vim-apathy'
" 查看启动时间
Plug 'dstein64/vim-startuptime', {'on':'StartupTime'}
Plug 'junegunn/goyo.vim', { 'on': 'Goyo', 'for': 'markdown' }
\ | Plug 'junegunn/limelight.vim', { 'on': 'Limelight' }

" coc插件列表，可根据需要进行删减
let g:coc_global_extensions = [
    \ 'coc-tsserver',
    \ 'coc-prettier',
    \ 'coc-calc',
    \ 'coc-vimlsp',
    \ 'coc-marketplace',
    \ 'coc-xml',
    \ 'coc-yank',
    \ 'coc-sh',
    \ 'coc-yaml',
    \ 'coc-git',
    \ 'coc-cmake',
    \ 'coc-snippets',
    \ 'coc-clangd',
    \ 'coc-explorer',
    \ 'coc-python',
    \ 'coc-json',
    \ 'coc-lists',
    \ 'coc-word',
    \ ]

    "\ 'coc-fzf-preview',
    "\ 'coc-bookmark',
    "\ 'coc-rainbow-fart',
    " \ 'coc-lists',
    " \ 'coc-rls',
    " \ 'coc-java',
    " \ 'coc-go',
    "\ 'coc-sql',
    "\ 'coc-lua'
    "\ 'coc-tabnine',
