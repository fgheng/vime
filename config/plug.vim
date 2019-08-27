call plug#begin('~/.cache/plugins')

" -------- 补全插件
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
"Plug 'ncm2/ncm2'
"Plug 'mhartington/nvim-typescript' " ts
"Plug 'ncm2/ncm2-jedi'
"Plug 'ncm2/ncm2-pyclang' " c/c++
"Plug 'ncm2/ncm2-racer' " rust
"Plug 'ncm2/ncm2-vim' " viml
"Plug 'ObserverOfTime/ncm2-jc2' " java
"Plug 'ncm2/ncm2-cssomni' " css

"Plug 'ycm-core/YouCompleteMe'
"Plug 'w0rp/ale' " 可以使用coc代替了
"Plug 'autozimu/LanguageClient-neovim', {
"    \ 'branch': 'next',
"    \ 'do': 'bash install.sh',
"    \ }
"Plug 'jupyter-vim/jupyter-vim'

" --------- git插件
" Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
"Plug 'neoclide/vim-easygit'
"Plug 'rhysd/git-messenger.vim'

" --------- 前端插件
Plug 'alvan/vim-closetag'
Plug 'valloric/MatchTagAlways'

" --------- markdown 插件
"Plug 'mzlogin/vim-markdown-toc', {'on': ['GenTocGFM',  'GenTocGitLab',  'GenTocMarked',  'GenTocModeline',  'GenTocRedcarpet']}
"Plug 'godlygeek/tabular', {'for': ['markdown', 'md']}
Plug 'plasticboy/vim-markdown', {'for': ['markdown', 'md']}
"Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for':['md', 'markdown'] }

" --------- latex 插件
"Plug 'lervag/vimtex', {'for': ['latex']}


" "{{---------文档类
Plug 'scrooloose/nerdcommenter'
"Plug 'vim-scripts/DoxygenToolkit.vim', {'on': ['Dox', 'DoxAuthor', 'DoxBlock', 'DoxLic', 'DoxUndoc' ]}
" vim中文文档
Plug 'yianwillis/vimcdoc'
" "}}

" --------- ui插件
" 主题
Plug 'flazz/vim-colorschemes'
" 代码着色
Plug 'sheerun/vim-polyglot'
" 对齐线
"Plug 'Yggdroot/indentLine'
"Plug 'nathanaelkane/vim-indent-guides'
Plug 'mhinz/vim-startify'
" 各种line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'itchyny/lightline.vim'
"Plug 'taigacute/spaceline.vim'
"Plug 'liuchengxu/eleline.vim'
" 关灯读小说
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
Plug 'junegunn/limelight.vim', { 'on': 'Limelight' }
" vim图标
Plug 'ryanoasis/vim-devicons'

" "{{----------工具
" 彩虹括号
Plug 'luochen1990/rainbow'
"Plug 'roxma/vim-hug-neovim-rpc', {'for': ['vim', 'viml']}
" 代码格式化
"Plug 'Chiel92/vim-autoformat'
"Plug 'sbdchd/neoformat'
if !has('nvim')
    Plug 'vim-utils/vim-alt-mappings'
endif
" vista使用coclist outline代替了
Plug 'liuchengxu/vista.vim'
"Plug 'majutsushi/tagbar',  { 'on': ['TagbarToggle', 'TagbarOpen', 'TagbarClose'] }
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
" 撤回
Plug 'simnalamburt/vim-mundo', {'on': 'MundoToggle'}
" 各种list
"Plug 'terryma/vim-expand-region'
"Plug 'Yggdroot/LeaderF',  { 'do': './install.sh', 'on': ['LeaderfFile', 'LeaderfBufTag', 'LeaderfBufTagAll', 'LeaderfBufferAll', 'LeaderfTabBufferAll', 'LeaderfLine', 'Leaderf', 'LeaderfMru'] }
"Plug 'junegunn/fzf', { 'dir': '~/.cache/fzf', 'do': './install --all' }
"Plug 'junegunn/fzf.vim'
if has('nvim')
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins'}
else
  Plug 'Shougo/defx.nvim', {}
  Plug 'roxma/nvim-yarp', {}
  Plug 'roxma/vim-hug-neovim-rpc', {}
endif
Plug 'kristijanhusak/defx-icons', {'on': 'Defx'}
if !has('gui_running') && executable('ranger')
    Plug 'francoiscabrol/ranger.vim'
endif
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
" Plug 'terryma/vim-smooth-scroll'
" Plug 'yuttie/comfortable-motion.vim'
" Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
" Plug 'vim-scripts/ZoomWin'
Plug 'troydm/zoomwintab.vim', {'on': 'ZoomWinTabToggle'}
"Plug 'zhaocai/GoldenView.Vim'
" 编译运行
Plug 'thinca/vim-quickrun'
"Plug 'tpope/vim-dispatch'
"Plug 'radenling/vim-dispatch-neovim'

" -------- 其他
" 需要按照python-pysdl2 sdl2_mixer
" TODO 需要将依赖进行集成
"Plug 'skywind3000/vim-keysound'


call plug#end()

" 判断是否有这个插件
function! HasPlug(plugName)
    if index(g:plugs_order, a:plugName) > -1
        return 1
    else
        return 0
    endif
endfunction
