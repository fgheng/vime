if HasPlug('ultisnips')
    let g:UltiSnipsSnippetsDir = '~/.cache/plugins/vim-snippets/'
    let g:UltiSnipsSnippetDirectories = ['UltiSnips']
    "let g:UltiSnipsEditSplit="heroize"
    let g:UltiSnipsExpandTrigger       = '<cr>'
    let g:UltiSnipsJumpForwardTrigger  = '<m-j>'
    let g:UltiSnipsJumpBackwardTrigger = '<m-k>'

    " if &filetype == "tex"
    "     " 失败了
    "     let g:UltiSnipsExpandTrigger = '<tab>'
    "     let g:UltiSnipsJumpForwardTrigger = '<tab>'
    "     let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
    " else
        " let g:UltiSnipsExpandTrigger = "<nop>"
                        " let g:ulti_expand_or_jump_res = 0
                        " function! ExpandSnippetOrCarriageReturn()
                        "     let snippet = UltiSnips#ExpandSnippetOrJump()
                        "     if g:ulti_expand_or_jump_res > 0
                        "         return snippet
                        "     else
                        "         return "\<CR>"
                        "     endif
                        " endfunction

                        " inoremap <expr> <CR> pumvisible() ? "<C-R>=ExpandSnippetOrCarriageReturn()<CR>" : "\<CR>"
    " endif


    " here
    " https://github.com/Valloric/YouCompleteMe/issues/36
    "
    " let g:UltiSnipsExpandTrigger = "<nop>"
    " let g:ulti_expand_or_jump_res = 0
    " function ExpandSnippetOrCarriageReturn()
    "     let snippet = UltiSnips#ExpandSnippetOrJump()
    "     if g:ulti_expand_or_jump_res > 0
    "         return snippet
    "     else
    "         return "\<CR>"
    "     endif
    " endfunction
    " inoremap <expr> <CR> pumvisible() ? "<C-R>=ExpandSnippetOrCarriageReturn()<CR>" : "\<CR>"
endif
