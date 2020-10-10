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

if has('nvim')
    set pumblend=20 " 提示框透明
endif

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
" list设置
set nolist                                                  " 只有setlist后面的才会起作用
set listchars=tab:\|\→·,nbsp:⣿,extends:»,precedes:«
set listchars+=eol:¬
set listchars+=trail:·                                      " 尾部空白
set listchars+=space:\                                      " 空白

" let g:srcery_italic = 1
" let g:srcery_transparent_background = 1
" colorscheme srcery
" let g:forest_night_enable_italic = 1
" let g:forest_night_transparent_background = 1
" colorscheme forest-night
" colorscheme one
colorscheme ci_dark

" 搜索高亮
hi Search ctermfg=17 ctermbg=190 guifg=#000000 guibg=#ffff00

if g:HasPlug('coc.nvim')
    if !g:HasPlug('vim-multiple-cursors.vim')
        " coc多光标颜色
        hi CocCursorRange cterm=bold ctermfg=238 ctermbg=226 gui=bold guifg=#444444 guibg=#ffff00
    endif

    hi link CocErrorSign red
    hi link CocWarningSign yellow
    hi link CocInfoSign green
    hi link CocHintSign blue

    if g:HasCocPlug('coc-highlight')
        " coc 高亮单词
        au VimEnter * hi CocHighlightText guifg=#ffb6c1
    endif

    if g:HasCocPlug('coc-yank')
        " coc yank背景颜色
        hi HighlightedyankRegion cterm=bold ctermfg=238 ctermbg=226 gui=bold guifg=#444444 guibg=#ffa07a
    endif

    if g:HasCocPlug('coc-explorer') && has('nvim')
        " coc-explorer
        " None 而不是NONE
        hi CocExplorerNormalFloat guibg=None
    endif
endif

" statusline and tabline
if !g:HasPlug('vim-crystalline') && !g:HasPlug('vim-airline') && !g:HasPlug('lightline.vim')
    set statusline=2
    set showtabline=2                                   " 总是显示tab标签栏

    function! GitBranch()
        return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
    endfunction

    function! StatuslineGit()
        let l:branchname = GitBranch()
        return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
    endfunction

    set statusline=
    set statusline+=%#PmenuSel#
    set statusline+=%{StatuslineGit()}
    set statusline+=%#LineNr#
    set statusline+=\ %f
    set statusline+=%m
    if g:HasPlug('coc.nvim')
        set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
    endif
    set statusline+=%=
    set statusline+=%#CursorColumn#
    set statusline+=\ %y
    set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
    set statusline+=\[%{&fileformat}\]
    set statusline+=\ %p%%
    set statusline+=\ %l:%c
    set statusline+=
endif
