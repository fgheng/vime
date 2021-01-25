" coc插件安装目录
let g:coc_data_home = g:cache_root_path . 'coc/'
" coc-settings.json所在目录
let g:coc_config_home = g:other_config_root_path

" 卸载不在列表中的插件
function! s:uninstall_unused_coc_extensions() abort
    if has_key(g:, 'coc_global_extensions')
        for e in keys(json_decode(join(readfile(expand(g:coc_data_home . '/extensions/package.json')), "\n"))['dependencies'])
            if index(g:coc_global_extensions, e) < 0
                execute 'CocUninstall ' . e
            endif
        endfor
    endif
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

" " alt k选择上一个补全
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
if common#functions#HasCocPlug('coc-snippets')
    let g:coc_snippet_next = '<m-j>'
    let g:coc_snippet_prev = '<m-k>'
endif

" 回车选中或者扩展选中的补全内容
if exists('*complete_info')
    " 如果您的(Neo)Vim版本支持，则使用`complete_info`
    inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
    inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" diagnostic 跳转
nmap <silent> <M-j> <Plug>(coc-diagnostic-next)
nmap <silent> <M-k> <Plug>(coc-diagnostic-prev)

" 跳转到定义
nmap <silent> gd <Plug>(coc-definition)
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
if !common#functions#HasPlug('neoformat')
    command! -nargs=0 Format :call CocAction('format')
endif

" 文档块支持，比如删除条件，函数等
" 功能不如treesitter，如果不存在treesitter才使用coc
if !common#functions#HasPlug('nvim-treesitter')
    xmap if <Plug>(coc-funcobj-i)
    omap if <Plug>(coc-funcobj-i)
    xmap af <Plug>(coc-funcobj-a)
    omap af <Plug>(coc-funcobj-a)
    xmap ic <Plug>(coc-classobj-i)
    omap ic <Plug>(coc-classobj-i)
    xmap ac <Plug>(coc-classobj-a)
    omap ac <Plug>(coc-classobj-a)
endif

if common#functions#HasPlug('coc-fzf')
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
    nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
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

" 多光标支持，但是coc的多光标不如 vim-visual-multi，因此在没有
" vim-visual-multi的时候才使用 coc
if !common#functions#HasPlug("vim-visual-multi")
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

function! s:lc_coc_highlight() abort
    " 取消csv的高亮
    call coc#config("highlight.disableLanguages", ["csv"])
    " 高亮当前光标下的所有单词
    au CursorHold * silent call CocActionAsync('highlight')
endfunction

function! s:lc_coc_lists() abort
    " session
    call coc#config('session.directory', g:session_dir)
    if common#functions#HasPlug('dashboard-nvim', 'vim-startify')
        call coc#config('session.saveOnVimLeave', v:false)
    else
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

    " 有这三个插件就用这三个插件
    " 那么快捷键不调用coc-lists
    if common#functions#HasPlug('fzf.vim')
        \ || common#functions#HasPlug('LeaderF')
        \ || common#functions#HasPlug('vim-clap')
        \ || common#functions#HasPlug('fzf-preview.vim')
        \ || common#functions#HasCocPlug('coc-fzf-preview')
        return
    endif

    function! s:cocListFilesWithWiki(query)
        if empty(a:query) && &ft ==? 'vimwiki'
            exec "CocList --no-sort files " . g:vimwiki_path
        else
            exec "CocList --no-sort files " . a:query
        endif
    endfunction

    nnoremap <silent> <M-f> :call <SID>cocListFilesWithWiki("")<CR>
    nnoremap <silent> <M-F> :call <SID>cocListFilesWithWiki($HOME)<CR>
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
    nnoremap <silent> <M-y> :CocList yank<CR>
    nnoremap <silent> <F8> :CocList locationlist<CR>
    nnoremap <silent> <F9> :CocList quickfix<CR>
endfunction

function! s:lc_coc_yank() abort
    call coc#config('yank.highlight.duration', 200)
    call coc#config('yank.enableCompletion', v:false)

    if !common#functions#HasPlug('vim-clap') && !common#functions#HasPlug('fzf')
        nnoremap <silent> <M-y>  :<C-u>CocList yank<cr>
    endif
    nnoremap <silent> <space>y  :<C-u>CocList yank<cr>
endfunction

function! s:lc_coc_translator() abort
    nmap  <leader>e <Plug>(coc-translator-e)
    nmap  <leader>d <Plug>(coc-translator-p)
endfunction

