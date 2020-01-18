function! s:patch_lucius_colors()
	if has('termguicolors')
		set termguicolors
	endif
	hi normal     ctermbg=NONE guibg=NONE
	hi linenr     ctermbg=NONE guibg=NONE
	hi signcolumn ctermbg=NONE guibg=NONE
endfunction

" 判断主题是否安装
if HasInstall('vim-colorschemes')
	autocmd! colorscheme space-vim-dark call s:patch_lucius_colors()
	colorscheme space-vim-dark
	" autocmd! colorscheme gruvbox call s:patch_lucius_colors()
	" colorscheme gruvbox
endif

"------------------------------------------------------"
" 设置vim搜索匹配项的颜色
if !HasPlug('fzf.vim')
    hi Search ctermfg=17 ctermbg=190 guifg=#00005f guibg=#dfff00
    hi IncSearch ctermfg=17 ctermbg=190 guifg=#00005f guibg=#dfff00
    hi QuickFixLine ctermfg=17 ctermbg=190 guifg=#00005f guibg=#dfff00
endif

if HasPlug('vim-visual-multi')
    " ???
    "highlight multiple_cursors_cursor ctermfg=15 ctermbg=1 guifg=white guibg=red
    "highlight link multiple_cursors_cursor Error
endif

if HasPlug('coc.nvim')
    if !HasPlug('vim-multiple-cursors.vim')
        " coc多光标颜色
        hi CocCursorRange cterm=bold ctermfg=238 ctermbg=226 gui=bold guifg=#444444 guibg=#ffff00
    endif

    " coc yank背景颜色
    hi HighlightedyankRegion cterm=bold ctermfg=238 ctermbg=226 gui=bold guifg=#444444 guibg=#ffff00
	" hi link CocErrorSign red
	" hi link CocWarningSign yellow
	" hi link CocInfoSign green
	" hi link CocHintSign blue
endif

if !HasPlug("vim-airline")
	" function! StatusDiagnostic() abort
	"     let info = get(b:, 'coc_diagnostic_info', {})
	"     if empty(info) | return '' | endif
	"     let msgs = []
	"     if get(info, 'error', 0)
	"         call add(msgs, 'E' . info['error'])
	"     endif
	"     if get(info, 'warning', 0)
	"         call add(msgs, 'W' . info['warning'])
	"     endif
	"     return join(msgs, ' '). ' ' . get(g:, 'coc_status', '')
	" endfunction
	" " set statusline=%F%m%r%h%w%=\ %{StatusDiagnostic()}\ [asc=%03.3b]\ [hex=%02.2B]\ [pos=%03l,%02v][%p%%]
	" set statusline+=%{StatusDiagnostic()}
endif
