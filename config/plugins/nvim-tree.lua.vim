let g:nvim_tree_side = 'left'
let g:nvim_tree_width = 40
let g:nvim_tree_ignore = [ '.git', 'node_modules', '.cache' ]
let g:nvim_tree_auto_open = 0
let g:nvim_tree_auto_close = 0
let g:nvim_tree_quit_on_open = 0
let g:nvim_tree_follow = 1 "0 by default, this option allows the cursor to be updated when entering a buffer
let g:nvim_tree_indent_markers = 1 "0 by default, this option shows indent markers when folders are open
let g:nvim_tree_hide_dotfiles = 1 "0 by default, this option hides files and folders starting with a dot `.`
let g:nvim_tree_git_hl = 0 "0 by default, will enable file highlight for git attributes (can be used without the icons).
let g:nvim_tree_root_folder_modifier = ':~' "This is the default. See :help filename-modifiers for more options
let g:nvim_tree_tab_open = 0 "0 by default, will open the tree when entering a new tab and the tree was previously open
let g:nvim_tree_width_allow_resize  = 1 "0 by default, will not resize the tree when opening a file
let g:nvim_tree_show_icons = {
    \ 'git': 1,
    \ 'folders': 0,
    \ 'files': 1,
    \ }

let g:nvim_tree_icons = {
    \ 'default': ' ',
    \ 'symlink': ' ',
    \ 'git': {
    \   'unstaged': "✗ ",
    \   'staged': "✓ ",
    \   'unmerged': " ",
    \   'renamed': "➜ ",
    \   'untracked': "★ "
    \   },
    \ 'folder': {
    \   'default': " ",
    \   'open': " ",
    \   'symlink': " ",
    \   }
    \ }

" function! s:selectWindow(filepath)
    " if tabpagewinnr(tabpagenr(), '$') > 2
        " if exists(':ChooseWin') == 2
            " ChooseWin
        " else
            " if has('nvim')
                " let input = input({
                            " \ 'prompt'      : 'ChooseWin No.: ',
                            " \ 'cancelreturn': 0,
                            " \ })
                " if input == 0 | return | endif
            " else
                " let input = input('ChooseWin No.: ')
            " endif
            " if input == winnr() | return | endif
            " exec input . 'wincmd w'
        " endif

        " if &ft == 'defx'
            " return
        " else
            " exec 'e' a:filepath
        " endif

    " else
        " exec 'wincmd w'
        " exec 'e' a:filepath
    " endif
" endfunction


lua <<EOF
    local tree_cb = require'nvim-tree.config'.nvim_tree_callback

    -- 使用本地应用打开目录或者文件
    function NvimTreeOSOpen()
        local lib = require "nvim-tree.lib"
        local node = lib.get_node_at_cursor()
        if node then
            vim.fn.jobstart("open '" .. node.absolute_path .. "' &", {detach = true})
        end
    end

    vim.g.nvim_tree_bindings = {
        { key = {"<CR>", "o", "<2-LeftMouse>", "l"}, cb = tree_cb("edit") },
        { key = {"<2-RightMouse>", "<cr>"},     cb = tree_cb("cd") },
        { key = "<C-v>",                        cb = tree_cb("vsplit") },
        { key = "<C-s>",                        cb = tree_cb("split") },
        { key = "<C-t>",                        cb = tree_cb("tabnew") },
        { key = {"<BS>", "h"},                  cb = tree_cb("close_node") },
        { key = "<",                            cb = tree_cb("prev_sibling") },
        { key = ">",                            cb = tree_cb("next_sibling") },
        { key = "<Tab>",                        cb = tree_cb("preview") },
        { key = "K",                            cb = tree_cb("first_sibling") },
        { key = "J",                            cb = tree_cb("last_sibling") },
        { key = "I",                            cb = tree_cb("toggle_ignored") },
        { key = ".",                            cb = tree_cb("toggle_dotfiles") },
        { key = "r",                            cb = tree_cb("refresh") },
        { key = "pp",                           cb = tree_cb("parent_node") },
        { key = "<S-CR>",                       cb = tree_cb("close_node") },
        { key = "N",                            cb = tree_cb("create") },
        { key = "D",                            cb = tree_cb("remove") },
        { key = "R",                            cb = tree_cb("rename") },
        { key = "<C-r>",                        cb = tree_cb("full_rename") },
        { key = "dd",                           cb = tree_cb("cut") },
        { key = "Y",                            cb = tree_cb("copy") },
        { key = "P",                            cb = tree_cb("paste") },
        { key = "y",                            cb = tree_cb("copy_name") },
        { key = "Y",                            cb = tree_cb("copy_path") },
        { key = "gy",                           cb = tree_cb("copy_absolute_path") },
        { key = "<leader>gk",                   cb = tree_cb("prev_git_item") },
        { key = "<leader>gj",                   cb = tree_cb("next_git_item") },
        { key = "<bs>",                         cb = tree_cb("dir_up") },
        { key = "q",                            cb = tree_cb("close") },
        { key = "?",                            cb = tree_cb("toggle_help") }
    }
EOF

set termguicolors " this variable must be enabled for colors to be applied properly

" a list of groups can be found at `:help nvim_tree_highlight`
highlight NvimTreeFolderIcon guibg=blue

nnoremap <F2> :NvimTreeToggle<CR>
" nnoremap <f> :NvimTreeFindFile<CR>
" NvimTreeOpen and NvimTreeClose are also available if you need them
