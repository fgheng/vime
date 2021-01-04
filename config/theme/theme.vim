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
        " if &term =~# '^screen\|^tmux'
        let &t_8f = "\e[38;2;%lu;%lu;%lum"
        let &t_8b = "\e[48;2;%lu;%lu;%lum"
        " endif
    endif
    " enable true color
    set termguicolors
endif
" set termguicolors

" 美化相关基本配置
" 高亮当前行列
set cursorline
set colorcolumn=81
" 光标
set guicursor=n-v-c-sm:block-Cursor,i-ci-ve:ver25-Cursor,r-cr-o:hor20
" 搜索高亮
set incsearch
" 高亮匹配内容
set hlsearch
set list
" 只有set list下面的才会起作用
if &list
    set listchars=tab:\|\→·,nbsp:⣿,extends:»,precedes:«
    set listchars+=eol:¬
    set listchars+=trail:·
    " set listchars+=space:␣
endif
" 搜索高亮颜色
hi Search ctermfg=17 ctermbg=190 guifg=#000000 guibg=#ffff00

" 设置弹出框大小, 0 则有多少显示多少
set pumheight=20
if has('nvim')
    set pumblend=20 " 提示框透明
endif

" 主题选择
" let g:srcery_italic = 1
" let g:srcery_transparent_background = 1
" silent! colorscheme srcery

let g:forest_night_enable_italic = 1
let g:forest_night_transparent_background = 1
silent! colorscheme forest-night

" silent! colorscheme one

" silent! colorscheme ci_dark

" silent! colorscheme sonokai

" let g:signify_sign_add    = '┃'
" let g:signify_sign_change = '┃'
" let g:signify_sign_delete = '•'
" let g:signify_sign_show_count = 0
" silent! colorscheme xcodedark
" augroup vim_colors_xcode_group
    " autocmd!
    " autocmd vim_colors_xcode_group ColorScheme * hi Comment        cterm=italic gui=italic
    " autocmd vim_colors_xcode_group ColorScheme * hi SpecialComment cterm=italic gui=italic
    " autocmd User SignifySetup
                " \ execute 'autocmd! signify' |
                " \ autocmd signify TextChanged,TextChangedI * call sy#start()
" augroup END

" let g:tokyonight_style = 'storm' " available: night, storm
" let g:tokyonight_enable_italic = 1
" let g:tokyonight_transparent_background = 1
" let g:tokyonight_menu_selection_background = 'red'
" let g:tokyonight_current_word = 'underline'
" silent! colorscheme tokyonight

" set background=dark
" let g:pencil_gutter_color = 1
" let g:pencil_spell_undercurl = 1
" let g:pencil_higher_contrast_ui = 0
" silent! colorscheme pencil
"
" let g:oceanic_next_terminal_bold = 1
" let g:oceanic_next_terminal_italic = 1
" silent! colorscheme OceanicNext

" autocmd InsertEnter * hi CursorLineNr ctermbg=blue
" autocmd InsertLeave * hi CursorLineNr ctermbg=green
" silent! colorscheme edge

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
