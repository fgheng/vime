call plug#begin('~/.cache/plugins')

" "{{--------coc 补全框架
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
"augroup load_coc
"    autocmd!
"    autocmd InsertEnter * call plug#load('neoclide/coc.nvim') | autocmd! load_cmd
"augroup END
" "}}

" "{{--------git
" Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive', {}
"Plug 'neoclide/vim-easygit'
"Plug 'rhysd/git-messenger.vim'
" "}}

" "{{--------web
Plug 'alvan/vim-closetag', {'for': ['html', 'htm', 'xml', 'xhtml']}
Plug 'valloric/MatchTagAlways', {'for': ['html', 'htm', 'xml', 'xhtml']}
" "}}

" "{{--------viml
Plug 'roxma/vim-hug-neovim-rpc', {'for': ['vim', 'viml']}
" "}}

" "{{--------markdown
Plug 'mzlogin/vim-markdown-toc', {'on': ['GenTocGFM',  'GenTocGitLab',  'GenTocMarked',  'GenTocModeline',  'GenTocRedcarpet']}
Plug 'godlygeek/tabular', {'for': ['markdown', 'md']}
Plug 'plasticboy/vim-markdown', {'for': ['markdown', 'md']}
"Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for':['md', 'markdown'] }
" "}}

" "{{--------latex
Plug 'lervag/vimtex', {'for': ['latex']}
" "}}

" "{{--------code check
Plug 'w0rp/ale', {'for': ['c', 'cpp', 'hpp', 'h']}
" "}}

" "{{--------code format
" Plug 'Chiel92/vim-autoformat'
"Plug 'sbdchd/neoformat'
" "}}

" "{{---------文档类
Plug 'scrooloose/nerdcommenter'
Plug 'vim-scripts/DoxygenToolkit.vim', {'on': ['Dox', 'DoxAuthor', 'DoxBlock', 'DoxLic', 'DoxUndoc' ]}
" vim中文文档
Plug 'yianwillis/vimcdoc'
" "}}

" "{{---------美化
Plug 'sheerun/vim-polyglot' " 代码着色
Plug 'Yggdroot/indentLine', { 'for': ['asm', 'h', 'hpp', 'c', 'cpp', 'python', 'js', 'ts', 'java', 'go', 'html', 'css', 'vim', 'sh', 'tex']}
Plug 'luochen1990/rainbow'
Plug 'mhinz/vim-startify'
Plug 'itchyny/lightline.vim'
"Plug 'liuchengxu/eleline.vim'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
Plug 'junegunn/limelight.vim', { 'on': 'Limelight' }
Plug 'ryanoasis/vim-devicons'
" "}}

" "{{----------工具
if !has('nvim')
    Plug 'vim-utils/vim-alt-mappings'
endif
Plug 'liuchengxu/vista.vim'
"Plug 'majutsushi/tagbar',  { 'on': ['TagbarToggle', 'TagbarOpen', 'TagbarClose'] }
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'terryma/vim-expand-region'
Plug 'simnalamburt/vim-mundo', {'on': 'MundoToggle'}
"使用coc list代替
"Plug 'Yggdroot/LeaderF',  { 'do': './install.sh', 'on': ['LeaderfFile', 'LeaderfBufTag', 'LeaderfBufTagAll', 'LeaderfBufferAll', 'LeaderfTabBufferAll', 'LeaderfLine', 'Leaderf', 'LeaderfMru'] }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
if has('nvim')
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins'}
else
  Plug 'Shougo/defx.nvim', {}
  Plug 'roxma/nvim-yarp', {}
  Plug 'roxma/vim-hug-neovim-rpc', {}
endif
Plug 'kristijanhusak/defx-git', {'on': 'Defx'}
Plug 'kristijanhusak/defx-icons', {}
if !has('gui_running') && executable('ranger')
    Plug 'francoiscabrol/ranger.vim'
endif
Plug 'rbgrouleff/bclose.vim', {'on': 'Bclose'}
Plug 'ntpeters/vim-better-whitespace'
"Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
"Plug 'andys8/vscode-jest-snippets'
Plug 't9md/vim-choosewin',  { 'on': 'ChooseWin' }
Plug 'Shougo/vinarise.vim', { 'on': 'Vinarise' }
Plug 'easymotion/vim-easymotion', {'on': ['<Plug>(easymotion-overwin-f)', '<Plug>(easymotion-overwin-line)']}
Plug 'rhysd/clever-f.vim'
Plug 'mg979/vim-visual-multi'
Plug 'voldikss/vim-translate-me', {'on': ['<Plug>TranslateW', '<Plug>TranslateW', '<Plug>TranslateWV', '<Plug>TranslateR', '<Plug>TranslateRV']  }
" Plug 'terryma/vim-smooth-scroll'
" Plug 'yuttie/comfortable-motion.vim'
" Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
" Plug 'vim-scripts/ZoomWin'
Plug 'troydm/zoomwintab.vim', {'on': 'ZoomWinTabToggle'}

" 编译运行
Plug 'tpope/vim-dispatch'
Plug 'radenling/vim-dispatch-neovim'
Plug 'thinca/vim-quickrun'
" "}}
"

" 其他
" 需要按照python-pysdl2 sdl2_mixer
" TODO 需要将依赖进行集成
Plug 'skywind3000/vim-keysound'
" 主题
Plug 'flazz/vim-colorschemes'
call plug#end()

" 判断是否有这个插件
function! HasPlug(plugName)
    if index(g:plugs_order, a:plugName) > -1
        return 1
    else
        return 0
    endif
endfunction
