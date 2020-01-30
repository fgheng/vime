" 所有插件的配置都写在一个文件里，加载速度更快，但是不适合扩展
"
" ------------------ 基础配置 ------------------------
set number
set relativenumber " 设置相对行号
set cursorline "高亮当前行
set incsearch " 搜索时即高亮
set hlsearch " 高亮匹配内容
set wrap
set smartindent " 智能缩进
set autoindent " 自动换行缩进
set linebreak "软折行
set noswapfile " 禁止生成swap文件
set colorcolumn=80 " 高亮第80行
set hidden " 终端隐藏后不结束
set ignorecase " 忽略大小写
set infercase       " Adjust case in insert completion mode
set history=500 " 历史命令
set splitbelow " 在下方分割
set autoindent " 使用空格进行缩进
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set smartindent
set shiftround
set list
set listchars=tab:→·,nbsp:⣿,extends:»,precedes:«
set listchars+=eol:¬
set listchars+=trail:· " 尾部空白
set listchars+=space:· " 空白
set pumheight=20 " 设置弹出框大小, 0 则有多少显示多少

set nobackup
set noswapfile
set autoread " 文件在外部被修改过，重新读入
set autowrite " 自动写回
set confirm " 显示确认对话框
set laststatus=2
set showtabline=0
set noshowmode
set timeout ttimeout
set timeoutlen=500
set ttimeoutlen=10
set updatetime=100
set shortmess+=c

set mouse=a " 允许使用鼠标
set cmdheight=1

au FileType c,cpp,java set mps+==:;

if has('nvim')
    "set signcolumn=auto:2 " neovim的新特性，标识列自动变化
    set signcolumn=yes
else
    set scl=yes
endif

"记住退出位置
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
" ------------------ 基础配置 ------------------------


" ------------------ 插件列表 ------------------------
" 插件存储路径
let s:plugins_path = '~/.cache/plugins'

" 依赖的软件
" nodejs, npm, ripgrep, clang, ctags, zathura-pdf-mupdf, texlive-most,
" texlive-lang, remote-neovim, pysdl2, sdl2_mixer

call plug#begin(s:plugins_path)

Plug 'neoclide/coc.nvim', { 'branch': 'release' }
" latex插件
Plug 'lervag/vimtex', {'for': 'tex'} " pip install remote-neovim  zathura-pdf-mupdf xdotool texlive-most texlive-lang
" markdown 插件
Plug 'plasticboy/vim-markdown', {'for': ['md', 'markdown']}
" 快速注释插件
Plug 'scrooloose/nerdcommenter'
" 主题
Plug 'rakr/vim-one'
Plug 'Rigellute/shades-of-purple.vim'
Plug 'haishanh/night-owl.vim'
Plug 'tomasiser/vim-code-dark'
Plug 'dunstontc/vim-vscode-theme'
" 底栏
Plug 'itchyny/lightline.vim'
" 关灯读小说
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
Plug 'junegunn/limelight.vim', { 'on': 'Limelight' }
" 彩虹括号
Plug 'luochen1990/rainbow'
" 函数列表
Plug 'liuchengxu/vista.vim'
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
" 二进制
Plug 'Shougo/vinarise.vim', { 'on': 'Vinarise' }
" 快速移动
Plug 'rhysd/clever-f.vim'
" 对齐线
Plug 'Yggdroot/indentLine'
" 多光标
Plug 'mg979/vim-visual-multi'
" 放大窗口
Plug 'troydm/zoomwintab.vim', {'on': 'ZoomWinTabToggle'}
" 标签
Plug 'MattesGroeger/vim-bookmarks'
" 编译运行
Plug 'thinca/vim-quickrun', {'on': '<Plug>(quickrun)'}
" table模式
Plug 'dhruvasagar/vim-table-mode'
" csv
Plug 'chrisbra/csv.vim', {'for': 'csv'}

if !has('nvim')
	Plug 'vim-utils/vim-alt-mappings'
endif

" 需要安装pysdl2, sdl2_mixer
" 快速打开终端, neovim需要pip install neovim-remote
Plug 'skywind3000/vim-terminal-help'
call plug#end()

" 判断该插件是否已经安装
fun! HasInstall(plugin_name) abort
	let s:plugin_path = s:plugins_path . "/" . a:plugin_name

	if !empty(glob(s:plugin_path))
		return 1
	else
		return 0
	endif
endfunction

" 判断是否有这个插件
fun! HasPlug(plugName)
    if index(g:plugs_order, a:plugName) > -1
        return 1
    else
        return 0
    endif
endfunction
" ------------------ 插件列表 ------------------------

" ------------------ 插件配置 ------------------------

if HasPlug("coc.nvim")
	" let g:coc_extension_root = "~/.cache/coc/extensions"
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

	" 高亮当前光标下的所有单词, 使用插件vim-cursorword代替
	au CursorHold * silent call CocActionAsync('highlight')

	" au CursorHoldI * sil call CocActionAsync('showSignatureHelp')

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
	nmap <silent> <leader>k <Plug>(coc-diagnostic-prev)
	nmap <silent> <leader>j <Plug>(coc-diagnostic-next)
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
		"nnoremap <silent> <M-s> :CocList words<cr>
		nnoremap <silent> <M-s> :CocList lines<cr>
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
	nmap <silent> <F2> :CocCommand explorer
				\ --toggle
				\ --width=30
				\ --position=left
				\ --sources=buffer+,file+
				\ <cr>

	" -------------------- coc translator
	nmap  <M-e> <Plug>(coc-translator-e)
	nmap  <M-d> <Plug>(coc-translator-p)

	" -------------------- coc bookmark
	" nmap <silent> bm <Plug>(coc-bookmark-toggle)
	" nmap <silent> <space>m :CocList bookmark<cr>
