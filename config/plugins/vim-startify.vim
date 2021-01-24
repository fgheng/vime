" For startify
let g:startify_padding_left = 10
let g:startify_custom_header = [
\'                                                         ',
\'             ▄█    █▄   ▄█     ▄▄▄▄███▄▄▄▄      ▄████████',
\'            ███    ███ ███   ▄██▀▀▀███▀▀▀██▄   ███    ███',
\'            ███    ███ ███▌  ███   ███   ███   ███    █▀',
\'            ███    ███ ███▌  ███   ███   ███  ▄███▄▄▄',
\'            ███    ███ ███▌  ███   ███   ███ ▀▀███▀▀▀',
\'            ███    ███ ███   ███   ███   ███   ███    █▄',
\'            ███    ███ ███   ███   ███   ███   ███    ███',
\'             ▀██████▀  █▀     ▀█   ███   █▀    ██████████',
\'                                                         ',
\'                                                         ',
\]

let g:startify_files_number = 6
let g:startify_dir_number = 6

" session
let g:startify_session_dir = g:session_dir
" 自动保存，注意，只会自动保存载入的session
let g:startify_session_persistence = 1
" 保存session之前自动执行命令
let g:startify_session_before_save = [
    \ 'echo "Cleaning up before saving.."',
    \ 'silent! NERDTreeTabsClose'
    \ ]

" bookmarks 书签
let g:startify_bookmarks = [
            \ g:vimwiki_path . '/草稿/todo.md',
            \ g:vimwiki_path . '/草稿/快速笔记.md',
            \ g:quicknote_file
            \ ]

" command 命令
let g:startify_commands = [
    \ {'u': ['插件更新', 'PlugUpdate']},
    \ {'t': ['打开终端', 'terminal']},
    \ {'w': ['笔记列表', 'VimwikiIndex']},
    \ {'s': ['启动时间', 'StartupTime']},
    \ ]

let g:startify_lists = [
       \ { 'type': 'sessions',  'header': ['        Sessions']       },
       \ { 'type': 'bookmarks', 'header': ['        Bookmarks']      },
       \ { 'type': 'files',     'header': ['        MRU']            },
       \ { 'type': 'dir',       'header': ['        MRU '. getcwd()] },
       \ { 'type': 'commands',  'header': ['        Commands']       },
       \ ]

" 打开buffer也显示startify
" autocmd BufEnter *
"      \ if !exists('t:startify_new_tab') && empty(expand('%')) && !exists('t:goyo_master') |
"      \   let t:startify_new_tab = 1 |
"      \   Startify |
"      \ endif
