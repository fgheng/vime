" 设置coc的根目录
let g:coc_data_home = $HOME."/.cache/vim/coc"
" coc插件
let g:coc_global_extensions =
			\ [
			\ 'coc-explorer',
			\ 'coc-python',
			\ 'coc-tsserver',
			\ 'coc-prettier',
			\ 'coc-snippets',
			\ 'coc-highlight',
			\ 'coc-calc',
			\ 'coc-git',
			\ 'coc-vimlsp',
			\ 'coc-marketplace',
			\ 'coc-xml',
			\ 'coc-yank',
			\ 'coc-lists',
			\ 'coc-json',
			\ 'coc-sh',
			\ 'coc-translator',
			\ 'coc-rls',
			\ 'coc-java',
			\ 'coc-go',
			\ 'coc-bookmark'
			\ ]
			" \ 'coc-go' 直接使用go-languageserver
			" \ 'coc-json',
			" \ 'coc-ecdict',
			" \ 'coc-tabnine',
			" \ 'coc-imselect',
			" \ 'coc-yaml',
			" \ 'coc-import-cost',
			" \ 'coc-svg',
			" \ 'coc-todolist',
			" \ 'coc-html',
			" \ 'coc-css',
			" \ 'coc-vetur',
			" \ 'coc-emmet',
			" \ 'coc-tailwindcss',
			" \ 'coc-rust-analyzer'
			" \ 'coc-java',
			" \ 'coc-phpls',
			" \ 'coc-emoji',
			" \ 'coc-post',

"---------------------------------------------- 补全提示框相关
" 检查当前光标前面是不是空白字符
function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" 优先级要高, alt j跳转到下一处
let g:coc_snippet_next = '<m-j>'
let g:coc_snippet_prev = '<m-k>'

inoremap <silent><expr> <TAB>
	\ pumvisible() ? "\<c-n>" :
	\ <SID>check_back_space() ? "\<TAB>" :
	\ coc#refresh()

inoremap <silent><expr> <S-TAB>
	\ pumvisible() ? "\<C-p>" :
	\ "\<C-h>"

" ctrl j 向下选择
inoremap <silent><expr> <c-j>
   \ pumvisible() ? "\<C-n>" : return

" ctrl k 向上选择
inoremap <silent><expr> <c-k>
   \ pumvisible() ? "\<C-p>" : return

" 回车补全选中的内容
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" 使用ctrl space强制触发补全, tab也可以强制触发补全
" inoremap <expr><c-space> pumvisible() ? "\<C-e>" : coc#refresh()

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
" command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
" command! -nargs=0 Run :call CocAction('codeAction')

" 高亮当前光标下的所有单词, 使用插件vim-cursorword代替
au CursorHold * silent call CocActionAsync('highlight')
" 不明白这是做什么的
au CursorHoldI * sil call CocActionAsync('showSignatureHelp')

" 定义, 引用等的跳转
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" diagnostic 跳转
nmap <silent> gk <Plug>(coc-diagnostic-prev)
nmap <silent> gj <Plug>(coc-diagnostic-next)

" 使用K悬浮显示定义
function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	else
		call CocAction('doHover')
	endif
endfunction
" nnoremap <silent> <space>k :call <SID>show_documentation()<CR>
nnoremap <silent> K :call <SID>show_documentation()<CR>
nnoremap <silent> <space>k :call CocActionAsync('showSignatureHelp')<CR>

augroup mygroup
	autocmd!
	" Setup formatexpr specified filetype(s).
	autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
	" Update signature help on jump placeholder
	autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" " Remap for do codeAction of current line
" nmap <leader>ac  <Plug>(coc-codeaction)
" " Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
" xmap <leader>a  <Plug>(coc-codeaction-selected)
" nmap <leader>a  <Plug>(coc-codeaction-selected)
" " Remap for do codeAction of current line
" nmap <leader>al  <Plug>(coc-codeaction)

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList --normal diagnostics<cr>
" Manage extensions
" nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
nnoremap <silent> <space>e  :<C-u>CocList services<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
vnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
" show coclist
nnoremap <silent> <space>l  :<C-u>CocList<CR>
" 重构refactor,需要lsp支持
nmap <silent> <space>rf <Plug>(coc-refactor)
" nnoremap <silent> <space>L  :<C-u>CocList location<CR>
if !HasPlug('fzf')
	nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