endif

if HasPlug("vimtex")
	" https://zhuanlan.zhihu.com/p/61036165
	let g:tex_flavor='latex'
	let g:vimtex_view_method='zathura'
	if has("nvim")
		let g:vimtex_compiler_progname = 'nvr'
	endif
	let g:vimtex_quickfix_mode=0
	" 最后两行开启自动隐藏功能,开启了这个功能，除了你光标所在的那一行之外，文本里夹杂的LaTeX代码就都会隐藏或者替换成其他符号
	set conceallevel=1
	let g:tex_conceal='abdmg'
	" let g:latex_view_general_viewer = 'zathura'
	" " let g:latex_view_general_options = shellescape('--synctex-forward "' . exepath(v:progpath) . ' --servername ' . v:servername . ' +{%lline} {%ffile}"')
	" let g:latex_view_general_options = shellescape('--synctex-forward "' . v:progname . ' --servername ' . v:servername . ' +{%line} {%file}"')

	" if &ft == 'latex' || &ft == 'tex'
	"     setlocal spell
	"     set spelllang=nl,en_gb
	"     inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
	" endif

	" \ll编译tex文件 (注意：\ll执行后，表示进入continuous mode，每次编辑过后，:w保存文档，对应的pdf就会自动更新)
	" \lk(或\ll)停止编译 (注意：当执行\lk或再次执行\ll后，表示退出continuous mode，:w保存文档，对应的pdf就不会自动更新)
	" \lv打开pdf阅读器查看文档，或在pdf文档已经打开的情况下向前搜索pdf中对应的目前光标所在位置的内容
	" \le打开或关闭编译的报错和警告信息
	" \lc清除latex编译文件
	" \lt打开目录(可以通过目录跳转)

	"     Esc或q退出目录
	"     Space跳转
	"     Enter跳转并关闭目录

	" \li查看latex项目信息，按Esc或q退出
	" \lm查看内置的imaps
endif

if HasPlug("vim-markdown")
	let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']

	" 显示参数 ``` ** __
	let g:markdown_syntax_conceal = 0
	let g:vim_markdown_conceal_code_blocks = 0

	let g:markdown_minlines = 50
	let g:vim_markdown_folding_disabled=1 " 取消markdown的默认折叠
	let g:vim_markdown_toc_autofit=1    " toc自动修复

	let g:vim_markdown_new_list_item_indent = 2

	if HasPlug('markdown-preview.nvim')
		command! -nargs=0 Mp :MarkdownPreview<cr>
	endif
endif

if HasPlug("nerdcommenter")
	" noremap <c-/> <leader>c<space>
	let g:NERDSpaceDelims = 1
	let g:NERDToggleCheckAllLines = 1
endif

if HasPlug("lightline.vim")
	if &laststatus < 2
		set laststatus=2
	endif

		" \ 'colorscheme': 'one',
	let g:lightline = {
		\ 'active': {
		\   'left': [ [ 'mode', 'paste' ],
		\             [ 'readonly', 'filename', 'modified'],
		\             [ 'gitinfo', 'method', 'cocstatus']
		\           ],
		\   'right': [
		\       ['cocerror'], ['cocwarn'], ['cocfix'],
		\       [ 'filetype', 'fileencoding', 'fileformat', 'hex', 'asc', 'lineinfo'],
		\   ]
		\ },
		\ 'component': {
		\   'asc': '%03.3b',
		\   'hex': '0x%hhhB',
		\ },
		\ 'component_function': {
		\   'cocstatus': 'coc#status',
		\   'method': 'NearestMethodOrFunction',
		\   'lineinfo': 'LightlineLineinfo',
		\   'readonly': 'LightLineReadonly',
		\   'gitinfo': 'LightLineGit',
		\   'cocerror': 'LightLineCocError',
		\   'cocwarn' : 'LightLineCocWarn',
		\   'cocfix': 'LightLineCocFixes',
		\ },
		\ 'component_expand': {
		\ },
		\ 'separator': { 'left': "\ue0b8", 'right': "\ue0ba"},
		\ 'subseparator': { 'left': "\ue0b9", 'right': "\ue0bb"}
	\ }

	function! s:lightline_is_lean() abort
		return &filetype =~? '\v^defx|mundo(diff)?$'
	endfunction

	function! s:lightline_is_plain() abort
		return &buftype ==? 'terminal' || &filetype =~? '\v^help|denite|defx|vista_kind|vista|tagbar$'
	endfunction


	function! LightlineLineinfo() abort
		return &filetype ==? 'help'             ? ''  :
		\      &filetype ==? 'defx'             ? ' ' :
		\      &filetype ==? 'denite'           ? ' ' :
		\      &filetype ==? 'tagbar'           ? ' ' :
		\      &filetype ==? 'vista_kind'       ? ' ' :
		\      &filetype ==? 'vista'            ? ' ' :
		\      &filetype =~? '\v^mundo(diff)?$' ? ' ' :
		\      s:lightline_is_lean() || s:lightline_is_plain() ? ' '  :
		\      printf(' %d%% ☰ %d:%d', 100*line('.')/line('$'),  line('.'), col('.'))
	endfunction

	function! LightLineReadonly()
		if &filetype == "help"
			return ""
		elseif &readonly
			return ""
		else
			return ""
		endif
	endfunction

	function! LightLineGit()abort
		if &filetype ==? 'defx' || &filetype ==? 'vista'
			return ""
		endif
		let gitbranch=get(g:, 'coc_git_status', '')
		let gitcount=get(b:, 'coc_git_status', '')
		let gitinfo = []
		if empty(gitbranch)
			let gitbranch=""
		endif
		if empty(gitcount)
			let gitcount=""
		endif
		call add(gitinfo,gitbranch)
		call add(gitinfo,gitcount)
		return trim(join(gitinfo,''))
	endfunction

	function! LightLineCocError()
		let error_sign = get(g:, 'coc_status_error_sign', has('mac') ? '❌ ' : 'hhhE')
		let info = get(b:, 'coc_diagnostic_info', {})
		if empty(info)
			return ''
		endif
		let errmsgs = []
		if get(info, 'error', 0)
			call add(errmsgs, error_sign . info['error'])
		endif
		return join(errmsgs, ' ')
	endfunction

	function! LightLineCocWarn() abort
		let warning_sign = get(g:, 'coc_status_warning_sign')
		let info = get(b:, 'coc_diagnostic_info', {})
		if empty(info)
			return ''
		endif
		let warnmsgs = []
		if get(info, 'warning', 0)
			call add(warnmsgs, warning_sign . info['warning'])
		endif
		return join(warnmsgs, ' ')
		endfunction

	function! LightlineCocFixes() abort
		let b:coc_line_fixes = get(get(b:, 'coc_quickfixes', {}), line('.'), 0)
		return b:coc_line_fixes > 0 ? printf('%d ', b:coc_line_fixes) : ''
	endfunction
