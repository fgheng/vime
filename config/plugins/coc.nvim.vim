" 设置coc插件目录
let g:coc_data_home = $HOME.'/.cache/vim/coc'
" coc插件列表
let s:coc_extensions = [
    \ 'coc-explorer',
    \ 'coc-tsserver',
    \ 'coc-prettier',
    \ 'coc-snippets',
    \ 'coc-calc',
    \ 'coc-vimlsp',
    \ 'coc-marketplace',
    \ 'coc-xml',
    \ 'coc-html',
    \ 'coc-css',
    \ 'coc-yank',
    \ 'coc-lists',
    \ 'coc-json',
    \ 'coc-sh',
    \ 'coc-rls',
    \ 'coc-java',
    \ 'coc-go',
    \ 'coc-highlight',
    \ 'coc-yaml',
    \ 'coc-git',
    \ 'coc-lua',
    \ 'coc-cmake',
    \ 'coc-python',
    \ ]
    "\ 'coc-word',
    "\ 'coc-tailwindcss',
    "\ 'coc-import-cost',
    "\ 'coc-sql',
    "\ 'coc-tabnine',
    "\ 'coc-kite',
    "\ 'coc-pyright',

function! s:uninstall_unused_coc_extensions() abort
    for e in keys(json_decode(join(readfile(expand(g:coc_data_home . '/extensions/package.json')), "\n"))['dependencies'])
        if index(s:coc_extensions, e) < 0
            execute 'CocUninstall ' . e
        endif
    endfor
endfunction
autocmd User CocNvimInit call s:uninstall_unused_coc_extensions()

for e in s:coc_extensions
    silent! call coc#add_extension(e)
endfor

" 判断是否安装了coc插件
fun! HasCocPlug(cocPlugName)
    if index(g:coc_global_extensions, a:cocPlugName) > -1
        return v:true
    else
        return v:false
    endif
endfunc

" 检查当前光标前面是不是空白字符
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" alt j k 用于补全块的跳转
let g:coc_snippet_next = '<m-j>'
let g:coc_snippet_prev = '<m-k>'

" tab选择下一个补全
inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<c-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()

" shift tab 选择上一个补全
inoremap <silent><expr> <S-TAB>
    \ pumvisible() ? "\<C-p>" :
    \ "\<C-h>"

" 选择下一个补全
inoremap <silent><expr> <M-j>
    \ pumvisible() ? "\<C-n>" : return

" 选择上一个补全
inoremap <silent><expr> <M-k>
    \ pumvisible() ? "\<C-p>" : return

" 回车选中或者扩展选中的补全内容
if has('patch8.1.1068')
    " 如果您的（Neo）Vim版本支持，则使用`complete_info`
    inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
    imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" diagnostic 跳转
nmap <silent> <M-j> <Plug>(coc-diagnostic-next)
nmap <silent> <M-k> <Plug>(coc-diagnostic-prev)

" 代码导航
" function! s:GoToDefinition() abort
"   if CocAction('jumpDefinition')
"     return v:true
"   endif

"   let ret = execute("silent! normal \<C-]>")
"   if ret =~ "Error" || ret =~ "错误"
"     call searchdecl(expand('<cword>'))
"   endif
" endfunction
" " 跳转到定义
" nmap <silent> gd :call <SID>GoToDefinition()<CR>
" nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gd :<C-u>call CocActionAsync('jumpDefinition')<CR>
" 跳转到类型定义
nmap <silent> gy <Plug>(coc-type-definition)
" 跳转到实现
nmap <silent> gi <Plug>(coc-implementation)
" 跳转到引用
nmap <silent> gr <Plug>(coc-references)

" 使用K悬浮显示定义
function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction
" 函数文档
nnoremap <silent> K :call <SID>show_documentation()<CR>
" 函数参数的文档
nnoremap <silent> <space>k :call CocActionAsync('showSignatureHelp')<CR>

augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" 格式化代码
command! -nargs=0 Format :call CocAction('format')
au CursorHoldI * sil call CocActionAsync('showSignatureHelp')

