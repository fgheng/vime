lua << EOF
require('vgit').setup({
    debug = false,
    hunks_enabled = true,
    blames_enabled = true,
    diff_preference = 'horizontal',
    diff_strategy = 'remote',
    predict_hunk_signs = true,
    signs = {
        VGitViewSignAdd = {
            name = 'VGitViewSignAdd',
            line_hl = 'VGitViewSignAdd',
            text_hl = 'VGitViewTextAdd',
            text = '+'
        },
        VGitViewSignRemove = {
            name = 'VGitViewSignRemove',
            line_hl = 'VGitViewSignRemove',
            text_hl = 'VGitViewTextRemove',
            text = '-'
        },
        VGitSignAdd = {
            name = 'VGitSignAdd',
            text_hl = 'VGitSignAdd',
            line_hl = nil,
            text = '│'
        },
        VGitSignRemove = {
            name = 'VGitSignRemove',
            text_hl = 'VGitSignRemove',
            line_hl = nil,
            text = '│'
        },
        VGitSignChange = {
            name = 'VGitSignChange',
            text_hl = 'VGitSignChange',
            line_hl = nil,
            text = '│'
        },
    },
    hls = {
        VGitBlame = {
            bg = nil,
            fg = '#b1b1b1',
        },
        VGitDiffAddSign = {
            bg = '#3d5213',
            fg = nil,
        },
        VGitDiffRemoveSign = {
            bg = '#4a0f23',
            fg = nil,
        },
        VGitDiffAddText = {
            fg = '#6a8f1f',
            bg = '#3d5213',
        },
        VGitDiffRemoveText = {
            fg = '#a3214c',
            bg = '#4a0f23',
        },
        VGitHunkAddSign = {
            bg = '#3d5213',
            fg = nil,
        },
        VGitHunkRemoveSign = {
            bg = '#4a0f23',
            fg = nil,
        },
        VGitHunkAddText = {
            fg = '#6a8f1f',
            bg = '#3d5213',
        },
        VGitHunkRemoveText = {
            fg = '#a3214c',
            bg = '#4a0f23',
        },
        VGitHunkSignAdd = {
            fg = '#d7ffaf',
            bg = '#4a6317',
        },
        VGitHunkSignRemove = {
            fg = '#e95678',
            bg = '#63132f',
        },
        VGitSignAdd = {
            fg = '#d7ffaf',
            bg = nil,
        },
        VGitSignChange = {
            fg = '#7AA6DA',
            bg = nil,
        },
        VGitSignRemove = {
            fg = '#e95678',
            bg = nil,
        },
        VGitIndicator = {
            fg = '#a6e22e',
            bg = nil,
        },
        VGitBorder = {
            fg = '#a1b5b1',
            bg = nil,
        },
        VGitBorderFocus = {
            fg = '#7AA6DA',
            bg = nil,
        },
    },
    blame = {
        hl = 'VGitBlame',
        window = {
            border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
            border_hl = 'VGitBorder',
        },
        format = function(blame, git_config)
            local function round(x)
                return x >= 0 and math.floor(x + 0.5) or math.ceil(x - 0.5)
            end
            local config_author = git_config['user.name']
            local author = blame.author
            if config_author == author then
                author = 'You'
            end
            local time = os.difftime(os.time(), blame.author_time) / (24 * 60 * 60)
            local time_format = string.format('%s days ago', round(time))
            local time_divisions = { { 24, 'hours' }, { 60, 'minutes' }, { 60, 'seconds' } }
            local division_counter = 1
            while time < 1 and division_counter ~= #time_divisions do
                local division = time_divisions[division_counter]
                time = time * division[1]
                time_format = string.format('%s %s ago', round(time), division[2])
                division_counter = division_counter + 1
            end
            local commit_message = blame.commit_message
            if not blame.committed then
                author = 'You'
                commit_message = 'Uncommitted changes'
                local info = string.format('%s • %s', author, commit_message)
                return string.format(' %s', info)
            end
            local max_commit_message_length = 255
            if #commit_message > max_commit_message_length then
                commit_message = commit_message:sub(1, max_commit_message_length) .. '...'
            end
            local info = string.format('%s, %s • %s', author, time_format, commit_message)
            return string.format(' %s', info)
        end
    },
    preview = {
        priority = 10,
        horizontal_window = {
            title = 'Preview',
            border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
            border_hl = 'VGitBorder',
            border_focus_hl = 'VGitBorderFocus'
        },
        current_window = {
            title = 'Current',
            border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
            border_hl = 'VGitBorder',
            border_focus_hl = 'VGitBorderFocus'
        },
        previous_window = {
            title = 'Previous',
            border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
            border_hl = 'VGitBorder',
            border_focus_hl = 'VGitBorderFocus'
        },
        signs = {
            add = 'VGitViewSignAdd',
            remove = 'VGitViewSignRemove',
        },
    },
    history = {
        indicator = {
            hl = 'VGitIndicator'
        },
        horizontal_window = {
            title = 'Preview',
            border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
            border_hl = 'VGitBorder',
            border_focus_hl = 'VGitBorderFocus'
        },
        current_window = {
            title = 'Current',
            border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
            border_hl = 'VGitBorder',
            border_focus_hl = 'VGitBorderFocus'
        },
        previous_window = {
            title = 'Previous',
            border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
            border_hl = 'VGitBorder',
            border_focus_hl = 'VGitBorderFocus'
        },
        history_window = {
            title = 'Git History',
            border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
            border_hl = 'VGitBorder',
            border_focus_hl = 'VGitBorderFocus'
        },
    },
    hunk = {
        priority = 10,
        window = {
            border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
            border_hl = 'VGitBorder',
        },
        signs = {
            add = 'VGitViewSignAdd',
            remove = 'VGitViewSignRemove',
        },
    },
    hunk_sign = {
        priority = 10,
        signs = {
            add = 'VGitSignAdd',
            remove = 'VGitSignRemove',
            change = 'VGitSignChange',
        },
    },
})
EOF

if !common#functions#HasPlug("vim-gitgutter") && !common#functions#HasCocPlug('coc-git')
    nmap <leader>gj <esc>:VGit hunk_down<CR>
    nmap <leader>gk <esc>:VGit hunk_up<CR>

    nmap <leader>gp <esc>:VGit buffer_hunk_preview<CR>
    nmap <leader>gP <esc>:VGit project_hunks_preview<CR>
    nmap <leader>gd <esc>:VGit buffer_diff_preview<CR>
    nmap <leader>gD <esc>:VGit project_diff_preview<CR>

    nmap <leader>gh <esc>:VGit buffer_history_preview<CR>

    nmap <leader>gu <esc>:VGit buffer_hunk_reset<CR>
    nmap <leader>gU <esc>:VGit buffer_reset<CR>

    nmap <leader>gb <esc>:VGit buffer_blame_preview<CR>
    nmap <leader>gB <esc>:VGit buffer_gutter_blame_preview<CR>

    nmap <leader>gt <esc>:VGit toggle_diff_preference<CR>
endif
