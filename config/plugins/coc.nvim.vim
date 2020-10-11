" coc插件安装目录
let g:coc_data_home = g:cache_root_path . 'coc/'
" coc-settings.json所在目录
let g:coc_config_home = g:other_config_root_path

" 卸载不在列表中的插件
function! s:uninstall_unused_coc_extensions() abort
    for e in keys(json_decode(join(readfile(expand(g:coc_data_home . '/extensions/package.json')), "\n"))['dependencies'])
        if index(g:coc_global_extensions, e) < 0
            execute 'CocUninstall ' . e
        endif
    endfor
endfunction
autocmd User CocNvimInit call s:uninstall_unused_coc_extensions()

" 检查当前光标前面是不是空白字符
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" tab触发补全或者选择下一个补全
inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<c-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()

" shift tab 选择上一个补全
inoremap <silent><expr> <S-TAB>
    \ pumvisible() ? "\<C-p>" :
    \ "\<C-h>"

" alt j选择下一个补全
inoremap <silent><expr> <m-j>
    \ pumvisible() ? "\<C-n>" : "\<C-R>=coc#rpc#request('snippetNext', [])\<cr>"
    " \ pumvisible() ? "\<C-n>" : return

" alt k选择上一个补全
inoremap <silent><expr> <m-k>
    \ pumvisible() ? "\<C-p>" : "\<C-R>=coc#rpc#request('snippetPrev', [])\<cr>"
    " \ pumvisible() ? "\<C-p>" : return

" down 选择下一个补全
inoremap <silent><expr> <down>
    \ pumvisible() ? "\<C-n>" : "\<down>"

" up 选择上一个补全
inoremap <silent><expr> <up>
    \ pumvisible() ? "\<C-p>" : "\<up>"

" alt j k 用于补全块的跳转，优先补全块跳转
if g:HasCocPlug('coc-snippets')
    let g:coc_snippet_next = '<m-j>'
    let g:coc_snippet_prev = '<m-k>'
endif

