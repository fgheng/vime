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
			\ ]
			"\ 'coc-bookmark',
			" \ 'coc-go' 直接使用go-languageserver
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

" 判断是否安装了这个插件
fun! HasCocPlug(cocPlugName)
	if index(g:coc_global_extensions, a:cocPlugName) > -1
		return v:true
	else
		return v:false
	endif
endfunc

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
inoremap <silent><expr> <M-j>
   \ pumvisible() ? "\<C-n>" : return

" ctrl k 向上选择
inoremap <silent><expr> <M-k>
   \ pumvisible() ? "\<C-p>" : return

" 回车补全选中的内容
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

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
function! s:GoToDefinition() abort
  if CocAction('jumpDefinition')
    return v:true
  endif

  let ret = execute("silent! normal \<C-]>")
  if ret =~ "Error" || ret =~ "错误"
    call searchdecl(expand('<cword>'))
  endif
endfunction
" nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gd :call <SID>GoToDefinition()<CR>
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" diagnostic 跳转
nmap <silent> <M-k> <Plug>(coc-diagnostic-prev)
nmap <silent> <M-j> <Plug>(coc-diagnostic-next)

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

if !HasPlug('coc-fzf')
	" Using CocList
	" Show all diagnostics
	nnoremap <silent> <space>a  :<C-u>CocList --normal diagnostics<cr>
	" Manage extensions
	nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
	nnoremap <silent> <space>s  :<C-u>CocList services<cr>
	" Show commands
	nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
	" Resume latest coc list
	nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
endif
" show coclist 早晚要放进去的
nnoremap <silent> <space>l  :<C-u>CocList<CR>

" 重构refactor,需要lsp支持
nmap <silent> <space>rf <Plug>(coc-refactor)
" nnoremap <silent> <space>L  :<C-u>CocList location<CR>
" 切换cwd
" nnoremap <silent> <space>`  :<C-u>CocList folders<cr>
" Fix autofix problem of current line
nmap <space>f  <Plug>(coc-fix-current)
" 重命名
nmap <space>rn <Plug>(coc-rename)

"---------------------------------------------- coc list
if !has('nvim') && !HasPlug('LeaderF') || !HasPlug('LeaderF') && !HasPlug('fzf.vim') && !HasPlug('coc-fzf')
	" 搜索当前工作目录下的所有文件, -W workspace中搜索
	nnoremap <silent> <M-f> :CocList --no-sort files <CR>
	nnoremap <silent> <M-b> :CocList buffers<CR>
	nnoremap <silent> <M-m> :CocList marks<CR>
	" tags, 需要先generate tags
	nnoremap <silent> <M-t> :CocList tags<cr>
	" nnoremap <silent> <M-s> :CocList words<cr>
	nnoremap <silent> <M-O> :CocList --auto-preview --interactive symbols<cr>
	nnoremap <silent> <M-o> :CocList --auto-preview outline<cr>
	nnoremap <silent> ? :CocList --auto-preview --interactive lines<cr>
	nnoremap <silent> <M-s> :CocList --interactive grep<cr>
	" nnoremap <silent> <M-s> :CocList --auto-preview --interactive lines<cr>
	" nnoremap <silent> <M-S> :CocList --interactive grep<cr>
	nnoremap <silent> <M-r> :CocList mru -A<CR>
	" nnoremap <silent> <M-w> :CocList --auto-preview --interactive words<CR>
	nnoremap <silent> <M-w> :exe 'CocList --normal --auto-preview --input='.expand('<cword>').' words'<cr>
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
	nmap <expr> <silent> <C-n> <SID>select_current_word()
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


if HasCocPlug('coc-yank')
	nnoremap <silent> <space>y  :<C-u>CocList yank<cr>
endif

if HasCocPlug('coc-explorer')
	nmap <silent> <F2> :CocCommand explorer <cr>
endif

if HasCocPlug('coc-translator')
	nmap  <M-e> <Plug>(coc-translator-e)
	nmap  <M-d> <Plug>(coc-translator-p)
endif

if HasCocPlug('coc-bookmark')
	if !HasPlug('vim-bookmarks')
		nmap <silent> ma <Plug>(coc-bookmark-annotate)
		nmap <silent> mm <Plug>(coc-bookmark-toggle)
		nmap <silent> ml :CocList bookmark<cr>
	endif
endif

" ----------------------- coc自定义命令
call coc#add_command('mundoToggle', 'MundoToggle', '显示撤回列表')
call coc#add_command('Goyo', 'Goyo', '阅读模式')
call coc#add_command('Zoomwintab', 'ZoomWinTabToggle', '最大化当前窗口')
" call coc#add_command('Tableize', 'Tableize', '格式化表格')
