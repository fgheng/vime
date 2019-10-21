" let g:coc_extension_root = "~/.cache/coc/extensions"
" coc插件
let g:coc_global_extensions =
			\ [
			\ 'coc-explorer',
			\ 'coc-python',
			\ 'coc-tsserver',
			\ 'coc-java',
			\ 'coc-rls',
			\ 'coc-html',
			\ 'coc-css',
			\ 'coc-emmet',
			\ 'coc-tailwindcss',
			\ 'coc-prettier',
			\ 'coc-yaml',
			\ 'coc-snippets',
			\ 'coc-json',
			\ 'coc-calc',
			\ 'coc-git',
			\ 'coc-vimlsp',
			\ 'coc-highlight',
			\ 'coc-marketplace',
			\ 'coc-xml',
			\ 'coc-yank',
			\ 'coc-lists',
			\ 'coc-import-cost',
			\ 'coc-imselect',
			\ 'coc-tabnine',
			\ 'coc-ecdict',
			\ 'coc-svg',
			\ 'coc-sh',
			\ 'coc-todolist',
			\ 'coc-translator',
			\ ]
			" \ 'coc-vetur',
			" \ 'coc-phpls',
			" \ 'coc-emoji',
			" \ 'coc-post',
" web
" coc-tsserver coc-html coc-css coc-tailwindcss coc-prettier coc-eslint
" eslint 代码规范检查
" prettier 前端代码格式化

