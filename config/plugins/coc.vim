"if has_key(g:plugs, 'coc.nvim')
if HasPlug('coc.nvim')
    " coc插件
    let g:coc_global_extensions =
                \ [
                \ 'coc-python',
                \ 'coc-tsserver',
                \ 'coc-java',
                \ 'coc-vimlsp',
                \ 'coc-vimtex',
                \ 'coc-html',
                \ 'coc-css',
                \ 'coc-json',
                \ 'coc-yaml',
                \ 'coc-snippets',
                \ 'coc-emmet',
                \ 'coc-emoji',
                \ 'coc-highlight',
                \ 'coc-calc',
                \ 'coc-git',
                \ 'coc-marketplace',
                \ 'coc-project',
                \ 'coc-post',
                \ 'coc-xml',
                \ 'coc-yank',
                \ ]
                """""""
                " \ 'coc-yank' "复制"
                " \ 'coc-java',
                " \ 'coc-sh',
                " \ 'coc-pyls',
                " \ 'coc-lists',
                " \ 'coc-python',
                " \ 'coc-ccls',
                " \ 'coc-diagnostic',
                " \ 'coc-prettier',
                " \ 'coc-pairs',
                " \ 'coc-ultisnips',
                " \ 'coc-syntax',
                " \ 'coc-pyls',
                " \ 'coc-java',
                " \ 'coc-git',

    "---------------------------------------------- 补全提示框相关
    "inoremap <silent><expr> <TAB>
    "    \ pumvisible() ? "\<C-n>" :
    "    \ <SID>check_back_space() ? "\<TAB>" :
    "    \ coc#refresh()

    " 检查当前光标前面是不是空白字符
    function! s:check_back_space() abort
        let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    " 有没有弹出窗口，有的话tab按键进行选择,
    " 没有的话判断当前是否可以扩展或者是否可以跳转, 是的话进行扩展或者跳转
    " 不是的话输入一个tab按键
    inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
        \ "\<TAB>"
        "\ <SID>check_back_space() ? "\<TAB>" :
        "\ coc#refresh()
        "coc#expandable coc#jumpable
    inoremap <expr><S-TAB>
        \ pumvisible() ? "\<C-p>" : "\<C-h>"
        "\ coc#jumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
    let g:coc_snippet_next = '<tab>'
    let g:coc_snippet_prev = '<S-TAB>'
    vmap <tab> <Plug>(coc-snippets-select)

    " 回车补全选中的内容
    inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
    "inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() :
    "            \"\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

    " 使用ctrl space强制触发补全
    "inoremap <silent><expr> <c-space>
    "            \ pumvisible() ?  "\<C-r>=coc#_hide()\<cr>" : coc#refresh()
    inoremap <silent><expr> <c-space> coc#refresh()

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

    " autocmd FileType markdown let b:coc_pairs_disabled = ['`']

    "---------------------------------------------- coc snippets
    "imap <M-j> <Plug>(coc-snippets-expand-jump)
    "let g:coc_snippet_next = '<m-j>'
    "let g:coc_snippet_pre = '<m-k>'

    "inoremap <silent><expr> <TAB>
    "    \ pumvisible() ? coc#_select_confirm() :
    "    \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
    "    \ <SID>check_back_space() ? "\<TAB>" :
    "    \ coc#refresh()
    "
    "

    "---------------------------------------------- coc yank
    nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>

    "---------------------------------------------- coc list
    nnoremap <M-f> :CocList files<CR>
    "nnoremap <M-t> :CocList tags<CR>
    "nnoremap <M-T> :LeaderfBufTagAll<CR>
    nnoremap <M-o> :CocList buffers<CR>
    "nnoremap <M-b> :CocList buffers<CR><TAB>
    nnoremap <M-s> :CocList words<CR>
    nnoremap <M-S> :CocList grep<cr>
    nnoremap <M-r> :CocList mru<CR>
    nnoremap <M-m> :CocList marks<CR>
    nnoremap <M-w> :CocList windows<CR>
endif