if !HasPlug('coc-fzf')
    " Show all diagnostics
    nnoremap <silent> <space>a  :<C-u>CocList --normal diagnostics<cr>
    " Manage extensions
    nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
    nnoremap <silent> <space>o  :<C-u>CocList --auto-preview outline<cr>
    nnoremap <silent> <space>O  :<C-u>CocList --auto-preview --interactive symbols<cr>
    " Show commands
    nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
    " Resume latest coc list
    nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
    nnoremap <silent> <space>s  :<C-u>CocList services<CR>
    " show coclist 早晚要放进去的
    nnoremap <silent> <space>l  :<C-u>CocList<CR>
endif

" 重构refactor,需要lsp支持
nmap <space>rf <Plug>(coc-refactor)
" 修复代码
nmap <space>f  <Plug>(coc-fix-current)
" 变量重命名
nmap <space>rn <Plug>(coc-rename)

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

    " use normal command like `<leader>xi(`
    nmap <leader>x  <Plug>(coc-cursors-operator)
endif

if HasCocPlug('coc-highlight')
    " 高亮当前光标下的所有单词
    au CursorHold * silent call CocActionAsync('highlight')
endif

function! CocListFilesWithWiki(query)
    if empty(a:query) && &ft ==? 'vimwiki'
        exec "CocList --no-sort files " . g:vimwiki_path
    else
        exec "CocList --no-sort files " . a:query
    endif
endfunction
if HasCocPlug('coc-lists')
    " TODO 需要思考一下这里的逻辑
    if !has('nvim') && !HasPlug('LeaderF') || !HasPlug('LeaderF') || !HasPlug('vim-clap') && !HasPlug('fzf.vim') && !HasPlug('coc-fzf')
        nnoremap <silent> <M-f> :call CocListFilesWithWiki("")<CR>
        nnoremap <silent> <M-F> :call CocListFilesWithWiki($HOME)<CR>
        nnoremap <silent> <M-b> :CocList buffers<CR>
        nnoremap <silent> <M-c> :CocList vimcommands<CR>
        " tags, 需要先generate tags
        nnoremap <silent> <M-t> :CocList tags<cr>
        nnoremap <silent> <M-s> :CocList --auto-preview --interactive grep<cr>
        nnoremap <silent> ? :CocList --auto-preview --interactive lines<cr>
        nnoremap <silent> <M-r> :CocList mru -A<CR>
        nnoremap <silent> <M-m> :CocList marks<CR>
        nnoremap <silent> <M-M> :CocList maps<CR>
        nnoremap <silent> <M-w> :CocList windows<CR>

        if HasCocPlug('coc-git')
            nnoremap <silent> gm :CocList bcommits<CR>
            nnoremap <silent> gM :CocList commits<CR>
        endif
    endif
endif

if HasCocPlug('coc-yank')
    " nnoremap <silent> <space>y  :<C-u>CocList yank<cr>
    if !HasPlug('vim-clap')
        nnoremap <silent> <M-y>  :<C-u>CocList yank<cr>
    endif
endif

if HasCocPlug('coc-explorer')
    let g:coc_explorer_global_presets = {
    \   'floating': {
    \      'position': 'floating',
    \      'floating-width': 150,
    \      'floating-height': 30,
    \   }
    \ }

    " nmap <silent> <F2> :CocCommand explorer --preset floating<cr>
    nmap <silent> <F2> :CocCommand explorer<cr>
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

if HasCocPlug('coc-todolist')
    nmap <silent> <space>tl :<C-u>CocList todolist<cr>
    nmap <silent> <space>ta :<C-u>CocCommand todolist.create<cr>
endif

if HasCocPlug('coc-git')
    " 导航到修改块
    nmap gk <Plug>(coc-git-prevchunk)
    nmap gj <Plug>(coc-git-nextchunk)
    " 显示光标处的修改信息
    nmap gp <Plug>(coc-git-chunkinfo)
    nmap gu <esc>:CocCommand git.chunkUndo<cr>
endif

"--------------------------------- 配置json文件
" session 保存目录
"call coc#config('session.directory', g:coc_session_directory)

"--------------------------------- 自定义命令
" call coc#add_command('call CocAction("pickColor")', 'MundoToggle', '显示撤回列表')