"---------------------------------------------- 补全提示框相关
" 检查当前光标前面是不是空白字符
function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"""
" 优先级要高
let g:coc_snippet_next = '<m-j>'
let g:coc_snippet_prev = '<m-k>'

inoremap <silent><expr> <TAB>
	\ pumvisible() ? "\<C-n>" :
	\ <SID>check_back_space() ? "\<TAB>" :
	\ coc#refresh()

inoremap <silent><expr> <S-TAB>
	\ pumvisible() ? "\<C-p>" :
	\ "\<C-h>"

"inoremap <silent><expr> <c-j>
"    \ pumvisible() ? "\<C-n>" : return

"inoremap <silent><expr> <c-k>
"    \ pumvisible() ? "\<C-p>" : return

" 回车补全选中的内容
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" 使用ctrl space强制触发补全
inoremap <expr><c-space> pumvisible() ? "\<C-e>" : coc#refresh()
" 使用 :Format 进行代码格式化
"function FormatCode()
"    if mode() == 'v' || mode() == 'V'
"        call <Plug>(coc-format-selected)
"    else
"        call CocAction('format')
"    endif
"endfunction
command! -nargs=0 Format :call CocAction('format')
" 使用 :Fold 对代码进行折叠
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
" 使用 :Or 组织import
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
command! -nargs=0 Run :call CocAction('codeAction')

" Highlight symbol under cursor on CursorHold
au CursorHold * silent call CocActionAsync('highlight')
au CursorHoldI * sil call CocActionAsync('showSignatureHelp')

" 定义, 引用等的跳转
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" 使用K悬浮显示定义
function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	else
		call CocAction('doHover')
	endif
endfunction
nnoremap <silent> K :call <SID>show_documentation()<CR>
nnoremap <silent> <space>k :call CocActionAsync('showSignatureHelp')<CR>

augroup mygroup
	autocmd!
	" Setup formatexpr specified filetype(s).
	autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
	" Update signature help on jump placeholder
	autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
" Remap for do codeAction of current line
nmap <leader>al  <Plug>(coc-codeaction)

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList --normal diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
vnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
" show coclist
nnoremap <silent> <space>l  :<C-u>CocList<CR>
if !HasPlug('fzf')
	nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
endif
" 切换cwd
nnoremap <silent> <space>`  :<C-u>CocList folders<cr>
" diagnostic 跳转
nmap <silent> <space>k <Plug>(coc-diagnostic-prev)
nmap <silent> <space>j <Plug>(coc-diagnostic-next)
" Fix autofix problem of current line
nmap <space>f  <Plug>(coc-fix-current)
" 重命名
nmap <space>rn <Plug>(coc-rename)

"---------------------------------------------- coc yank
nnoremap <silent> <space>y  :<C-u>CocList yank<cr>

"---------------------------------------------- coc list
if !HasPlug('LeaderF') && !HasPlug('fzf.vim')
	nnoremap <silent> <M-f> :CocList files<CR>
	nnoremap <silent> <M-b> :CocList buffers<CR>
	nnoremap <silent> <M-t> :CocList tags<cr>
	nnoremap <silent> <M-s> :CocList words<cr>
	nnoremap <silent> <M-S> :CocList grep<cr>
	nnoremap <silent> <M-r> :CocList mru -A<CR>
	nnoremap <silent> <M-m> :CocList marks<CR>
	nnoremap <silent> <M-w> :CocList windows<CR>
	nnoremap <silent> <M-o> :CocList outline<CR>
	nnoremap <silent> <M-c> :exe 'CocList -I --input='.expand('<cword>').' words'<cr>
endif

"---------------------------------------------- folders
" 根据具体文件设定cwd
"当前的 workspaceFolders，用于 session 使用。 需添加 `set sessionoptions+=globals` 让 session 支持 globals 变量。
set sessionoptions+=globals
"autocmd FileType python let b:coc_root_patterns = ['.git', '.env']
"autocmd FileType c,cpp let b:coc_root_patterns = ['.git', '.ccls', 'compile_flags.txt']

"---------------------------------------------- 多光标
if !HasPlug("vim-visual-multi")
	" ctrl n下一个，ctrl p上一个
	" ctrl c 添加一个光标再按一次取消，
	nmap <silent> <C-c> <Plug>(coc-cursors-position)
	"nmap <silent> <C-d> <Plug>(coc-cursors-word)
	"xmap <silent> <C-d> <Plug>(coc-cursors-range)
	"ctrl d 选取所有v模式选择的内容
	"nmap <silent> <C-d> <Plug>(coc-cursors-word)*
	nmap <expr> <silent> <C-d> <SID>select_current_word()
	function! s:select_current_word()
		if !get(g:, 'coc_cursors_activated', 0)
			return "\<Plug>(coc-cursors-word)"
		endif
		return "*\<Plug>(coc-cursors-word):nohlsearch\<CR>"
	endfunc
	xmap <silent> <C-d> y/\V<C-r>=escape(@",'/\')<CR><CR>gN<Plug>(coc-cursors-range)gn
	nmap <silent> <C-a> :CocCommand document.renameCurrentWord<cr>
	" use normal command like `<leader>xi(`
	nmap <leader>x  <Plug>(coc-cursors-operator)
	" 重构refactor,需要lsp支持
	nmap <silent> <space>rf <Plug>(coc-refactor)
endif

" ----------------------- coc自定义命令
call coc#add_command('mundoToggle', 'MundoToggle', '显示撤回列表')
call coc#add_command('Goyo', 'Goyo', '阅读模式')
call coc#add_command('Defx', 'Defx', '文件管理')
call coc#add_command('Zoomwintab', 'ZoomWinTabToggle', '最大化当前窗口')

" ---------------------- coc smartf
"  不好用
" 这个只能搜索单词开头, 不过可以在配置中进行配置
" press <esc> to cancel.
" nmap f <Plug>(coc-smartf-forward)
" nmap F <Plug>(coc-smartf-backward)
" nmap ; <Plug>(coc-smartf-repeat)
" nmap , <Plug>(coc-smartf-repeat-opposite)

" augroup Smartf
"   autocmd User SmartfEnter :hi Conceal ctermfg=220 guifg=#6638F0
"   autocmd User SmartfLeave :hi Conceal ctermfg=239 guifg=#504945
" augroup end

" --------------------- coc terminal
" 也是不好用
" nmap <F8> <plug>(coc-terminal-toggle)

" -------------------- coc explorer
nmap <F2> :CocCommand explorer<cr>

" -------------------- coc translator
nmap  <M-e> <Plug>(coc-translator-e)
nmap  <M-d> <Plug>(coc-translator-p)
