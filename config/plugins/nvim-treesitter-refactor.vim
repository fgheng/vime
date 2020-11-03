lua <<EOF
    require'nvim-treesitter.configs'.setup {
        refactor = {
            highlight_definitions = { enable = true },   -- 定义高亮
            highlight_current_scope = { enable = false }, -- 范围高亮

            -- 智能重命名
            smart_rename = {
                enable = false,
                keymaps = {
                    smart_rename = "grr"            -- mapping to rename reference under cursor
                }
            },

            -- 导航
            navigation = {
                enable = false,
                keymaps = {
                    goto_definition = "gnd",        -- mapping to go to definition of symbol under cursor
                    list_definitions = "gnD",       -- mapping to list all definitions in current file
                    goto_next_usage = "<a-*>",
                    goto_previous_usage = "<a-#>",
                }
            }
        },
    }
EOF