" 回车选中或者扩展选中的补全内容
if exists('*complete_info')
    " 如果您的(Neo)Vim版本支持，则使用`complete_info`
    " if g:HasPlug('ultisnips')
        " inoremap <expr> <cr> complete_info()["selected"] != "-1" ? complete_info()["items"][complete_info()["selected"]]["user_data"]["source"] ==? "ul" len(UltiSnips#SnippetsInCurrentScope()) ? "\<C-R>=UltiSnips#ExpandSnippet()\<CR>" : "\<C-y>" : "\<C-g>u\<CR>"
    " else
        " inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
    " endif

    if g:HasPlug('ultisnips')
        inoremap <expr> <cr> complete_info()["selected"] != "-1" ? len(UltiSnips#SnippetsInCurrentScope()) ? "\<C-R>=UltiSnips#ExpandSnippet()\<CR>" : "\<C-y>" : "\<C-g>u\<CR>"
    else
        inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
    endif
else
    if g:HasPlug('ultisnips')
        inoremap <expr> <cr> pumvisible() ? len(UltiSnips#SnippetsInCurrentScope()) ? "\<C-R>=UltiSnips#ExpandSnippet()\<CR>" : "\<C-y>" : "\<C-g>u\<CR>"
    else
        inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
    endif
endif

" diagnostic 跳转
nmap <silent> <M-j> <Plug>(coc-diagnostic-next)
nmap <silent> <M-k> <Plug>(coc-diagnostic-prev)

" 跳转到定义，在新窗口打开
function! s:definition_other_window() abort
    if winnr('$') >= 4 || (winwidth(0) - (max([len(line('$')), &numberwidth-1]) + 1)) < 110
        exec "normal \<Plug>(coc-definition)"
    else
        exec 'vsplit'
        exec "normal \<Plug>(coc-definition)"
    endif
endfunction

function! s:gotoTag(tagkind) abort
    let l:current_tag = expand('<cWORD>')

    let l:current_position = getcurpos()
    let l:current_position[0] = bufnr()

    let l:current_tag_stack = gettagstack()
    let l:current_tag_index = l:current_tag_stack['curidx']
    let l:current_tag_items = l:current_tag_stack['items']

    if CocAction('jump' . a:tagkind)
        let l:new_tag_index = l:current_tag_index + 1
        let l:new_tag_item = [{'tagname': l:current_tag, 'from': l:current_position}]
        let l:new_tag_items = l:current_tag_items[:]
        if l:current_tag_index <= len(l:current_tag_items)
            call remove(l:new_tag_items, l:current_tag_index - 1, -1)
        endif
        let l:new_tag_items += l:new_tag_item

        call settagstack(winnr(), {'curidx': l:new_tag_index, 'items': l:new_tag_items}, 'r')
    endif
endfunction

" 跳转到定义
nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gd :call <SID>gotoTag("Definition")<CR>
" 跳转到类型定义
nmap <silent> gy <plug>(coc-type-definition)
" 跳转到实现
nmap <silent> gi <plug>(coc-implementation)
" 跳转到引用
nmap <silent> gr <plug>(coc-references)
" 重构refactor,需要lsp支持
nmap <silent> <space>rf <Plug>(coc-refactor)
" 修复代码
nmap <silent> <space>f  <Plug>(coc-fix-current)
" 变量重命名
nmap <silent> <space>rn <Plug>(coc-rename)

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
au CursorHoldI * sil call CocActionAsync('showSignatureHelp')

" 格式化代码
command! -nargs=0 Format :call CocAction('format')

" 文档块支持，比如删除条件，函数等
" 功能不如treesitter，如果不存在treesitter才使用coc
if !g:HasPlug('nvim-treesitter')
    xmap if <Plug>(coc-funcobj-i)
    omap if <Plug>(coc-funcobj-i)
    xmap af <Plug>(coc-funcobj-a)
    omap af <Plug>(coc-funcobj-a)
    xmap ic <Plug>(coc-classobj-i)
    omap ic <Plug>(coc-classobj-i)
    xmap ac <Plug>(coc-classobj-a)
    omap ac <Plug>(coc-classobj-a)
endif

if g:HasPlug('coc-fzf')
    nnoremap <silent> <space>A  :<C-u>CocFzfList diagnostics<CR>
    nnoremap <silent> <space>a  :<C-u>CocFzfList diagnostics --current-buf<CR>
    nnoremap <silent> <space>c  :<C-u>CocFzfList commands<CR>
    nnoremap <silent> <space>e  :<C-u>CocFzfList extensions<CR>
    nnoremap <silent> <space>l  :<C-u>CocFzfList<CR>
    " nnoremap <silent> <space>l  :<C-u>CocFzfList location<CR>
    nnoremap <silent> <space>o  :<C-u>CocFzfList outline<CR>
    nnoremap <silent> <space>O  :<C-u>CocFzfList symbols<CR>
    nnoremap <silent> <space>s  :<C-u>CocFzfList services<CR>
    nnoremap <silent> <space>p  :<C-u>CocFzfListResume<CR>
else
    " Show all diagnostics
    if g:HasPlug('fzf-preview.vim')
        nnoremap <silent> <space>a  :<C-u>CocCommand fzf-preview.CocCurrentDiagnostics<cr>
        nnoremap <silent> <space>A  :<C-u>CocCommand fzf-preview.CocDiagnostics<cr>
    else
        nnoremap <silent> <space>a  :<C-u>CocList --normal diagnostics<cr>
    endif
    " Manage extensions
    " nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
    nnoremap <silent> <space>o  :<C-u>CocList --auto-preview outline<cr>
    nnoremap <silent> <space>O  :<C-u>CocList --auto-preview --interactive symbols<cr>
    " Show commands
    nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
    " Resume latest coc list
    nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
    " nnoremap <silent> <space>s  :<C-u>CocList services<CR>
    " show coclist 早晚要放进去的
    nnoremap <silent> <space>l  :<C-u>CocList<CR>
endif

" 多光标支持，但是coc的多光标不如
" vim-visual-multi，因此在没有
" vim-visual-multi的时候才使用
" coc
if !g:HasPlug("vim-visual-multi")
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

"""""""""""""""""""""""
" coc-plug config
" 下面是coc插件的配置
"""""""""""""""""""""""
if g:HasCocPlug('coc-highlight')
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

" TODO 需要思考一下这里的逻辑
if !g:HasPlug('fzf.vim') && !g:HasPlug('LeaderF') && !g:HasPlug('vim-clap')
    if g:HasCocPlug('coc-lists')
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
    endif
endif

if g:HasCocPlug('coc-yank')
    nnoremap <silent> <space>y  :<C-u>CocList yank<cr>

    if !g:HasPlug('vim-clap') && !g:HasPlug('fzf')
        nnoremap <silent> <M-y>  :<C-u>CocList yank<cr>
    endif
    call coc#config('yank.highlight.duration', 200)
    call coc#config('yank.enableCompletion', v:false)
endif

if g:HasCocPlug('coc-translator')
    nmap  <leader>e <Plug>(coc-translator-e)
    nmap  <leader>d <Plug>(coc-translator-p)
endif

if g:HasCocPlug('coc-bookmark') && !g:HasPlug('vim-bookmarks')
    call coc#config("bookmark.sign", "♥")
    nmap <silent> ma <Plug>(coc-bookmark-annotate)
    nmap <silent> mm <Plug>(coc-bookmark-toggle)
    nmap <silent> mj <Plug>(coc-bookmark-next)
    nmap <silent> mk <Plug>(coc-bookmark-prev)
    nmap <silent> mc :CocCommand bookmark.clearForCurrentFile<cr>
    nmap <silent> ml :CocList bookmark<cr>
endif

if g:HasCocPlug('coc-todolist')
    nmap <silent> <space>tl :<C-u>CocList todolist<cr>
    nmap <silent> <space>ta :<C-u>CocCommand todolist.create<cr>
endif


"""""""""""""""""""""""
" 下面是coc-settings.json的一些配置
" 原本这些配置是可以直接写到coc-settings.json中的
" 现在我写在vim中了
"""""""""""""""""""""""
if g:HasCocPlug("coc-lists")
    " session 保存目录
    call coc#config('session.directory', g:session_dir)
    if !g:HasPlug('dashboard-nvim')
        " 退出时自动保存session
        call coc#config('session.saveOnVimLeave', v:true)
    endif

    call coc#config('list.maxHeight', 10)
    call coc#config('list.maxPreviewHeight', 8)
    call coc#config('list.autoResize', v:false)
    call coc#config('list.source.grep.command', 'rg')
    call coc#config('list.source.grep.defaultArgs', [
                \ '--column',
                \ '--line-number',
                \ '--no-heading',
                \ '--color=always',
                \ '--smart-case'
            \ ])
    call coc#config('list.source.lines.defaultArgs', ['-e'])
    call coc#config('list.source.words.defaultArgs', ['-e'])
    call coc#config('list.source.files.command', 'rg')
    call coc#config('list.source.files.args', ['--files'])
    call coc#config('list.source.files.excludePatterns', ['.git'])
