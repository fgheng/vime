if HasPlug('coc.nvim')
    "let g:coc_extension_root = "~/.cache/coc/extensions"
    " coc插件
    let g:coc_global_extensions =
                \ [
                \ 'coc-python',
                \ 'coc-tsserver',
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
    """
    inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap',\ ['snippets-expand-jump',''])\<CR>" :
        \ "\<TAB>"
        "\ <SID>check_back_space() ? "\<TAB>" :
        "\ coc#jumpable() ? "\<C-r>=coc#rpc#request('doKeymap', \ ['snippets-jump', ''])\<cr>" :
        "\ coc#expandable() ? "\<C-r>=coc#rpc#request('doKeymap', \ ['snippets-expand', ''])\<cr>" :
    inoremap <expr><S-TAB>
        \ pumvisible() ? "\<C-p>" : "\<C-h>"
        "\ coc#jumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
    """

    "inoremap <silent><expr> <TAB>
    "  \ pumvisible() ? "\<C-n>" :
    "  \ <SID>check_back_space() ? "\<TAB>" :
    "  \ coc#refresh()
    "inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

    let g:coc_snippet_next = '<tab>'
    let g:coc_snippet_prev = '<S-TAB>'

    vmap <tab> <Plug>(coc-snippets-select)

    " 回车补全选中的内容
    "inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
    function HasSelect() abort
        if !exists('##TextChangedP')
            return 1
        endif
        let hasSelected = coc#rpc#request('hasSelected', [])
        if hasSelected
            return 1
        else
            return 0
        endif
    endfunction
    inoremap <silent><expr> <cr> pumvisible() ?
                \ HasSelect() ?
                \ coc#_select_confirm() :
                \ "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>" :
                \ "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
    "inoremap <silent><expr> <cr> pumvisible() ? \coc#_select_confirm() :
    "            \"\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

    " 使用ctrl space强制触发补全
    "inoremap <silent><expr> <c-space> coc#refresh()
    inoremap <expr><c-space> pumvisible() ? "\<C-e>" : coc#refresh()

    " diagnostic 跳转
    nmap <silent> <space>[ <Plug>(coc-diagnostic-prev)
    nmap <silent> <space>] <Plug>(coc-diagnostic-next)

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

    " Highlight symbol under cursor on CursorHold
    set updatetime=100
    au CursorHold * silent call CocActionAsync('highlight')
    au CursorHoldI * sil call CocActionAsync('showSignatureHelp')

    " 重命名
    nmap <space>rn <Plug>(coc-rename)

    augroup mygroup
        autocmd!
        " Setup formatexpr specified filetype(s).
        autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
        " Update signature help on jump placeholder
        autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
    augroup end

    " Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
    " xmap <leader>a  <Plug>(coc-codeaction-selected)
    " nmap <leader>a  <Plug>(coc-codeaction-selected)
    " Remap for do codeAction of current line
    " nmap <leader>al  <Plug>(coc-codeaction)
    " Fix autofix problem of current line
    " lsp如果实现quickfix功能，那么通过space qf就可以快速进行修复
    nmap <space>qf  <Plug>(coc-fix-current)

    " Remap for format selected region
    xmap <space>f  <Plug>(coc-format-selected)
    nmap <space>f  <Plug>(coc-format-selected)
    " Use `:Format` to format current buffer
    command! -nargs=0 Format :call CocAction('format')
    " command! -nargs=0 Run :call CocAction('codeAction')

    " Use `:Fold` to fold current buffer
    " command! -nargs=? Fold :call     CocAction('fold', <f-args>)

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
    " Do default action for next item.
    " nnoremap <silent> <space>j  :<C-u>CocNext<CR>
    " Do default action for previous item.
    " nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
    " Resume latest coc list
    nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
    " show coclist
    nnoremap <silent> <space>a  :<C-u>CocList<CR>
    nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
    " 切换cwd
    "nnoremap <silent> <space>w  :<C-u>CocList folders<cr>

    "---------------------------------------------- coc yank
    nnoremap <silent> <space>y  :<C-u>CocList -A yank<cr>

    "---------------------------------------------- coc list
    if !HasPlug('leaderF') && !HasPlug('fzf')
        nnoremap <M-f> :CocList files<CR>
        nnoremap <M-b> :CocList buffers<CR>
        nnoremap <M-o> :CocList outline<CR>
        nnoremap <silent> <M-c> :exe 'CocList -I --normal --input='.expand('<cword>').' words'<cr>
        nnoremap / :CocList words<cr>
        nnoremap ? :CocList grep<cr>
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
endif