endif

if HasPlug("goyo.vim")
	" 在悬浮窗口中打开goyo
	"let s:fwinnr = -1
	"fu! FloatGoYo()
	"    if s:fwinnr < 0
	"        let a:bufnr = bufnr("%")
	"        let a:height = &lines
	"        let a:width = float2nr(&columns - (&columns * 2 / 6))
	"        let a:col = float2nr((&columns - a:width) / 2)

	"        let a:opts = {
	"                \ 'relative': 'editor',
	"                \ 'row': a:height * 0.5,
	"                \ 'col': a:col,
	"                \ 'width': a:width,
	"                \ 'height': a:height
	"                \ }
	"        let a:buf = nvim_create_buf(v:false, v:true)
	"        let a:fwin = nvim_open_win(a:buf, v:true, a:opts)
	"        let s:fwinnr = winnr()
	"        exe a:bufnr . "b"
	"        exec "Goyo"
	"    else
	"        exec "close " . s:fwinnr
	"        let s:fwinnr = -1
	"    endif
	"endf

	let g:goyo_width = '80'
	let g:goyo_height = '90%'
	let g:goyo_linenr = 0

	function! s:goyo_enter()
		if executable('tmux') && strlen($TMUX)
			silent !tmux set status off
			silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
		endif
		set noshowmode
		set noshowcmd
		set scrolloff=999
		delcommand ZoomWin
		delcommand <Plug>ZoomWin
		Limelight
	" ...
	endfunction

	function! s:goyo_leave()
		if executable('tmux') && strlen($TMUX)
			silent !tmux set status on
			silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
		endif
		set showmode
		set showcmd
		set scrolloff=5
		command! ZoomWin call ZoomWin()
		command! <Plug>ZoomWin call ZoomWin()
		Limelight!
	" ...
	endfunction

	autocmd! User GoyoEnter nested call <SID>goyo_enter()
	autocmd! User GoyoLeave nested call <SID>goyo_leave()
endif

if HasPlug("limelight.vim")
	if &laststatus < 2
		set laststatus=2
	endif

		" \ 'colorscheme': 'one',
	let g:lightline = {
		\ 'active': {
		\   'left': [ [ 'mode', 'paste' ],
		\             [ 'readonly', 'filename', 'modified'],
		\             [ 'gitinfo', 'method', 'cocstatus']
		\           ],
		\   'right': [
		\       ['cocerror'], ['cocwarn'], ['cocfix'],
		\       [ 'filetype', 'fileencoding', 'fileformat', 'hex', 'asc', 'lineinfo'],
		\   ]
		\ },
		\ 'component': {
		\   'asc': '%03.3b',
		\   'hex': '0x%hhhB',
		\ },
		\ 'component_function': {
		\   'cocstatus': 'coc#status',
		\   'method': 'NearestMethodOrFunction',
		\   'lineinfo': 'LightlineLineinfo',
		\   'readonly': 'LightLineReadonly',
		\   'gitinfo': 'LightLineGit',
		\   'cocerror': 'LightLineCocError',
		\   'cocwarn' : 'LightLineCocWarn',
		\   'cocfix': 'LightLineCocFixes',
		\ },
		\ 'component_expand': {
		\ },
		\ 'separator': { 'left': "\ue0b8", 'right': "\ue0ba"},
		\ 'subseparator': { 'left': "\ue0b9", 'right': "\ue0bb"}
	\ }

	function! s:lightline_is_lean() abort
		return &filetype =~? '\v^defx|mundo(diff)?$'
	endfunction

	function! s:lightline_is_plain() abort
		return &buftype ==? 'terminal' || &filetype =~? '\v^help|denite|defx|vista_kind|vista|tagbar$'
	endfunction


	function! LightlineLineinfo() abort
		return &filetype ==? 'help'             ? ''  :
		\      &filetype ==? 'defx'             ? ' ' :
		\      &filetype ==? 'denite'           ? ' ' :
		\      &filetype ==? 'tagbar'           ? ' ' :
		\      &filetype ==? 'vista_kind'       ? ' ' :
		\      &filetype ==? 'vista'            ? ' ' :
		\      &filetype =~? '\v^mundo(diff)?$' ? ' ' :
		\      s:lightline_is_lean() || s:lightline_is_plain() ? ' '  :
		\      printf(' %d%% ☰ %d:%d', 100*line('.')/line('$'),  line('.'), col('.'))
	endfunction

	function! LightLineReadonly()
		if &filetype == "help"
			return ""
		elseif &readonly
			return ""
		else
			return ""
		endif
	endfunction

	function! LightLineGit()abort
		if &filetype ==? 'defx' || &filetype ==? 'vista'
			return ""
		endif
		let gitbranch=get(g:, 'coc_git_status', '')
		let gitcount=get(b:, 'coc_git_status', '')
		let gitinfo = []
		if empty(gitbranch)
			let gitbranch=""
		endif
		if empty(gitcount)
			let gitcount=""
		endif
		call add(gitinfo,gitbranch)
		call add(gitinfo,gitcount)
		return trim(join(gitinfo,''))
	endfunction

	function! LightLineCocError()
		let error_sign = get(g:, 'coc_status_error_sign', has('mac') ? '❌ ' : 'hhhE')
		let info = get(b:, 'coc_diagnostic_info', {})
		if empty(info)
			return ''
		endif
		let errmsgs = []
		if get(info, 'error', 0)
			call add(errmsgs, error_sign . info['error'])
		endif
		return join(errmsgs, ' ')
	endfunction

	function! LightLineCocWarn() abort
		let warning_sign = get(g:, 'coc_status_warning_sign')
		let info = get(b:, 'coc_diagnostic_info', {})
		if empty(info)
			return ''
		endif
		let warnmsgs = []
		if get(info, 'warning', 0)
			call add(warnmsgs, warning_sign . info['warning'])
		endif
		return join(warnmsgs, ' ')
		endfunction

	function! LightlineCocFixes() abort
		let b:coc_line_fixes = get(get(b:, 'coc_quickfixes', {}), line('.'), 0)
		return b:coc_line_fixes > 0 ? printf('%d ', b:coc_line_fixes) : ''
	endfunction