endif

" coc-clangd
if g:HasCocPlug('coc-clangd')
    " 配合插件vim-lsp-cxx-highlight实现高亮
    call coc#config('clangd.semanticHighlighting', v:true)
endif

" coc-kite
if g:HasCocPlug('coc-kite')
    call coc#config('kite.pollingInterval', 1000)
endif

" coc-xml
if g:HasCocPlug('coc-xml')
    call coc#config('xml.java.home', '/usr/lib/jvm/default/')
endif

" coc-prettier
if g:HasCocPlug('coc-prettier')
    call coc#config('prettier.tabWidth', 4)
endif

" coc-git
if g:HasCocPlug('coc-git')
    call coc#config('git.addGBlameToBufferVar', v:true)
    call coc#config('git.addGBlameToVirtualText', v:true)
    call coc#config('git.virtualTextPrefix', '  ➤  ')
    call coc#config('git.addedSign.hlGroup', 'GitGutterAdd')
    call coc#config('git.changedSign.hlGroup', 'GitGutterChange')
    call coc#config('git.removedSign.hlGroup', 'GitGutterDelete')
    call coc#config('git.topRemovedSign.hlGroup', 'GitGutterDelete')
    call coc#config('git.changeRemovedSign.hlGroup', 'GitGutterChangeDelete')
    call coc#config('git.addedSign.text', '▎')
    call coc#config('git.changedSign.text', '▎')
    call coc#config('git.removedSign.text', '▎')
    call coc#config('git.topRemovedSign.text', '▔')
    call coc#config('git.changeRemovedSign.text', '▋')

    " 导航到修改块
    nnoremap <silent> <leader>gk <Plug>(coc-git-prevchunk)
    nnoremap <silent> <leader>gj <Plug>(coc-git-nextchunk)
    " 显示光标处的修改信息
    nnoremap <silent> <leader>gp <esc>:CocCommand git.chunkInfo<cr>
    nnoremap <silent> <leader>gu <esc>:CocCommand git.chunkUndo<cr>
    nnoremap <silent> <leader>gh <esc>:CocCommand git.chunkStage<cr>
    " nnoremap <silent> <leader>gm :CocList bcommits<CR>
    " nnoremap <silent> <leader>gM :CocList commits<CR>
endif

" coc-snippets
if g:HasCocPlug('coc-snippets')
    call coc#config("snippets.ultisnips.enable", v:true)
    call coc#config("snippets.ultisnips.directories", [
                \ 'UltiSnips',
                \ 'gosnippets/UltiSnips'
            \ ])
    call coc#config("snippets.extends", {
                \ 'cpp': ['c', 'cpp'],
                \ 'typescript': ['javascript']
            \ })
