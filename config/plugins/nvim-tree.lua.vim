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

function! s:selectWindow(filepath)
    if tabpagewinnr(tabpagenr(), '$') > 2
        if exists(':ChooseWin') == 2
            ChooseWin
        else
            if has('nvim')
                let input = input({
                            \ 'prompt'      : 'ChooseWin No.: ',
                            \ 'cancelreturn': 0,
                            \ })
                if input == 0 | return | endif
            else
                let input = input('ChooseWin No.: ')
            endif
            if input == winnr() | return | endif
            exec input . 'wincmd w'
        endif

        if &ft == 'defx'
            return
        else
            exec 'e' a:filepath
        endif

    else
        exec 'wincmd w'
        exec 'e' a:filepath
    endif
endfunction

lua <<EOF
    local function get_lua_cb(cb_name)
        return string.format(":lua require'nvim-tree'.on_keypress('%s')<CR>", cb_name)
    end

    vim.g.nvim_tree_bindings = {
        -- ["<cr>"]           = get_lua_cb("edit"),
        ["<cr>"]           = ":<SID>selectWindow()",
        ["o"]              = get_lua_cb("edit"),
        ["l"]              = get_lua_cb("edit"),
        ["<2-LeftMouse>"]  = get_lua_cb("edit"),
        ["<2-RightMouse>"] = get_lua_cb("cd"),
        ["<cr>"]           = get_lua_cb("cd"),
        ["<C-v>"]          = get_lua_cb("vsplit"),
        ["<C-s>"]          = get_lua_cb("split"),
        ["<C-t>"]          = get_lua_cb("tabnew"),
        ["h"]              = get_lua_cb("close_node"),
        ["<Tab>"]          = get_lua_cb("preview"),
        ["I"]              = get_lua_cb("toggle_ignored"),
        ["."]          = get_lua_cb("toggle_dotfiles"),
        ["r"]              = get_lua_cb("refresh"),
        ["N"]              = get_lua_cb("create"),
        ["D"]              = get_lua_cb("remove"),
        ["R"]              = get_lua_cb("rename"),
        ["<C-r>"]          = get_lua_cb("full_rename"),
        ["dd"]             = get_lua_cb("cut"),
        ["Y"]              = get_lua_cb("copy"),
        ["P"]              = get_lua_cb("paste"),
        ["<leader>gk"]     = get_lua_cb("prev_git_item"),
        ["<leader>gj"]     = get_lua_cb("next_git_item"),
        ["<bs>"]           = get_lua_cb("dir_up"),
        ["q"]              = get_lua_cb("close"),
    }
EOF

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

set termguicolors " this variable must be enabled for colors to be applied properly

" a list of groups can be found at `:help nvim_tree_highlight`
highlight NvimTreeFolderIcon guibg=blue

nnoremap <F2> :NvimTreeToggle<CR>
nnoremap <f> :NvimTreeFindFile<CR>
" NvimTreeOpen and NvimTreeClose are also available if you need them
