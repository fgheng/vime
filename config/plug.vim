call plug#begin('~/.cache/plugins')

" -------- 补全插件
Plug 'neoclide/coc.nvim', { 'tag': '*', 'branch': 'release' }

" --------- git插件
" Plug 'airblade/vim-gitgutter'
"Plug 'tpope/vim-fugitive'
"Plug 'neoclide/vim-easygit'
"Plug 'rhysd/git-messenger.vim'

" --------- 前端插件
Plug 'alvan/vim-closetag'
Plug 'valloric/MatchTagAlways'

" --------- markdown 插件
"Plug 'mzlogin/vim-markdown-toc', {'on': ['GenTocGFM',  'GenTocGitLab',  'GenTocMarked',  'GenTocModeline',  'GenTocRedcarpet']}
"Plug 'godlygeek/tabular', {'for': ['markdown', 'md']}
"Plug 'plasticboy/vim-markdown', {'for': ['markdown', 'md']}
"Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for':['md', 'markdown'] }

" --------- latex 插件
Plug 'lervag/vimtex' " pip install remote-neovim  zathura-pdf-mupdf xdotool texlive-most texlive-lang
Plug 'wannesm/wmgraphviz.vim'
" "{{---------文档类
Plug 'scrooloose/nerdcommenter' " 注释
"Plug 'vim-scripts/DoxygenToolkit.vim', {'on': ['Dox', 'DoxAuthor', 'DoxBlock', 'DoxLic', 'DoxUndoc' ]}
" vim中文文档
Plug 'yianwillis/vimcdoc'
" "}}

" --------- ui插件
" 主题
Plug 'flazz/vim-colorschemes'
"" 代码着色
" Plug 'sheerun/vim-polyglot'
"" python高亮
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
" 对齐线
" Plug 'Yggdroot/indentLine'
Plug 'mhinz/vim-startify', {'on': 'Startify'}
" 各种line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" 关灯读小说
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
Plug 'junegunn/limelight.vim', { 'on': 'Limelight' }
" vim图标, 用coc-explorer 只需要字体支持就好了
" Plug 'ryanoasis/vim-devicons'

" "{{----------工具
" 彩虹括号
Plug 'luochen1990/rainbow'
if !has('nvim')
	" vim alt工具
    Plug 'vim-utils/vim-alt-mappings'
endif
Plug 'liuchengxu/vista.vim'
 Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
" 撤回
Plug 'simnalamburt/vim-mundo', {'on': 'MundoToggle'}
" 各种list
"Plug 'terryma/vim-expand-region'
" Plug 'Yggdroot/LeaderF',  { 'do': './install.sh', 'on': ['LeaderfFile', 'LeaderfBufTag', 'LeaderfBufTagAll', 'LeaderfBufferAll', 'LeaderfTabBufferAll', 'LeaderfLine', 'Leaderf', 'LeaderfMru'] }
" Plug 'junegunn/fzf', { 'dir': '~/.cache/fzf', 'do': './install --all' }
" Plug 'junegunn/fzf.vim'
" Plug 'mcchrish/nnn.vim'
"if has('nvim')
"  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins'}
"else
"  Plug 'Shougo/defx.nvim', {}
"  Plug 'roxma/nvim-yarp', {}
"  Plug 'roxma/vim-hug-neovim-rpc', {}
"endif
" Plug 'kristijanhusak/defx-icons', {'on': 'Defx'}
" if !has('gui_running') && executable('ranger')
"     "Plug 'francoiscabrol/ranger.vim'
" endif
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
