let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']

" 显示参数 ``` ** __
let g:markdown_syntax_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0

let g:markdown_minlines = 50
let g:vim_markdown_folding_disabled=1 " 取消markdown的默认折叠
let g:vim_markdown_toc_autofit=1    " toc自动修复

let g:vim_markdown_new_list_item_indent = 2

if common#functions#HasPlug('markdown-preview.nvim')
    command! -nargs=0 Mp :MarkdownPreview<cr>
endif
