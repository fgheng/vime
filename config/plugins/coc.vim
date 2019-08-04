if HasPlug('coc.nvim')
    "let g:coc_extension_root = "~/.cache/coc/extensions"
    " coc插件
    let g:coc_global_extensions =
                \ [
                \ 'coc-python',
                \ 'coc-tsserver',
                \ 'coc-java',
                \ 'coc-rls',
                \ 'coc-html',
                \ 'coc-css',
                \ 'coc-emmet',
                \ 'coc-vetur',
                \ 'coc-tailwindcss',
                \ 'coc-prettier',
                \ 'coc-json',
                \ 'coc-yaml',
                \ 'coc-snippets',
                \ 'coc-emoji',
                \ 'coc-highlight',
                \ 'coc-calc',
                \ 'coc-git',
                \ 'coc-marketplace',
                \ 'coc-post',
                \ 'coc-xml',
                \ 'coc-yank',
                \ 'coc-lists',
                \ 'coc-import-cost',
                \ 'coc-imselect',
                \ ]
                "\ 'coc-vimtex',
                "\ 'coc-java',
                "\ 'coc-texlab',
                "\ 'coc-vetur', vue
    " web
    " coc-tsserver coc-html coc-css coc-tailwindcss coc-prettier coc-eslint
    " eslint 代码规范检查
    " prettier 前端代码格式化

    " base
    set updatetime=300
    " don't give |ins-completion-menu| messages.
    set shortmess+=c
    set hidden

    "---------------------------------------------- 补全提示框相关
    " 检查当前光标前面是不是空白字符
    function! s:check_back_space() abort
        let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    " 有没有弹出窗口，有的话tab按键进行选择,
    " 没有弹出窗口的话，首先判断是否可以跳转，可以跳转先跳转
    " 其次判断是否可以扩展，可以扩展的话在扩展
    " 其他情况输入tab
    "
    " 弹出框优先，有弹出框的情况下，tab进行选择，s-tab反向，enter选中内容,
    " 如果没有选中内容，enter表示回车，关闭弹出框
    " 没有弹出框的话，tab能跳转先跳转，若不能跳转，输入tab
    " 没有弹出框的话，enter看能不能扩展，可以的话进行扩展，不可以的话回车
    """
    " 优先级要高
    let g:coc_snippet_next = '<m-j>'
    let g:coc_snippet_prev = '<m-k>'

    inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()
    "inoremap <silent><expr> <TAB>
    "    \ pumvisible() ? "\<C-n>" :
    "    \ coc#jumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-jump', ''])\<cr>" :
    "    \ "\<TAB>"
        "\ <SID>check_back_space() ? "\<TAB>" :
        "\ coc#refresh()
        "\ pumvisible() ? "\<C-n>" :
        "\ coc#expandable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand', ''])\<cr>" :
        "\ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
    inoremap <silent><expr> <S-TAB>
        \ pumvisible() ? "\<C-p>" :
        \ "\<C-h>"
        "\ coc#jumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :

    "vmap <tab> <Plug>(coc-snippets-select)
    "vmap <cr> <Plug>(coc-snippets-expand)

    " 回车补全选中的内容
    inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
    "inoremap <expr> <cr>
    "    \ pumvisible() ? "\<C-y>" :
    "    \ coc#expandable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand', ''])\<cr>" :
    "    \ "\<C-g>u\<CR>"
    "function HasSelect() abort
    "    if !exists('##TextChangedP')
    "        return 1
    "    endif
    "    let hasSelected = coc#rpc#request('hasSelected', [])
    "    if hasSelected
    "        return 1
    "    else
    "        return 0
    "    endif
    "endfunction
    "inoremap <silent><expr> <cr> pumvisible() ?
    "            \ HasSelect() ?
    "            \ coc#_select_confirm() :
    "            \ "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>" :
    "            \ "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

    " 使用ctrl space强制触发补全
    inoremap <expr><c-space> pumvisible() ? "\<C-e>" : coc#refresh()

    " Use `:Format` to format current buffer
    command! -nargs=0 Format :call CocAction('format')
    command! -nargs=0 Run :call CocAction('codeAction')
    " Use `:Fold` to fold current buffer
    command! -nargs=? Fold :call     CocAction('fold', <f-args>)
    " use `:OR` for organize import of current buffer
    command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')


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

    "nmap <silent> <TAB> <Plug>(coc-range-select)
    "xmap <silent> <TAB> <Plug>(coc-range-select)
    "xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

    " Remap for do codeAction of current line
    nmap <leader>ac  <Plug>(coc-codeaction)
    " Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
    xmap <leader>a  <Plug>(coc-codeaction-selected)
    nmap <leader>a  <Plug>(coc-codeaction-selected)
    " Remap for do codeAction of current line
    nmap <leader>al  <Plug>(coc-codeaction)

    " Using CocList
    " Show all diagnostics
    nnoremap <silent> <space>d  :<C-u>CocList diagnostics<cr>
    " Manage extensions
    nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
    " Show commands
    nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
    vnoremap <silent> <space>c  :<C-u>CocList commands<cr>
    " Find symbol of current document
    "nnoremap <silent> <space>t  :<C-u>CocList outline<cr>
    " Search workspace symbols
    nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
    " Resume latest coc list
    nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
    " 执行coclistresume中的命令
    "nmap <silent> <space>] :<c-u>CocNext<cr>
    "nmap <silent> <space>[ :<c-u>CocPrev<cr>
    " show coclist
    nnoremap <silent> <space>l  :<C-u>CocList<CR>
    nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
    " 切换cwd
    "nnoremap <silent> <space>w  :<C-u>CocList folders<cr>
    " diagnostic 跳转
    nmap <silent> <space>] <Plug>(coc-diagnostic-prev)
    nmap <silent> <space>[ <Plug>(coc-diagnostic-next)
    " Fix autofix problem of current line
    nmap <space>qf  <Plug>(coc-fix-current)
    " 重命名
    nmap <space>rn <Plug>(coc-rename)
    " Remap for format selected region
    xmap <space>f  <Plug>(coc-format-selected)
    nmap <space>f  <Plug>(coc-format-selected)

    "---------------------------------------------- coc yank
    nnoremap <silent> <space>y  :<C-u>CocList -A yank<cr>

    "---------------------------------------------- coc list
    if !HasPlug('leaderF') && !HasPlug('fzf')
        nnoremap <M-f> :CocList files<CR>
        nnoremap <M-b> :CocList buffers<CR>
        nnoremap <M-o> :CocList outline<CR>
        nnoremap <silent> <M-c> :exe 'CocList -I --input='.expand('<cword>').' words'<cr>
        nnoremap <M-s> :CocList words<cr>
        nnoremap <M-S> :CocList grep<cr>
        nnoremap <M-r> :CocList -A mru<CR>
        nnoremap <M-m> :CocList marks<CR>
        nnoremap <M-w> :CocList windows<CR>
    endif

    "---------------------------------------------- folders
    " 根据具体文件设定cwd
    set sessionoptions+=globals
    autocmd FileType python let b:coc_root_patterns = ['.git', '.env']
    autocmd FileType c,cpp let b:coc_root_patterns = ['.git', '.ccls', 'compile_flags.txt']

    "---------------------------------------------- 多光标
    if !HasPlug("vim-visual-multi")
        " ctrl n下一个，ctrl p上一个
        nmap <silent> <C-c> <Plug>(coc-cursors-position)
        nmap <silent> <C-d> <Plug>(coc-cursors-word)
        xmap <silent> <C-d> <Plug>(coc-cursors-range)
        nmap <silent> <C-a> :CocCommand document.renameCurrentWord<cr>
        " use normal command like `<leader>xi(`
        nmap <leader>x  <Plug>(coc-cursors-operator)
        " 重构,需要lsp支持
        "nmap <silent> <space>rf <Plug>(coc-refactor)
        nmap <silent> <space>rf <Plug>(coc-refactor)
    endif

    " ----------------------- coc自定义命令
    call coc#add_command('mundoToggle', 'MundoToggle', '显示撤回列表')
    call coc#add_command('Goyo', 'Goyo', '阅读模式')
    call coc#add_command('Defx', 'Defx', '文件管理')
    call coc#add_command('Zoomwintab', 'ZoomWinTabToggle', '最大化当前窗口')
    "call coc#add_command('vistaToggle', 'call VistaToggle() | \<CR>', '显示函数列表')
endif