endif

if HasPlug("rainbow")
	let g:rainbow_active = 1


	" 'guifgs': 一个guifg的列表 (:h highlight-guifg), 即GUI界面的括号颜色, 将按顺序循环使用
	" 'guis': 一个gui的列表 (:h highlight-gui), 将按顺序循环使用
	" 'ctermfgs': 一个ctermfg的列表 (:h highlight-ctermfg), 即终端下的括号颜色
	" 'cterms': 一个cterm的列表 (:h highlight-cterm)
	" 'operators': 描述你希望哪些运算符跟着与它同级的括号一起高亮(注意：留意需要转义的特殊字符，更多样例见这里, 你也可以读vim帮助 :syn-pattern)
	" 'parentheses': 一个关于括号定义的列表, 每一个括号的定义包含形如以下的部分: start=/(/, step=/,/, stop=/)/, fold, contained, containedin=someSynNames, contains=@Spell. 各个部分具体含义可参考 :h syntax, 其中 step 为本插件的扩展定义, 表示括号中间需要高亮的运算符.
	" 'separately': 针对文件类型(由&ft决定)作不同的配置,未被单独设置的文件类型使用*下的配置,值为0表示仅对该类型禁用插件,值为"default"表示使用针对该类型的默认兼容配置 (注意, 默认兼容配置可能随着该插件版本的更新而改变, 如果你不希望它改变, 那么你应该将它拷贝一份放到你的vimrc文件里).
	" 省略某个字段以使用默认设置

	" let g:rainbow_conf = {
	" \	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
	" \	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta', 'orange'],
	" \	'operators': '_,_',
	" \	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
	" \	'separately': {
	" \		'*': {},
	" \		'tex': {
	" \			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
	" \		},
	" \		'lisp': {
	" \			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
	" \		},
	" \		'vim': {
	" \			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
	" \		},
	" \		'html': {
	" \			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
	" \		},
	" \		'css': 0,
	" \	}
	" \}
endif

if HasPlug("vista.vim")
	if HasPlug('eleline.vim')
		function! NearestMethodOrFunction() abort
			return get(b:, 'vista_nearest_method_or_function', '')
		endfunction

		set statusline+=%{NearestMethodOrFunction()}
		" By default vista.vim never run if you don't call it explicitly.
		"
		" If you want to show the nearest function in your statusline automatically,
		" you can add the following line to your vimrc
		autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
	endif

	let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
	"let g:vista_default_executive = 'ctags'
	" Ensure you have installed some decent font to show these pretty symbols, then you can enable icon for the kind.
	let g:vista#renderer#enable_icon = 1

	" The default icons can't be suitable for all the filetypes, you can extend it as you wish.
	"let g:vista#renderer#icons = {
	"\   "function": "\uf794",
	"\   "variable": "\uf71b",
	"\  }

	" 获取进入vista之前的buf, window编号
	let s:beforewinnr = -1
	function! VistaToggle() abort
		let s:bufnr = bufnr('__vista__')
		let s:bufwinnr = bufwinnr(s:bufnr)

		" 缓冲区存在
		if  s:bufnr > -1
			" 缓冲区在某个窗口中显示
			if s:bufwinnr > -1
				" 当前正好在vista窗口中
				if winnr() == s:bufwinnr
					" 关闭窗口
					exec "Vista!"
					" 跳转回之前进入的窗口
					if s:beforewinnr > -1
						exec s:beforewinnr . "wincmd w"
					endif
				else
					let s:beforewinnr = winnr()
					" 跳转到窗口
					exec s:bufwinnr . "wincmd w"
				endif
			else
				" 没有在窗口中显示
				exec "Vista"
			endif
		else
			" 获取进入vista之前的buf, window编号
			let s:beforewinnr = winnr()
			echom s:beforewinnr
			" buf不存在
			exec "Vista"
		endif
	endfunction

	nnoremap <F3> :call VistaToggle()<CR>
