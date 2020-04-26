" 各种自定义参数在这里

" 设置vim-plug插件安装路径
let g:plugins_path = $HOME.'/.cache/vim/plugins'

" 设置coc插件目录
let g:coc_data_home = $HOME.'/.cache/vim/coc'
" 设置cocsession目录
let g:coc_session_directory = $HOME.'/.cache/vim/sessions/'
" coc插件列表
let g:coc_global_extensions =
    \ [
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
    \ 'coc-tailwindcss',
    \ 'coc-yank',
    \ 'coc-lists',
    \ 'coc-json',
    \ 'coc-sh',
    \ 'coc-rls',
    \ 'coc-java',
    \ 'coc-go',
    \ 'coc-word',
    \ 'coc-highlight',
    \ 'coc-yaml',
    \ 'coc-import-cost',
    \ 'coc-pyright',
    \ 'coc-git',
    \ 'coc-python',
    \ 'coc-tabnine'
    \ ]
    " \ 'coc-translator',
    " \ 'coc-ecdict',
    " \ 'coc-post',

" vimwiki的路径
let g:vimwiki_path = $HOME.'/Documents/wiki'

" bookmark文件存储路径
let g:bookmark_file = $HOME.'/.cache/vim/vim-bookmarks'

" fzf文件夹
let g:fzf_dir = $HOME.'/.cache/vim/fzf'

" vimtex默认的pdf浏览器
let g:latex_viewer = 'zathura'
