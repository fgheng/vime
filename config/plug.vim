call plug#begin('~/.cache/plugins')

" "{{--------coc 补全框架
Plug 'neoclide/coc.nvim', { 'do': './install.sh nightly' }
" "}}

" "{{--------git
" Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
"Plug 'neoclide/vim-easygit'
"Plug 'rhysd/git-messenger.vim'
" "}}

" "{{--------web
Plug 'alvan/vim-closetag', {'for': ['html', 'htm', 'xml', 'xhtml']}
Plug 'valloric/MatchTagAlways', {'for': ['html', 'htm', 'xml', 'xhtml']}
" "}}

" "{{--------viml
Plug 'Shougo/neco-vim', {'for': ['vim', 'viml']}
Plug 'neoclide/coc-neco', {'for': ['vim', 'viml']}
Plug 'roxma/vim-hug-neovim-rpc', {'for': ['vim', 'viml']}
" "}}

" "{{--------markdown
Plug 'mzlogin/vim-markdown-toc', {'for': ['markdown', 'md']}
Plug 'plasticboy/vim-markdown', {'for': ['markdown', 'md']}
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'md'] }
" "}}

" "{{--------latex
Plug 'lervag/vimtex'
" "}}

" "{{--------code check
Plug 'w0rp/ale'
" "}}

" "{{--------code format
" Plug 'Chiel92/vim-autoformat'
"Plug 'sbdchd/neoformat'
" "}}

" "{{---------文档类
Plug 'scrooloose/nerdcommenter'
" Plug 'vim-scripts/DoxygenToolkit.vim', {'on': ['Dox', 'DoxAuthor', 'DoxBlock', 'DoxLic', 'DoxUndoc' ]}
" vim中文文档
Plug 'yianwillis/vimcdoc'
" "}}

" "{{---------美化
Plug 'sheerun/vim-polyglot'
Plug 'Yggdroot/indentLine', { 'for': ['asm', 'h', 'hpp', 'c', 'cpp', 'python', 'js', 'ts', 'java', 'go', 'html', 'css', 'vim', 'sh', 'tex']}
Plug 'luochen1990/rainbow'
Plug 'mhinz/vim-startify'
" Plug 'liuchengxu/eleline.vim'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" Plug 'bagrat/vim-buffet'
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
Plug 'junegunn/limelight.vim', { 'on': 'Limelight' }
Plug 'ryanoasis/vim-devicons'
" Plug 'junegunn/vim-emoji'
" "}}

" "{{----------工具
Plug 'majutsushi/tagbar',  { 'for': ['asm', 'h', 'hpp', 'c', 'cpp', 'python', 'js', 'ts', 'java', 'go', 'html', 'css', 'vim', 'sh', 'tex', 'md'] }
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'terryma/vim-expand-region'
Plug 'simnalamburt/vim-mundo', {'on': 'MundoToggle'}
Plug 'Yggdroot/LeaderF',  { 'do': './install.sh' }
if has('nvim')
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/defx.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'kristijanhusak/defx-git'
Plug 'kristijanhusak/defx-icons'
if has('nvim')
    Plug 'rbgrouleff/bclose.vim'
endif
Plug 'francoiscabrol/ranger.vim'
"Plug 'Lokaltog/neoranger'
Plug 'rbgrouleff/bclose.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'andys8/vscode-jest-snippets'
Plug 't9md/vim-choosewin',  { 'on': 'ChooseWin' }
Plug 'Shougo/vinarise.vim', { 'on': 'Vinarise' }
Plug 'easymotion/vim-easymotion'
Plug 'rhysd/clever-f.vim'
Plug 'mg979/vim-visual-multi'
Plug 'voldikss/vim-translate-me', {'on': ['<Plug>Translate', '<Plug>TranslateW']  }
" Plug 'terryma/vim-smooth-scroll'
" Plug 'yuttie/comfortable-motion.vim'
" Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
" Plug 'vim-scripts/ZoomWin'
Plug 'troydm/zoomwintab.vim'
Plug 'tpope/vim-dispatch'
Plug 'radenling/vim-dispatch-neovim'
" "}}
"
call plug#end()
