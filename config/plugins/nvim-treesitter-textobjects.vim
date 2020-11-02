lua <<EOF
    require'nvim-treesitter.configs'.setup {
        -- 文本块，可以快速操作一些函数块，比如代码块，类块等
        textobjects = {
            select = {
                enable = true,
                keymaps = {
                    -- You can use the capture groups defined in textobjects.scm
                    -- ["af"] = "@function.outer",
                    -- ["if"] = "@function.inner",
                    -- ["ac"] = "@class.outer",
                    -- ["ic"] = "@class.inner",

                    -- Or you can define your own textobjects like this
                    -- ["iF"] = {
                        -- python = "(function_definition) @function",
                        -- cpp = "(function_definition) @function",
                        -- c = "(function_definition) @function",
                        -- java = "(method_declaration) @function",
                    -- },

                    ["af"] = "@function.outer",
                    ["if"] = "@function.inner",
                    -- ["aC"] = "@class.outer",
                    -- ["iC"] = "@class.inner",
                    ["ac"] = "@class.outer",
                    ["ic"] = "@class.inner",
                    -- ["ac"] = "@conditional.outer",
                    -- ["ic"] = "@conditional.inner",
                    ["ai"] = "@conditional.outer",
                    ["ii"] = "@conditional.inner",
                    ["ab"] = "@block.outer",
                    ["ib"] = "@block.inner",
                    -- ["ae"] = "@block.outer",
                    -- ["ie"] = "@block.inner",
                    ["al"] = "@loop.outer",
                    ["il"] = "@loop.inner",
                    ["is"] = "@statement.inner",
                    ["as"] = "@statement.outer",
                    ["ad"] = "@comment.outer",
                    ["am"] = "@call.outer",
                    ["im"] = "@call.inner"
                },
            },

            swap = {
                enable = true,
                swap_next = {
                    ["<leader>a"] = "@parameter.inner",
                },
                swap_previous = {
                    ["<leader>A"] = "@parameter.inner",
                },
            },


            move = {
                enable = true,
                goto_next_start = {
                    ["]m"] = "@function.outer",
                    ["]]"] = "@class.outer",
                },
                goto_next_end = {
                    ["]M"] = "@function.outer",
                    ["]["] = "@class.outer",
                },
                goto_previous_start = {
                    ["[m"] = "@function.outer",
                    ["[["] = "@class.outer",
                },
                goto_previous_end = {
                    ["[M"] = "@function.outer",
                    ["[]"] = "@class.outer",
                },
            },

            lsp_interop = {
                enable = false,
                peek_definition_code = {
                    ["df"] = "@function.outer",
                    ["dF"] = "@class.outer",
                },
            },
        },
    }
EOF