endif

if HasPlug("auto-pairs")
	"let g:AutoPairsShortcutJump = '<M-n>'
	"let g:AutoPairsShortcutBackInsert = '<M-N>'

	"Default: '<M-e>'
	"Fast wrap the word. all pairs will be consider as a block (include <>).
	"(|)'hello' after fast wrap at |, the word will be ('hello')
	"(|)<hello> after fast wrap at |, the word will be (<hello>)

	au FileType php  let b:AutoPairs = AutoPairsDefine({'<?' : '?>', '<?php': '?>'})
	au FileType rust let b:AutoPairs = AutoPairsDefine({'\w\zs<': '>'})
	" add <!-- --> pair and remove '{' for html file
	au FileType html let b:AutoPairs = AutoPairsDefine({'<!--' : '-->'}, ['{'])
	au FileType md   let b:AutoPairs = AutoPairsDefine({'```:```'})
endif

if HasPlug("vim-surround")

endif

if HasPlug("vim-repeat")

endif

if HasPlug("vim-better-whitespace")
	let g:better_whitespace_guicolor='white'
	let g:strip_whitespace_on_save = 1
	let g:strip_whitespace_confirm = 0
endif

if HasPlug("vim-snippets")

endif

if HasPlug("vim-choosewin")

endif

if HasPlug("vinarise.vim")

endif

if HasPlug("clever-f.vim")
	" 多行搜索
	let g:clever_f_across_no_line=0
	let g:clever_f_smart_case=1
	"let g:clever_f_mark_char_color=
	let g:clever_f_show_prompt=1
endif

if HasPlug("indentLine")
	" 缩进线无颜色
	let g:indentLine_setColors = 1
	" let g:indentLine_color_term = 239
	"let g:indentLine_bgcolor_term = 202
	" let g:indentLine_bgcolor_gui = '#FF5F00'

	"let g:indentLine_leadingSpaceEnabled = 1
	"let g:indentline_leadingSpaceChar = '→'
	let g:indentLine_enable = 1
	" let g:indentLine_char_list = ['|', '┆', '┊', '▏']
	let g:indentLine_char = '▏'
	"let g:indentLine_char = '.'
	let g:indentline_filetypeexclude = ['defx', 'startify', 'terminal']
	let g:indentLine_concealcursor = 'niv'
endif

if HasPlug("vim-visual-multi")
	" basic usage
	" 1. 使用ctrl n来选择当前光标下的单词，使用n进行向下选择，使用N向上选择,
	" 使用shift arrows进行选择，然后n选择下一个
	" 2. ctrl down/up 垂直多选
	" 3. ]/[ 在所有光标之间进行跳转，ctrl f/b
	" 4. q，跳过当前选择并将光标移动到下一个选择处
	" 5. Q，仅仅取消当前选择不移动下一处
	" 6. 使用tab可以在光标模式和visual模式之间进行跳转
	" 7. 多光标选中之后使用s可以进行扩展选择，比如siw，si'等
	"
	"
	"let g:VM_theme = "pray"
	" let g:VM_leader = "'"
	" " 取消默认按键映射
	"let g:VM_default_mappings = 0
	" 开启鼠标选择
	" let g:VM_mouse_mappings = 0
	" let g:VM_maps = {}
	" let g:VM_maps["Add Cursor At Pos"]            = '<c-Right>'
	" let g:VM_maps["Add Cursor At Pos"]            = '<c-Right>'
	" let g:VM_maps['Visual Add']                   = '<c-i>'
	" let g:VM_maps["Select All"]                   = '<c-a>'
	" let g:VM_maps['Visual All']                   = '<c-a>'

	"let g:VM_maps = {}
	"let g:VM_maps["Switch Mode"]                 = '<Tab>'
	"let g:VM_maps["Add Cursor At Pos"]           = '<C-c>'
	"let g:VM_maps['Visual Add']             = '<C-c>'
	"let g:VM_maps['Find Under']                  = '<C-n>'
	"let g:VM_maps['Find Subword Under']          = '<C-n>'
	"let g:VM_maps["Select All"]                  = '<c-a>'
	"let g:VM_maps["Visual All"]                  = '<c-a>'
	" let g:VM_maps["Skip Region"]                 = '<C-s>'
	" let g:VM_maps["Skip Region"]                 = 's'
	"let g:VM_maps["Add Cursors Down"]             = '<C-Down>'
	"let g:VM_maps["Add Cursors Up"]               = '<C-Up>'
	" let g:VM_maps['Start Regex Search']             = '<C-/>'
	" let g:VM_maps['Visual Regex']             = '<C-/>'

	" let g:VM_maps["Alt Skip"]                    = 's'
	" let g:VM_maps["Remove Region"]               = 'S'
	"let g:VM_maps["Invert Direction"]            = 'o'
	"let g:VM_maps["Find Operator"]               = "m"
	"let g:VM_maps["Surround"]                    = 'S' " 需要vim-Surround支持

	"let g:VM_maps["Find Next"]                   = ']'
	"let g:VM_maps["Find Prev"]                   = '['
	"let g:VM_maps["Goto Next"]                   = '}'
	"let g:VM_maps["Goto Prev"]                   = '{'

	"let g:VM_maps["Visual Regex"]                = '\\/'
	"let g:VM_maps["Visual All"]                  = '\\A'
	"let g:VM_maps["Visual Add"]                  = '\\a'
endif

if HasPlug("zoomwintab.vim")

endif

if HasPlug("vim-bookmarks")
endif


