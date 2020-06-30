call plug#begin(g:plugins_path)

" 补全类插件
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" 检索类插件
Plug 'junegunn/fzf.vim'
\ | Plug 'junegunn/fzf', { 'do': './install --bin' }
\ | Plug 'tpope/vim-fugitive'
" 文档类插件
Plug 'scrooloose/nerdcommenter'
" 生成注释文档, 不适用默认的映射，这样启动更快
Plug 'kkoomen/vim-doge', {'on': ['DogeGenerate']}
" Plug 'vim-scripts/DoxygenToolkit.vim'

" 主题类插件
Plug 'rakr/vim-one'
Plug 'morhetz/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'sainnhe/forest-night'
Plug 'srcery-colors/srcery-vim'

" 底栏
Plug 'itchyny/lightline.vim'
" 彩虹括号
Plug 'luochen1990/rainbow'
" 高亮类插件
Plug 'sheerun/vim-polyglot'
" python高亮，异步
if has('nvim')
    Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins', 'for': 'python'}
endif
" c++ 高亮
Plug 'jackguo380/vim-lsp-cxx-highlight', {
            \ 'for': [
            \ 'cpp', 'c', 'cu', 'h', 'hpp', 'hh', 'objc', 'objcpp'
            \ ]}
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
Plug 'Yggdroot/indentLine', {'on': 'IndentLinesEnable'}
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
" ranger
Plug 'francoiscabrol/ranger.vim', {'on':
           \ [
           \ 'RangerCurrentFile', 'RangerWorkingDirectory'
           \ ]}
" buffer close
Plug 'rbgrouleff/bclose.vim', {'on': 'Bclose'}
" latex插件
Plug 'lervag/vimtex', {'for': 'tex'}
" 平滑滚动
Plug 'psliwka/vim-smoothie'
" zeal
Plug 'KabbAmine/zeavim.vim'
" 窗口聚焦
" Plug 'TaDaa/vimade'
" 在命令行使用linux命令新建文件文件夹重命名当前buffer等
Plug 'tpope/vim-eunuch'
Plug 'davinche/DrawIt', {'on': 'DrawIt'}
" 窗口放大
Plug 'troydm/zoomwintab.vim', {'on': 'ZoomWinTabToggle'}

call plug#end()

" 判断该插件是否已经安装
fun! HasInstall(plugin_name) abort
    let s:plugin_path = g:plugins_path . "/" . a:plugin_name
    if !empty(glob(s:plugin_path))
        return v:true
    else
        return v:false
    endif
endfunction

" 判断插件列表是否有这个插件
fun! HasPlug(plugName)
    if index(g:plugs_order, a:plugName) > -1
        return v:true
    else
        return v:false
    endif
endfunction