function! s:lc_coc_bookmark() abort
    if common#functions#HasPlug('vim-bookmarks')
        return
    endif

    call coc#config("bookmark.sign", "♥")
    nmap <silent> ma <Plug>(coc-bookmark-annotate)
    nmap <silent> mm <Plug>(coc-bookmark-toggle)
    nmap <silent> mj <Plug>(coc-bookmark-next)
    nmap <silent> mk <Plug>(coc-bookmark-prev)
    nmap <silent> mc :CocCommand bookmark.clearForCurrentFile<cr>
    nmap <silent> ml :CocList bookmark<cr>
endfunction

function! s:lc_coc_todolist() abort
    nmap <silent> <space>tl :<C-u>CocList todolist<cr>
    nmap <silent> <space>ta :<C-u>CocCommand todolist.create<cr>
endfunction

function! s:lc_coc_clangd() abort
    call coc#config('clangd.semanticHighlighting', v:true)
endfunction

function! s:lc_coc_kite() abort
    call coc#config('kite.pollingInterval', 1000)
endfunction

function! s:lc_coc_xml() abort
    call coc#config('xml.java.home', '/usr/lib/jvm/default/')
endfunction

function! s:lc_coc_prettier() abort
    call coc#config('prettier.tabWidth', 4)
endfunction

function! s:lc_coc_vimlsp() abort
    let g:markdown_fenced_languages = [
        \ 'vim',
        \ 'help'
    \ ]
endfunction

function! s:lc_coc_git() abort
    call coc#config('git.addGBlameToBufferVar', v:true)
    call coc#config('git.addGBlameToVirtualText', v:true)
    call coc#config('git.virtualTextPrefix', '  ➤  ')
    if common#functions#HasPlug("vim-gitgutter")
        call coc#config('git.addedSign.hlGroup', 'GitGutterAdd')
        call coc#config('git.changedSign.hlGroup', 'GitGutterChange')
        call coc#config('git.removedSign.hlGroup', 'GitGutterDelete')
        call coc#config('git.topRemovedSign.hlGroup', 'GitGutterDelete')
        call coc#config('git.changeRemovedSign.hlGroup', 'GitGutterChangeDelete')
    endif
    call coc#config('git.addedSign.text', '▎')
    call coc#config('git.changedSign.text', '▎')
    call coc#config('git.removedSign.text', '▎')
    call coc#config('git.topRemovedSign.text', '▔')
    call coc#config('git.changeRemovedSign.text', '▋')

    " 导航到修改块
    nmap <leader>gk <Plug>(coc-git-prevchunk)
    nmap <leader>gj <Plug>(coc-git-nextchunk)
    " 显示光标处的修改信息
    nnoremap <silent> <leader>gp <esc>:CocCommand git.chunkInfo<cr>
    " 撤销当前块的修改
    nnoremap <silent> <leader>gu <esc>:CocCommand git.chunkUndo<cr>
    nnoremap <silent> <leader>gh <esc>:CocCommand git.chunkStage<cr>
endfunction

function! s:lc_coc_snippets() abort
    call coc#config("snippets.ultisnips.enable", v:true)
    call coc#config("snippets.ultisnips.directories", [
                \ g:other_config_root_path . '/UltiSnips',
                \ g:other_config_root_path . '/gosnippets/UltiSnips',
            \ ])
    call coc#config("snippets.extends", {
                \ 'cpp': ['c', 'cpp'],
                \ 'typescript': ['javascript']
            \ })
endfunction

function! s:lc_coc_python() abort
    call coc#config("python.jediEnabled", v:true)
    call coc#config("python.linting.enabled", v:true)
    call coc#config("python.linting.pylintEnabled", v:true)
endfunction

function! s:lc_coc_ci() abort
    nmap <silent> w <Plug>(coc-ci-w)
    nmap <silent> b <Plug>(coc-ci-b)
endfunction

function! s:lc_coc_rainbow_fart() abort
    call coc#config("rainbow-fart.ffplay", "ffplay")
endfunction

