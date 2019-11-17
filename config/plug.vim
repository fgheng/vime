call plug#begin('~/.cache/plugins')

Plug 'neoclide/coc.nvim', { 'tag': '*', 'branch': 'release' }
Plug 'alvan/vim-closetag'
Plug 'valloric/MatchTagAlways'
Plug 'lervag/vimtex' " pip install remote-neovim  zathura-pdf-mupdf xdotool texlive-most texlive-lang
Plug 'wannesm/wmgraphviz.vim'
Plug 'scrooloose/nerdcommenter' " 注释
" vim中文文档
Plug 'yianwillis/vimcdoc'
" 主题
Plug 'flazz/vim-colorschemes'
Plug 'Rigellute/shades-of-purple.vim'
Plug 'haishanh/night-owl.vim'
Plug 'tomasiser/vim-code-dark'
Plug 'dunstontc/vim-vscode-theme'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'mhinz/vim-startify', {'on': 'Startify'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" 关灯读小说
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
Plug 'junegunn/limelight.vim', { 'on': 'Limelight' }

Plug 'luochen1990/rainbow'
Plug 'liuchengxu/vista.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
" 撤回
Plug 'simnalamburt/vim-mundo', {'on': 'MundoToggle'}
" 删除buffer
Plug 'rbgrouleff/bclose.vim', {'on': 'Bclose'}
" 尾部空格
Plug 'ntpeters/vim-better-whitespace'
" 代码段
Plug 'honza/vim-snippets'
"Plug 'SirVer/ultisnips'
Plug 't9md/vim-choosewin',  { 'on': 'ChooseWin' }
Plug 'Shougo/vinarise.vim', { 'on': 'Vinarise' }
Plug 'easymotion/vim-easymotion', {'on': ['<Plug>(easymotion-overwin-f)', '<Plug>(easymotion-overwin-line)']}
Plug 'rhysd/clever-f.vim'
" 多光标
Plug 'mg979/vim-visual-multi'
Plug 'troydm/zoomwintab.vim', {'on': 'ZoomWinTabToggle'}
" 编译运行
Plug 'thinca/vim-quickrun'
"
Plug 'christoomey/vim-tmux-navigator'
" -------- 其他
" 需要按照python-pysdl2 sdl2_mixer
" TODO 需要将依赖进行集成
"Plug 'skywind3001/vim-keysound'


call plug#end()

" 判断是否有这个插件
function! HasPlug(plugName)
    if index(g:plugs_order, a:plugName) > -1
        return 1
    else
        return 0
    endif
endfunction