if HasPlug("vim-quickrun")
	let g:quickrun_no_default_key_mappings = 1
	" nmap <F4> :QuickRun<cr>
	" vmap <F4> :QuickRun<cr>
	" 需要增加函数，判断光标所在的窗口是否可以执行
	nmap <F4> <Plug>(quickrun)<cr>
	nmap <leader>r <Plug>(quickrun)
	vmap <leader>r <Plug>(quickrun)

	let g:quickrun_config = {
		\   '_': {
		\ 'outputter/buffer/close_on_empty': 0,
		\ 'outputter/buffer/split': '10',
		\ 'outputter/buffer/into': 1,
		\ 'outputter/message/log': 1,
		\ }
		\}

endif

if HasPlug("vim-table-mode")

endif

if HasPlug("csv.vim")

endif

if HasPlug("vim-terminal-help")
	" ALT + =: toggle terminal below.
	" ALT + SHIFT + h: move to the window on the left.
	" ALT + SHIFT + l: move to the window on the right.
	" ALT + SHIFT + j: move to the window below.
	" ALT + SHIFT + k: move to the window above.
	" ALT + -: paste register 0 to terminal
	let g:terminal_height=10
	"let g:terminal_shell =
	" let g:terminal_edit='window drop'
	let g:terminal_list=0 "set to 0 to hide terminal buffer in the buffer list.
endif
" ------------------ 插件配置 ------------------------

" ------------------ 主题配置 ------------------------
"  有关主题的一些配置
function! s:patch_lucius_colors()
	if has('termguicolors')
		set termguicolors
	endif
	hi normal     ctermbg=NONE guibg=NONE
	hi linenr     ctermbg=NONE guibg=NONE
	hi signcolumn ctermbg=NONE guibg=NONE
endfunction

autocmd! colorscheme one call s:patch_lucius_colors()
colorscheme one
set background=light

" 设置vim搜索匹配项的颜色
if !HasPlug('fzf.vim')
    hi Search ctermfg=17 ctermbg=190 guifg=#00005f guibg=#dfff00
    hi IncSearch ctermfg=17 ctermbg=190 guifg=#00005f guibg=#dfff00
    hi QuickFixLine ctermfg=17 ctermbg=190 guifg=#00005f guibg=#dfff00
endif

if HasPlug('coc.nvim')
    if !HasPlug('vim-multiple-cursors.vim')
        " coc多光标颜色
        hi CocCursorRange cterm=bold ctermfg=238 ctermbg=226 gui=bold guifg=#444444 guibg=#ffff00
    endif

    " coc yank背景颜色
    hi HighlightedyankRegion cterm=bold ctermfg=238 ctermbg=226 gui=bold guifg=#444444 guibg=#ffff00
endif