function! s:lc_coc_fzf_preview() abort
    if common#functions#HasPlug('fzf.vim')
        \ || common#functions#HasPlug('LeaderF')
        \ || common#functions#HasPlug('vim-clap')
        \ || common#functions#HasPlug('fzf-preview.vim')
        return
    endif

    " let g:_yankround_cache = g:cache_root_path . "/coc/yank"

    " TODO 重新写定义
    " 行为要一致
    function s:cocFzfPreviewWithWiki(query) abort
        if empty(a:query) && &ft ==? 'vimwiki'
            exec "CocCommand fzf-preview.DirectoryFiles " . g:vimwiki_path
        else
            exec "CocCommand fzf-preview.DirectoryFiles " . a:query
        endif
    endfunction
    nnoremap <silent> <M-f> :call <SID>cocFzfPreviewWithWiki("")<CR>
    nnoremap <silent> <M-F> :call <SID>cocFzfPreviewWithWiki($HOME)<CR>
    nnoremap <silent> <M-b> :<c-u>CocCommand fzf-preview.AllBuffers<CR>
    nnoremap <silent> <M-c> :<c-u>CocCommand fzf-preview.CommandPalette<CR>
    nnoremap <silent> <M-C> :<c-u>CocCommand fzf-preview.Changes<CR>
    " tags, 需要先generate tags
    if common#functions#HasPlug('vista.vim')
        nnoremap <silent> <M-t> :<c-u>CocCommand fzf-preview.VistaBufferCtags<cr>
        nnoremap <silent> <M-T> :<c-u>CocCommand fzf-preview.VistaCtags<cr>
    else
        nnoremap <silent> <M-t> :<c-u>CocCommand fzf-preview.BufferTags<cr>
        nnoremap <silent> <M-T> :<c-u>CocCommand fzf-preview.Ctags<cr>
    endif
    nnoremap <silent> <M-s> :<c-u>CocCommand fzf-preview.ProjectGrep<cr>
    nnoremap <silent> ? :<c-u>CocCommand fzf-preview.Lines<cr>
    nnoremap <silent> <M-r> :<c-u>CocCommand fzf-preview.MruFiles<CR>
    nnoremap <silent> <M-m> :CocCommand fzf-preview.Marks<CR>
    " nnoremap <silent> <M-M> :CocList maps<CR>
    nnoremap <silent> <M-y> :<c-u>CocCommand fzf-preview.Yankround<CR>
    nnoremap <silent> <M-J> :<c-u>CocCommand fzf-preview.Jumps<CR>

    nnoremap <silent> <F8> :<c-u>CocCommand fzf-preview.QuickFix<CR>
    nnoremap <silent> <F9> :<c-u>CocCommand fzf-preview.LocationList<CR>
endfunction

