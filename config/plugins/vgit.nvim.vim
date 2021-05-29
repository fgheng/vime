lua << EOF
require('vgit').setup({
    hunks_enabled = true,
    blames_enabled = true,
    hls = {
        VGitBlame = {
            bg = nil,
            fg = '#7D8893',
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
        VGitHistoryIndicator = {
            fg = '#a6e22e',
            bg = nil,
        },
        VGitDiffCurrentBorder = {
            fg = '#a1b5b1',
            bg = nil,
        },
        VGitDiffPreviousBorder = {
            fg = '#a1b5b1',
            bg = nil,
        },
        VGitHistoryCurrentBorder = {
            fg = '#a1b5b1',
            bg = nil,
        },
        VGitHistoryPreviousBorder = {
            fg = '#a1b5b1',
            bg = nil,
        },
        VGitHistoryBorder = {
            fg = '#a1b5b1',
            bg = nil,
        },
        VGitHunkBorder = {
            fg = '#a1b5b1',
            bg = nil,
        },
    },
    blame = {
        hl = 'VGitBlame',
        format = function(blame, git_config)
            local round = function(x)
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
            current_window = {
                title = 'Current',
                border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
                border_hl = 'VGitDiffCurrentBorder',
            },
            previous_window = {
                title = 'Previous',
                border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
                border_hl = 'VGitDiffPreviousBorder',
            },
            signs = {
                add = {
                    name = 'VGitDiffAddSign',
                    sign_hl = 'VGitDiffAddSign',
                    text_hl = 'VGitDiffAddText',
                    text = '+'
                },
                remove = {
                    name = 'VGitDiffRemoveSign',
                    sign_hl = 'VGitDiffRemoveSign',
                    text_hl = 'VGitDiffRemoveText',
                    text = '-'
                },
            },
    },
    hunk = {
        priority = 10,
        window = {
            border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
            border_hl = 'VGitHunkBorder',
        },
        signs = {
            add = {
                name = 'VGitHunkAddSign',
                sign_hl = 'VGitHunkAddSign',
                text_hl = 'VGitHunkAddText',
                text = '+'
            },
            remove = {
                name = 'VGitHunkRemoveSign',
                sign_hl = 'VGitHunkRemoveSign',
                text_hl = 'VGitHunkRemoveText',
                text = '-'
            },
        },
    },
    hunk_sign = {
        priority = 10,
        signs = {
            add = {
                name = 'VGitSignAdd',
                hl = 'VGitSignAdd',
                text = '│'
            },
            remove = {
                name = 'VGitSignRemove',
                hl = 'VGitSignRemove',
                text = '│'
            },
            change = {
                name = 'VGitSignChange',
                hl = 'VGitSignChange',
                text = '│'
            },
        },
    },
    history = {
        indicator = {
            hl = 'VGitHistoryIndicator'
        },
        window = {
            title = 'Git History',
            border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
            border_hl = 'VGitHistoryBorder',
        },
        history = {
            indicator = {
                hl = 'VGitHistoryIndicator'
            },
            current_window = {
                title = 'Current',
                border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
                border_hl = 'VGitHistoryCurrentBorder',
            },
            previous_window = {
                title = 'Previous',
                border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
                border_hl = 'VGitHistoryPreviousBorder',
            },
            history_window = {
                title = 'Git History',
                border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
                border_hl = 'VGitHistoryBorder',
            },
        }
    },
})
EOF

if !common#functions#HasPlug("vim-gitgutter") && !common#functions#HasCocPlug('coc-git')
    nmap <leader>gp <esc>:VGit hunk_preview<CR>
    nmap <leader>gP <esc>:VGit buffer_preview<CR>
    nmap <leader>gj <esc>:VGit hunk_down<CR>
    nmap <leader>gk <esc>:VGit hunk_up<CR>
    nmap <leader>gu <esc>:VGit hunk_reset<CR>
    nmap <leader>gU <esc>:VGit buffer_reset<CR>
    nmap <leader>gd <esc>:VGit diff<CR>
    nmap <leader>gh <esc>:VGit buffer_history<CR>
endif
