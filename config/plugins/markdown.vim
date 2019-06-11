"-----vim-markdown
if HasPlug('vim-markdown')
    let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']

    " 显示```
    let g:markdown_syntax_conceal = 1

    let g:markdown_minlines = 50
    let g:vim_markdown_folding_disabled=1 " 取消markdown的默认折叠
    let g:vim_markdown_toc_autofit=1    " toc自动修复
endif

"-----markdown-preview
if HasPlug('markdown-preview.nvim')
    command! -nargs=0 Mp :MarkdownPreview<cr>
endif
