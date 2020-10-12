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

" let g:signify_sign_add    = '┃'
" let g:signify_sign_change = '┃'
" let g:signify_sign_delete = '•'
" let g:signify_sign_show_count = 0
" colorscheme xcodewwdc
" augroup vim-colors-xcode
    " autocmd!
    " autocmd vim-colors-xcode ColorScheme * hi Comment        cterm=italic gui=italic
    " autocmd vim-colors-xcode ColorScheme * hi SpecialComment cterm=italic gui=italic
    " autocmd User SignifySetup
                " \ execute 'autocmd! signify' |
                " \ autocmd signify TextChanged,TextChangedI * call sy#start()
" augroup END
colorscheme sonokai

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
    if common#functions#HasPlug('coc.nvim')
        set statusline+=%{coc#status()}%{get(b:,'coc_current_function','')}
    endif
    set statusline+=%=
    set statusline+=%#CursorColumn#
    set statusline+=\ %y
    set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
    set statusline+=\[%{&fileformat}\]
    set statusline+=\ %p%%
    set statusline+=\ %l:%c
    set statusline+=

    " tabline
    if exists("+showtabline")
    " Rename tabs to show tab number.
    " (Based on http://stackoverflow.com/questions/5927952/whats-implementation-of-vims-default-tabline-function)

        function! MyTabLine()
            let s = ''
            let t = tabpagenr()
            let i = 1
            while i <= tabpagenr('$')
                let buflist = tabpagebuflist(i)
                let winnr = tabpagewinnr(i)
                let s .= '%' . i . 'T'
                let s .= (i == t ? '%1*' : '%2*')

                " let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
                " let s .= ' '
                let s .= (i == t ? '%#TabNumSel#' : '%#TabNum#')
                let s .= ' ' . i . ' '
                let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')

                let bufnr = buflist[winnr - 1]
                let file = bufname(bufnr)
                let buftype = getbufvar(bufnr, '&buftype')

                if buftype == 'help'
                    let file = 'help:' . fnamemodify(file, ':t:r')

                elseif buftype == 'quickfix'
                    let file = 'quickfix'

                elseif buftype == 'nofile'
                    if file =~ '\/.'
                        let file = substitute(file, '.*\/\ze.', '', '')
                    endif

                else
                    let file = pathshorten(fnamemodify(file, ':p:~:.'))
                    if getbufvar(bufnr, '&modified')
                        let file = '+' . file
                    endif

                endif

                if file == ''
                    let file = '[No Name]'
                endif

                let s .= ' ' . file

                let nwins = tabpagewinnr(i, '$')
                if nwins > 1
                    let modified = ''
                    for b in buflist
                        if getbufvar(b, '&modified') && b != bufnr
                            let modified = '*'
                            break
                        endif
                    endfor
                    let hl = (i == t ? '%#WinNumSel#' : '%#WinNum#')
                    let nohl = (i == t ? '%#TabLineSel#' : '%#TabLine#')
                    let s .= ' ' . modified . '(' . hl . winnr . nohl . '/' . nwins . ')'
                endif

                if i < tabpagenr('$')
                    let s .= ' %#TabLine#'
                    " let s .= ' %#TabLine#|'
                else
                    let s .= ' '
                endif

                let i = i + 1

            endwhile

            let s .= '%T%#TabLineFill#%='
            let s .= (tabpagenr('$') > 1 ? '%999XX' : 'X')
            return s

        endfunction

        " set showtabline=1
        highlight! TabNum term=bold,underline cterm=bold,underline ctermfg=1 ctermbg=7 gui=bold,underline guibg=Grey
        highlight! TabNumSel term=bold,reverse cterm=bold,reverse ctermfg=1 ctermbg=7 gui=bold
        highlight! WinNum term=bold,underline cterm=bold,underline ctermfg=11 ctermbg=7 guifg=DarkBlue guibg=Grey
        highlight! WinNumSel term=bold cterm=bold ctermfg=7 ctermbg=14 guifg=DarkBlue guibg=Grey

        set tabline=%!MyTabLine()

    endif " exists("+showtabline")
endif
