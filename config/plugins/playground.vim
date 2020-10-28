lua << EOF
    require "nvim-treesitter.configs".setup {
        playground = {
            enable = false,
            disable = {},
            updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
            persist_queries = false -- Whether the query persists across vim sessions
        }
    }
EOF