endif
" 切换cwd
nnoremap <silent> <space>`  :<C-u>CocList folders<cr>
" Fix autofix problem of current line
nmap <space>f  <Plug>(coc-fix-current)
" 重命名
nmap <space>rn <Plug>(coc-rename)

"---------------------------------------------- coc yank
nnoremap <silent> <space>y  :<C-u>CocList yank<cr>

"---------------------------------------------- coc list
if !HasPlug('LeaderF') && !HasPlug('fzf.vim')
	" 搜索当前工作目录下的所有文件, -W workspace中搜索
	nnoremap <silent> <M-f> :CocList files <CR>
	" 只搜索当前文件夹下的文件
	" nnoremap <silent> <M-f> :exec 'CocList files '.expand('%:h')<CR>

	" 显示buffers
	nnoremap <silent> <M-b> :CocList buffers<CR>
	" tags, 需要先generate tags
	" nnoremap <silent> <M-t> :CocList tags<cr>
	" nnoremap <silent> <M-s> :CocList words<cr>
	" symbols，不用outline了
	nnoremap <silent> <M-o> :CocList symbols<cr>
	" outline
	nnoremap <silent> <M-O> :CocList outline<cr>
	nnoremap <silent> <M-s> :CocList lines<cr>
	nnoremap <silent> <M-S> :CocList grep<cr>
	nnoremap <silent> <M-r> :CocList mru -A<CR>
	" marks 改用coc-bookmark
	" nnoremap <silent> <M-m> :CocList marks<CR>
	" 选择窗口, 不在使用而是使用插件
	" nnoremap <silent> <M-w> :CocList windows<CR>

	" command! -nargs=+ -complete=custom,s:GrepArgs Rg exe 'CocList grep '.<q-args>
	" function! s:GrepArgs(...)
	" let list = ['-S', '-smartcase', '-i', '-ignorecase', '-w', '-word',
	"         \ '-e', '-regex', '-u', '-skip-vcs-ignores', '-t', '-extension']
	"     return join(list, "\n")
	" endfunction
	nnoremap <silent> <M-w> :exe 'CocList -I --input='.expand('<cword>').' words'<cr>
endif

"---------------------------------------------- folders
" 根据具体文件设定cwd
"当前的 workspaceFolders，用于 session 使用。 需添加 `set sessionoptions+=globals` 让 session 支持 globals 变量。
set sessionoptions+=globals

"---------------------------------------------- 多光标
if !HasPlug("vim-visual-multi")
	" ctrl n下一个，ctrl p上一个
	" ctrl c 添加一个光标再按一次取消，
	nmap <silent> <C-c> <Plug>(coc-cursors-position)
	" nmap <silent> <c-down> <Plug>(coc-cursors-position) | <down>

	" function! s:select_down()
	"     <c-c>
	" endfunc
	" function! s:select_up() abort

	" endfunc
	" nmap <silent> <c-up> <SID>selcct_up()
	"nmap <silent> <C-d> <Plug>(coc-cursors-word)
	"xmap <silent> <C-d> <Plug>(coc-cursors-range)
	"ctrl d 选取所有v模式选择的内容
	"nmap <silent> <C-d> <Plug>(coc-cursors-word)*
	nmap <expr> <silent> <C-n> <SID>select_current_word()
	" xmap <silent> <C-s> <Plug>(coc-cursors-range)
	function! s:select_current_word()
		if !get(g:, 'coc_cursors_activated', 0)
			return "\<Plug>(coc-cursors-word)"
		endif
		return "*\<Plug>(coc-cursors-word):nohlsearch\<CR>"
	endfunc

	xmap <silent> <C-n> y/\V<C-r>=escape(@",'/\')<CR><CR>gN<Plug>(coc-cursors-range)gn
	nmap <silent> <C-a> :CocCommand document.renameCurrentWord<cr>

	" " use normal command like `<leader>xi(`
	nmap <leader>x  <Plug>(coc-cursors-operator)
endif

" ----------------------- coc自定义命令
call coc#add_command('mundoToggle', 'MundoToggle', '显示撤回列表')
call coc#add_command('Goyo', 'Goyo', '阅读模式')
call coc#add_command('Defx', 'Defx', '文件管理')
call coc#add_command('Zoomwintab', 'ZoomWinTabToggle', '最大化当前窗口')

" -------------------- coc explorer
nmap <silent> <F2> :CocCommand explorer <cr>

" -------------------- coc translator
nmap  <M-e> <Plug>(coc-translator-e)
nmap  <M-d> <Plug>(coc-translator-p)

" -------------------- coc bookmark
nmap <silent> ma <Plug>(coc-bookmark-annotate)
nmap <silent> mm <Plug>(coc-bookmark-toggle)
nmap <silent> ml :CocList bookmark<cr>
