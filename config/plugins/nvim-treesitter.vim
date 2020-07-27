lua <<EOF
require'nvim-treesitter.configs'.setup {
    -- 高亮配置
    highlight = {
        enable = true,                      -- false将禁用整个插件
        disable = {},                       -- 不使用该插件的语言
        custom_captures = {                 -- mapping of user defined captures to highlight groups
          -- ["foo.bar"] = "Identifier"     -- highlight own capture @foo.bar with highlight group "Identifier", see :h nvim-treesitter-query-extensions
        },
    },
    -- 颜色块选择，还不太会使用，暂时保留
    incremental_selection = {
        enable = true,
        disable = {},
        keymaps = {                       -- mappings for incremental selection (visual mappings)
          init_selection = 'gnn',         -- maps in normal mode to init the node/scope selection
          node_incremental = "grn",       -- increment to the upper named parent
          scope_incremental = "grc",      -- increment to the upper scope (as defined in locals.scm)
          node_decremental = "grm",       -- decrement to the previous node
        }
    },
    -- 一些重构方案
    refactor = {
        highlight_definitions = { -- 高亮定义
            enable = true
        },
        highlight_current_scope = { -- 高亮范围
            enable = true
        },
        smart_rename = { -- 智能重命名
            enable = false,
            keymaps = {
            smart_rename = "grr"            -- mapping to rename reference under cursor
            }
        },
        navigation = {
            enable = false,
            keymaps = {
            goto_definition = "gnd",        -- mapping to go to definition of symbol under cursor
            list_definitions = "gnD"        -- mapping to list all definitions in current file
            }
        }
    },
    -- 文本块，可以快速操作一些函数块，比如代码块，类块等
    textobjects = { -- syntax-aware textobjects
        enable = true,
        disable = {},
        keymaps = {
            -- ["iL"] = { -- you can define your own textobjects directly here
            -- python = "(function_definition) @function",
            -- cpp = "(function_definition) @function",
            -- c = "(function_definition) @function",
            -- java = "(method_declaration) @function"
            -- },
            -- or you use the queries from supported languages with textobjects.scm
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["aC"] = "@class.outer",
            ["iC"] = "@class.inner",
            ["ac"] = "@conditional.outer",
            ["ic"] = "@conditional.inner",
            ["ae"] = "@block.outer",
            ["ie"] = "@block.inner",
            ["al"] = "@loop.outer",
            ["il"] = "@loop.inner",
            ["is"] = "@statement.inner",
            ["as"] = "@statement.outer",
            ["ad"] = "@comment.outer",
            ["am"] = "@call.outer",
            ["im"] = "@call.inner"
        }
    },
    -- 解析器的安装，all全部安装
    ensure_installed = 'all' -- one of 'all', 'language', or a list of languages
}
EOF