if !HasPlug("vim-airline")
	set statusline=%F%m%r%h%w%=\ [ft=%Y]\ %{\"[fenc=\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\"+\":\"\").\"]\"}\ [ff=%{&ff}]\ [asc=%03.3b]\ [hex=%02.2B]\ [pos=%04l,%04v][%p%%]\ [len=%L]
endif
" ------------------ 主题配置 ------------------------

" ------------------ 按键映射配置 ------------------------
inoremap jk <esc>
nnoremap q <esc>:close<cr>
vnoremap q <esc>:close<cr>
nnoremap <BackSpace> :nohl<cr>

" 使用autopair, c-h表示向前删除
inoremap <c-l> <esc><right>xi

" 窗口
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
" 更改窗口大小
nnoremap <C-w>[ :vertical resize -3<CR>
nnoremap <C-w>] :vertical resize +3<CR>
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
" 分割窗口
nnoremap <c-w>s <esc><c-w>s<esc><c-w>j
nnoremap <c-w>v <esc><c-w>v<esc><c-w>l
nnoremap <c-w>k :abo split <cr>
nnoremap <c-w>h :abo vsplit <cr>
nnoremap <c-w>j :rightbelow split <cr>
nnoremap <c-w>l :rightbelow vsplit <cr>

" nnoremap <F5> :copen<cr>

" 插入模式下的一些快捷键
inoremap <C-s> <esc>:w<cr>
inoremap <C-a> <esc>ggVG
inoremap <M-o> <esc>o
inoremap <M-O> <esc>O
inoremap <M-h> <esc>I
inoremap <M-l> <esc>A

" buffer 操作
if HasPlug('bclose.vim')
    nnoremap <C-x>  :Bclose<CR>
else
    nnoremap <c-x> :bd<cr>
endif

noremap <space><space> <esc>:w<cr>

nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

"tabl operation
nnoremap <leader>tn :tabnew<cr>
nnoremap <leader>te :tabedit
nnoremap <leader>tc :tabclose<cr>
nnoremap <leader>tm :tabmove


"yank to end
nnoremap Y y$

" terminal
tnoremap <Esc> <C-\><C-n>
tnoremap <c-j> <c-\><c-n><c-w>j
tnoremap <c-k> <c-\><c-n><c-w>k
tnoremap <c-l> <c-\><c-n><c-w>l
tnoremap <c-h> <c-\><c-n><c-w>h

" vim-airline
if !HasPlug('vim-airline')
    nnoremap  <M-l> :tabnext<cr>
    nnoremap  <M-h> :tabprevious<CR>
    tnoremap  <M-l> <c-\><c-n>:tabnext<cr>
    tnoremap  <M-h> <c-\><c-n>:tabprevious<CR>
endif

" ale
if HasPlug('ale')
    nmap <silent> <space>{ <Plug>(ale_previous_wrap)
    nmap <silent> <space>} <Plug>(ale_next_wrap)
endif

" leaderf
if HasPlug('LeaderF')
    nnoremap <M-f> :LeaderfFile<CR>
    "nnoremap <M-t> :LeaderfBufTag<CR>
    "nnoremap <M-T> :LeaderfBufTagAll<CR>
    nnoremap <M-o> :LeaderfBufferAll<CR>
    "nnoremap <M-b> :LeaderfTabBufferAll<CR><TAB>
    nnoremap <M-s> :LeaderfLine<CR>
    nnoremap <M-S> :<C-hhhU><C-R>=printf("Leaderf rg -S --fullPath %s", getcwd())<cr><cr>
    nnoremap <M-r> :LeaderfMru<CR>
endif

" fzf
if HasPlug('fzf')
    nnoremap <M-f> :Files<CR>
    nnoremap <M-t> :BTags<CR>
    nnoremap <M-T> :Tags<CR>
    nnoremap <M-o> :Buffers<CR>
    " nnoremap / :BLines<CR>
    " nnoremap ? :Rg<CR>
    nnoremap <M-s> :BLines<CR>
    nnoremap <M-S> :Rg<CR>
    nnoremap <M-r> :History<CR>
    nnoremap <M-g> :GFiles?<CR>
    nnoremap <M-G> :GFiles<CR>
    nnoremap <M-m> :Marks<CR>
    nnoremap <M-w> :Windows<CR>
endif

" easymotion
if HasPlug('vim-easymotion')
    nmap gk <Plug>(easymotion-overwin-f)
    nmap gl <Plug>(easymotion-overwin-line)
    "imap <M-k> <esc><Plug>(easymotion-overwin-f)
    "imap <M-j> <esc><Plug>(easymotion-overwin-line)
    " nmap <Leader>w <Plug>(easymotion-overwin-w)
endif

" goyo
if HasPlug('goyo.vim')
    nnoremap <F7> <esc>:Goyo<cr>
    "setlocal nonumber
    "setlocal norelativenumber
endif

" ChooseWin
if HasPlug('vim-choosewin')
    nnoremap <silent> - :ChooseWin<CR>
endif

" Autoformat
if HasPlug('vim-autoformat')
    nnoremap <M-i> :Autoformat<cr>
endif

" Startify
if HasPlug('vim-startify')
    noremap <leader>s <esc>:Startify<cr>
    "au FileType startify noremap q :q<cr>
endif

" zoomwintab
if HasPlug('zoomwintab.vim')
    nnoremap  <c-w>o :ZoomWinTabToggle<cr>
endif

" tagbar
if HasPlug('tagbar')
    nnoremap <F3> :TagbarToggle<cr>
    "inoremap <F3> <esc>:TagbarToggle<cr>
endif

" ------------------ 按键映射 ------------------------
inoremap jk <esc> " jk执行esc
nnoremap q <esc>:close<cr> " 关闭窗口
vnoremap q <esc>:close<cr>
nnoremap <BackSpace> :nohl<cr> " 取消搜索高亮
" 删除buffer
if HasPlug('bclose.vim')
    nnoremap <C-x>  :Bclose<CR>
else
    nnoremap <c-x> :bd<cr>
endif

" 窗口
noremap <c-h> <C-w>h
noremap <c-j> <C-w>j
noremap <c-k> <C-w>k
noremap <c-l> <C-w>l
" 更改窗口大小
nnoremap <M-{> :vertical resize -5<CR> " 更改窗口宽度
nnoremap <M-}> :vertical resize +5<CR>
" nnoremap <M-_>= :exe "resize " . (winheight(0) * 3/2)<CR> " 更改窗口高度
" nnoremap <M-+>- :exe "resize " . (winheight(0) * 2/3)<CR>
" 分割窗口
" nnoremap <c-w>s <esc><c-w>s<esc><c-w>j
" nnoremap <c-w>v <esc><c-w>v<esc><c-w>l
nnoremap <c-w>k :abo split <cr>
nnoremap <c-w>h :abo vsplit <cr>
nnoremap <c-w>j :rightbelow split <cr>
nnoremap <c-w>l :rightbelow vsplit <cr>
" nnoremap <M-W>k :abo split <cr>
" nnoremap <M-W>h :abo vsplit <cr>
" nnoremap <M-W>j :rightbelow split <cr>
" nnoremap <M-W>l :rightbelow vsplit <cr>

" 插入模式下的一些快捷键
" inoremap <C-s> <esc>:w<cr>
" inoremap <C-a> <esc>ggVG
inoremap <M-o> <esc>o
inoremap <M-O> <esc>O
inoremap <M-h> <esc>I
inoremap <M-l> <esc>A

noremap <space><space> <esc>:w<cr><left> " 两个space保存所有文件

nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

"tabl operation
nnoremap <leader>tn :tabnew<cr>
nnoremap <leader>te :tabedit
nnoremap <leader>tc :tabclose<cr>
nnoremap <leader>tm :tabmove

nnoremap Y y$ " 复制到末尾

" terminal
tnoremap <Esc> <C-\><C-n>
tnoremap <c-j> <c-\><c-n><c-w>j
tnoremap <c-k> <c-\><c-n><c-w>k
tnoremap <c-l> <c-\><c-n><c-w>l
tnoremap <c-h> <c-\><c-n><c-w>h

"------------------------------------------- vim-airline
if !HasPlug('vim-airline')
    nnoremap  <M-l> :tabnext<cr>
    nnoremap  <M-h> :tabprevious<CR>
    tnoremap  <M-l> <c-\><c-n>:tabnext<cr>
    tnoremap  <M-h> <c-\><c-n>:tabprevious<CR>
endif

"------------------------------------------- ale
if HasPlug('ale')
	" 过时了，现在主要用coc
    nmap <silent> <space>{ <Plug>(ale_previous_wrap)
    nmap <silent> <space>} <Plug>(ale_next_wrap)
endif

"------------------------------------------- leaderf
if HasPlug('LeaderF')
	" 过时了，现在主要用coc
    nnoremap <M-f> :LeaderfFile<CR>
    "nnoremap <M-t> :LeaderfBufTag<CR>
    "nnoremap <M-T> :LeaderfBufTagAll<CR>
    nnoremap <M-o> :LeaderfBufferAll<CR>
    "nnoremap <M-b> :LeaderfTabBufferAll<CR><TAB>
    nnoremap <M-s> :LeaderfLine<CR>
    nnoremap <M-S> :<C-hhhU><C-R>=printf("Leaderf rg -S --fullPath %s", getcwd())<cr><cr>
    nnoremap <M-r> :LeaderfMru<CR>
endif

"------------------------------------------- fzf
if HasPlug('fzf')
	" 过时了，现在主要用coc
    nnoremap <M-f> :Files<CR>
    nnoremap <M-t> :BTags<CR>
    nnoremap <M-T> :Tags<CR>
    nnoremap <M-o> :Buffers<CR>
    " nnoremap / :BLines<CR>
    " nnoremap ? :Rg<CR>
    nnoremap <M-s> :BLines<CR>
    nnoremap <M-S> :Rg<CR>
    nnoremap <M-r> :History<CR>
    nnoremap <M-g> :GFiles?<CR>
    nnoremap <M-G> :GFiles<CR>
    nnoremap <M-m> :Marks<CR>
    nnoremap <M-w> :Windows<CR>
endif

"------------------------------------------- easymotion
if HasPlug('vim-easymotion')
	" 过时了，现在主要用cleverf
    nmap gk <Plug>(easymotion-overwin-f)
    nmap gl <Plug>(easymotion-overwin-line)
    "imap <M-k> <esc><Plug>(easymotion-overwin-f)
    "imap <M-j> <esc><Plug>(easymotion-overwin-line)
    " nmap <Leader>w <Plug>(easymotion-overwin-w)
endif

"------------------------------------------- goyo
if HasPlug('goyo.vim')
    nnoremap <F7> <esc>:Goyo<cr>
    "setlocal nonumber
    "setlocal norelativenumber
endif

"------------------------------------------- ChooseWin
if HasPlug('vim-choosewin')
    nnoremap <silent> - :ChooseWin<CR>
endif

"------------------------------------------- Autoformat
if HasPlug('vim-autoformat')
	" 过时了，现在主要用coc
    nnoremap <M-i> :Autoformat<cr>
endif

"------------------------------------------- Startify
if HasPlug('vim-startify')
	" 不花里胡少的了
    noremap <leader>s <esc>:Startify<cr>
    "au FileType startify noremap q :q<cr>
endif

"-------------------------------------------- zoomwintab
if HasPlug('zoomwintab.vim')
    nnoremap  <c-w>o :ZoomWinTabToggle<cr>
endif

"-------------------------------------------- tagbar
if HasPlug('tagbar')
    nnoremap <F3> :TagbarToggle<cr>
    "inoremap <F3> <esc>:TagbarToggle<cr>
endif
" ------------------ 按键映射 ------------------------

" ------------------ 主题配置 ------------------------
function! s:patch_lucius_colors()
	if has('termguicolors')
		set termguicolors
	endif
	" hi normal     ctermbg=NONE guibg=NONE
	" hi linenr     ctermbg=NONE guibg=NONE
	" hi signcolumn ctermbg=NONE guibg=NONE
endfunction

" 判断主题是否安装
autocmd! colorscheme one call s:patch_lucius_colors()
colorscheme one
set background=light

"------------------------------------------------------"
" 设置vim搜索匹配项的颜色
if !HasPlug('fzf.vim')
    hi Search ctermfg=17 ctermbg=190 guifg=#ffffff guibg=#ff0033
    hi IncSearch ctermfg=17 ctermbg=190 guifg=#ffffff guibg=#ff0033
    hi QuickFixLine ctermfg=17 ctermbg=190 guifg=#ffffff guibg=#ff0033
endif

if HasPlug('vim-visual-multi')
    " ???
    " highlight multiple_cursors_cursor ctermfg=15 ctermbg=1 guifg=white guibg=red
    " highlight link multiple_cursors_cursor Error
endif

if HasPlug('coc.nvim')
    if !HasPlug('vim-multiple-cursors.vim')
        " coc多光标颜色
        hi CocCursorRange cterm=bold ctermfg=238 ctermbg=226 gui=bold guifg=#444444 guibg=#ffff00
    endif

	" coc 高亮单词
	" au VimEnter * hi CocHighlightText guibg=#87CEFA
	au VimEnter * hi CocHighlightText guibg=#ffb6c1
	" au VimEnter * hi CocHighlightText guibg=#ff69b4
	" au VimEnter * hi CocHighlightText guifg=#996699 guibg=#ffcccc

    " coc yank背景颜色
    " hi HighlightedyankRegion cterm=bold ctermfg=238 ctermbg=226 gui=bold guifg=#444444 guibg=#ffff00
    " hi HighlightedyankRegion cterm=bold ctermfg=238 ctermbg=226 gui=bold guifg=#444444 guibg=#ff99cc
    hi HighlightedyankRegion cterm=bold ctermfg=238 ctermbg=226 gui=bold guifg=#444444 guibg=#ffa07a

	" hi link CocErrorSign red
	hi link CocWarningSign yellow
	hi link CocInfoSign green
	hi link CocHintSign blue
endif
" ------------------ 主题配置 ------------------------

