" TODO 需要整理，同时要区分一下gui与非gui
if &term =~ '256color' && $TMUX != ''
    " disable Background Color Erase (BCE) so that color schemes
    " render properly when inside 256-color tmux and GNU screen.
    " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
    set t_ut=
endif

if has('termguicolors')
    " fix bug for vim
    if !has('nvim')
        if &term =~# '^screen\|^tmux'
            let &t_8f = "\e[38;2;%lu;%lu;%lum"
            let &t_8b = "\e[48;2;%lu;%lu;%lum"
        endif
    endif
    set termguicolors
endif

" 美化相关基本配置
" 高亮当前行列
set cursorline
set cursorcolumn
" 高亮textwidth后的一列
set colorcolumn=+1
" 光标
set guicursor=n-v-c-sm:block-Cursor,i-ci-ve:ver25-Cursor,r-cr-o:hor20
" 搜索高亮
set incsearch
" 高亮匹配内容
set hlsearch
" 搜索高亮颜色
hi Search ctermfg=17 ctermbg=190 guifg=#000000 guibg=#ffff00
" 只有set list后面的才会起作用
set nolist
if &list
    set listchars=tab:\|\→·,nbsp:⣿,extends:»,precedes:«
    set listchars+=eol:¬
    set listchars+=trail:·
    " set listchars+=space:␣
endif

" 设置弹出框大小, 0 则有多少显示多少
set pumheight=20
if has('nvim')
    set pumblend=20 " 提示框透明
endif

" 主题选择
" let g:srcery_italic = 1
" let g:srcery_transparent_background = 1
" colorscheme srcery
" let g:forest_night_enable_italic = 1
" let g:forest_night_transparent_background = 1
" colorscheme forest-night
" colorscheme one
" colorscheme ci_dark

let g:signify_sign_add    = '┃'
let g:signify_sign_change = '┃'
let g:signify_sign_delete = '•'
let g:signify_sign_show_count = 0
colorscheme xcodewwdc
augroup vim-colors-xcode
    autocmd!
    autocmd vim-colors-xcode ColorScheme * hi Comment        cterm=italic gui=italic
    autocmd vim-colors-xcode ColorScheme * hi SpecialComment cterm=italic gui=italic
    autocmd User SignifySetup
                \ execute 'autocmd! signify' |
                \ autocmd signify TextChanged,TextChangedI * call sy#start()
augroup END
" colorscheme sonokai

" coc 美化
if common#functions#HasPlug('coc.nvim')
    if !common#functions#HasPlug('vim-multiple-cursors.vim')
        " coc多光标颜色
        hi CocCursorRange cterm=bold ctermfg=238 ctermbg=226 gui=bold guifg=#444444 guibg=#ffff00
    endif

    hi link CocErrorSign red
    hi link CocWarningSign yellow
    hi link CocInfoSign green
    hi link CocHintSign blue

    if common#functions#HasCocPlug('coc-highlight')
        " coc 高亮单词
        au VimEnter * hi CocHighlightText guifg=#ffb6c1
    endif

    if common#functions#HasCocPlug('coc-yank')
        " coc yank背景颜色
        hi HighlightedyankRegion cterm=bold ctermfg=238 ctermbg=226 gui=bold guifg=#444444 guibg=#ffa07a
    endif

    if common#functions#HasCocPlug('coc-explorer') && has('nvim')
        " coc-explorer
        " None 而不是NONE
        hi CocExplorerNormalFloat guibg=None
    endif
endif

" 自定义状态栏和tab栏
if !common#functions#HasPlug('vim-crystalline') && !common#functions#HasPlug('vim-airline') && !common#functions#HasPlug('lightline.vim')
    set statusline=2
    set showtabline=2

    set statusline=
    set statusline+=%#ToolbarButton#
    set statusline+=%{common#functions#ModeLabel()}
    set statusline+=\%#Substitute#
    set statusline+=\ %f
    set statusline+=\%#IncSearch#
    set statusline+=\%{common#functions#ReadOnly()}
    set statusline+=\ %#PmenuSel#
    set statusline+=\ %{common#functions#GitBranch()}
    set statusline+=%{common#functions#GitCount()}
    set statusline+=%m
    if common#functions#HasPlug('coc.nvim')
        set statusline+=\ %{coc#status()}%{get(b:,'coc_current_function','')}
    endif
    set statusline+=%#black#
    set statusline+=\ %{common#functions#MethodOrFunction()}
    set statusline+=
    set statusline+=%=

    set statusline+=\ %#PmenuSel#
    set statusline+=\ [%{&fileformat}]
    set statusline+=\ %{&fileencoding?&fileencoding:&encoding}

    set statusline+=\ %#Substitute#
    set statusline+=\ %{common#functions#BufLineAndColInfo()}
    set statusline+=\ %#ToolbarButton#
    set statusline+=\ %{common#functions#FileType()}
    set statusline+=
endif