function! s:lc_coc_explorer() abort
    let g:coc_explorer_global_presets = {
        \   '.vim': {
        \      'root-uri': g:vim_root_path,
        \   },
        \   'cocConfig': {
        \      'root-uri': '~/.config/coc',
        \   },
        \   'tab': {
        \     'position': 'tab',
        \     'quit-on-open': v:true,
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
        \   'floatingLeftSide': {
        \      'position': 'floating',
        \      'floating-position': 'left-center',
        \      'floating-width': 100,
        \      'open-action-strategy': 'sourceWindow',
        \   },
        \   'floatingRightSide': {
        \      'position': 'floating',
        \      'floating-position': 'right-center',
        \      'floating-width': 100,
        \      'open-action-strategy': 'sourceWindow',
        \   },
        \   'simplify': {
        \     'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
        \   },
        \   'buffer': {
        \     'sources': [{'name': 'buffer', 'expand': v:true}]
        \   },
    \ }

    " Use preset argument to open it
    " nmap <space>rd :CocCommand explorer --preset .vim<CR>
    nmap <F2> :CocCommand explorer<CR>
    if !common#functions#HasPlug('ranger.vim')
        nmap <leader>f :CocCommand explorer --preset floating<CR>
    endif

    augroup vime_coc_explorer_group
        autocmd!
        " autocmd WinEnter * if &filetype == 'coc-explorer' && winnr('$') == 1 | q | endif
        autocmd TabLeave * if &filetype == 'coc-explorer' | wincmd w | endif
    augroup END

    " config
    call coc#config("explorer.icon.enableNerdfont", v:true)
    call coc#config("explorer.contentWidthType", "win-width")
    call coc#config("explorer.bookmark.child.template", "[selection | 1] [filename] [position] - [annotation]")
    call coc#config("explorer.file.column.icon.modified", "•")
    call coc#config("explorer.file.column.icon.deleted", "✖")
    call coc#config("explorer.file.column.icon.untracked", "ᵁ")
    call coc#config("explorer.file.column.icon.renamed", "R")
    call coc#config("explorer.file.column.icon.unmerged", "≠")
    call coc#config("explorer.file.column.icon.ignored", "ⁱ")
    call coc#config("explorer.keyMappings.global", {
                \ 's': v:false,
                \ 't': v:false,
                \ 'E': v:false,
                \ 'e': v:false,
                \ 'zh': v:false,
                \ 'g.': v:false,
                \ 'p': v:false,
    \ })
    call coc#config("explorer.keyMappings.global", {
      \ 'k': 'nodePrev',
      \ 'j': 'nodeNext',
      \ 'h': ["wait", 'collapse'],
      \ 'l': ["wait", 'expandable?', 'expand', 'open'],
      \ 'L': ["wait", 'expand:recursive'],
      \ 'H': ["wait", 'collapse:recursive'],
      \ 'K': ["wait", 'expandablePrev'],
      \ 'J': ["wait", 'expandableNext'],
      \ 'o': ["wait", 'expanded?', 'collapse', 'expand'],
      \ '<cr>': ["wait", 'expandable?', 'cd', 'open'],
      \ '<bs>': ["wait", 'gotoParent'],
      \ 'r': 'refresh',
      \
      \ 's': ["wait", 'toggleSelection', 'normal:j'],
      \ 'S': ["wait", 'toggleSelection', 'normal:k'],
      \ '*': ["wait", 'toggleSelection'],
      \ 'gs': ["wait", "reveal:select"],
      \ '<dot>': 'toggleHidden',
      \
      \ '<c-s>': 'open:split',
      \ '<c-v>': 'open:vsplit',
      \ '<c-t>': 'open:tab',
      \
      \ 'dd': 'cutFile',
      \ 'Y': 'copyFile',
      \ 'D': 'delete',
      \ 'P': 'pasteFile',
      \ 'R': 'rename',
      \ 'N': 'addFile',
      \ 'yp': 'copyFilepath',
      \ 'yn': 'copyFilename',
      \
      \ 'pl': 'previewOnHover:toggle:labeling',
      \ 'pc': 'previewOnHover:toggle:content',
      \
      \ '<M-x>': 'systemExecute',
      \ 'f': 'search',
      \ 'F': 'searchRecursive',
      \
      \ '<tab>': 'actionMenu',
      \ '?': 'help',
      \ 'q': 'quit',
      \ '<esc>': 'esc',
      \
      \ 'gf': 'gotoSource:file',
      \ 'gb': 'gotoSource:buffer',
      \ '[[': ["wait", 'indentPrev'],
      \ ']]': ["wait", 'indentNext'],
      \
      \ '<M-k>': ["wait", 'markPrev:diagnosticError'],
      \ '<M-j>': ["wait", 'markNext:diagnosticError'],
      \
      \ '<leader>gk': ["wait", 'markPrev:git'],
      \ '<leader>gj': ["wait", 'markNext:git'],
      \ '<leader>gh': 'gitStage',
      \ '<leader>gu': 'gitUnstage'
    \ })

    " function! s:ShowFilename()
        " let s:node_info = CocAction('runCommand', 'explorer.getNodeInfo', 0)
        " redraw | echohl Debug | echom exists('s:node_info.fullpath') ?
        " \ 'FullPath: ' . s:node_info.fullpath .
        " \ ' Size: ' . s:node_info.lstat.size . 'B' .
        " \ ' ReadOnly: ' . s:node_info.readonly : '' |  echohl None
    " endfunction
    " autocmd CursorMoved \[coc-explorer\]* :call <SID>ShowFilename()

endfunction

function! s:tmp() abort
endfunction

" 遍历coc插件列表，载入插件配置
let s:coc_config_functions = {
            \ 'coc-highlight': function('<SID>lc_coc_highlight'),
            \ 'coc-lists': function('<SID>lc_coc_lists'),
            \ 'coc-yank': function('<SID>lc_coc_yank'),
            \ 'coc-translator': function('<SID>lc_coc_translator'),
            \ 'coc-bookmark': function('<SID>lc_coc_bookmark'),
            \ 'coc-todolist': function('<SID>lc_coc_todolist'),
            \ 'coc-clangd': function('<SID>lc_coc_clangd'),
            \ 'coc-kite': function('<SID>lc_coc_kite'),
            \ 'coc-xml': function('<SID>lc_coc_xml'),
            \ 'coc-prettier': function('<SID>lc_coc_prettier'),
            \ 'coc-git': function('<SID>lc_coc_git'),
            \ 'coc-snippets': function('<SID>lc_coc_snippets'),
            \ 'coc-python': function('<SID>lc_coc_python'),
            \ 'coc-rainbow-fart': function('<SID>lc_coc_rainbow_fart'),
            \ 'coc-explorer': function('<SID>lc_coc_explorer'),
            \ 'coc-ci': function('<SID>lc_coc_ci'),
            \ 'coc-vimlsp': function('<SID>lc_coc_vimlsp'),
            \ 'coc-fzf-preview': function('<SID>lc_coc_fzf_preview'),
            \ }

" TODO 更改调用方式
" 调用插件的配置函数
if has_key(g:, 'coc_global_extensions')
    for extension in g:coc_global_extensions
        call get(s:coc_config_functions, extension, function('<SID>tmp'))()
    endfor
endif