endif

" coc-highlight
if g:HasCocPlug('coc-highlight')
    call coc#config("highlight.disableLanguages", ["csv"])
endif

" coc-python
if g:HasCocPlug('coc-python')
    call coc#config("python.jediEnabled", v:false)
    call coc#config("python.linting.enabled", v:true)
    call coc#config("python.linting.pylintEnabled", v:true)
endif

" coc-rainbow-fart
if g:HasCocPlug('coc-rainbow-fart')
    call coc#config("rainbow-fart.ffplay", "ffplay")
endif

" coc-explorer
if g:HasCocPlug('coc-explorer')
    let g:coc_explorer_global_presets = {
        \   '.vim': {
        \      'root-uri': '~/.vim',
        \   },
        \   'floating': {
        \      'position': 'floating',
        \      'floating-position': 'center',
        \      'floating-width': 100,
        \      'open-action-strategy': 'sourceWindow',
        \      'file-child-template': '[git | 2] [selection | clip | 1]
                    \ [indent] [icon | 1] [diagnosticError & 1]
                    \ [filename omitCenter 1][modified][readonly]
                    \ [linkIcon & 1][link growRight 1] [timeCreated | 8] [size]'
        \   },
        \   'floatingTop': {
        \     'position': 'floating',
        \     'floating-position': 'center-top',
        \     'open-action-strategy': 'sourceWindow',
        \   },
        \   'floatingLeftside': {
        \      'position': 'floating',
        \      'floating-position': 'left-center',
        \      'floating-width': 100,
        \      'open-action-strategy': 'sourceWindow',
        \   },
        \   'floatingRightside': {
        \      'position': 'floating',
        \      'floating-position': 'right-center',
        \      'floating-width': 100,
        \      'open-action-strategy': 'sourceWindow',
        \   },
        \   'simplify': {
        \     'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
        \   }
    \ }

    " Use preset argument to open it
    " nmap <space>rd :CocCommand explorer --preset .vim<CR>
    nmap <F2> :CocCommand explorer<CR>
    if !g:HasPlug('ranger.vim')
        nmap <leader>f :CocCommand explorer --preset floating<CR>
    endif

    augroup coc_explorer_group
        autocmd!
        autocmd WinEnter * if &filetype == 'coc-explorer' && winnr('$') == 1 | q | endif
        autocmd TabLeave * if &filetype == 'coc-explorer' | wincmd w | endif
    augroup END

    " config
    call coc#config("explorer.icon.enableNerdfont", v:true)
    call coc#config("explorer.bookmark.child.template", "[selection | 1] [filename] [position] - [annotation]")
    call coc#config("explorer.keyMappings", {
      \ 'k': 'nodePrev',
      \ 'j': 'nodeNext',
      \ 'h': 'collapse',
      \ 'l': ['expandable?', 'expand', 'open'],
      \ 'L': 'expand:recursive',
      \ 'H': 'collapse:recursive',
      \ 'K': 'expandablePrev',
      \ 'J': 'expandableNext',
      \ '<cr>': ['expandable?', 'cd', 'open'],
      \ '<bs>': 'gotoParent',
      \ 'r': 'refresh',
      \ 'v': ['toggleSelection', 'normal:j'],
      \ 'V': ['toggleSelection', 'normal:k'],
      \ '*': 'toggleSelection',
      \ 'w': 'open:split',
      \ 'W': 'open:vsplit',
      \ 't': 'open:tab',
      \ 'dd': 'cutFile',
      \ 'Y': 'copyFile',
      \ 'D': 'delete',
      \ 'P': 'pasteFile',
      \ 'R': 'rename',
      \ 'N': 'addFile',
      \ 'yp': 'copyFilepath',
      \ 'yn': 'copyFilename',
      \ 'gp': 'preview:labeling',
      \ 'x': 'systemExecute',
      \ 'f': 'search',
      \ 'F': 'searchRecursive',
      \ '<tab>': 'actionMenu',
      \ '?': 'help',
      \ 'q': 'quit',
      \ '<esc>': 'esc',
      \ 'gf': 'gotoSource:file',
      \ 'gb': 'gotoSource:buffer',
      \ '[[': 'sourcePrev',
      \ ']]': 'sourceNext',
      \ '[d': 'diagnosticPrev',
      \ ']d': 'diagnosticNext',
      \ '[c': 'gitPrev',
      \ ']c': 'gitNext',
      \ '<<': 'gitStage',
      \ '>>': 'gitUnstage'
    \ })
endif
