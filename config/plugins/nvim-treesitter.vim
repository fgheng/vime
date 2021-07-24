" set foldmethod=expr
" set foldexpr=nvim_treesitter#foldexpr()

lua << EOF
    require'nvim-treesitter.configs'.setup {
        -- 解析器的安装，all全部安装
        ensure_installed = 'maintained', -- one of 'all', 'language', or a list of languages

        -- 高亮配置
        highlight = {
            enable = true,                      -- false将禁用整个插件
            disable = {},                       -- 不使用该插件的语言
            custom_captures = {                 -- 自定义高亮组
                -- ["foo.bar"] = "Identifier"
            },
        },

        -- 块选择，还不太会使用，暂时保留
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

        -- indent
        indent = {
            enable = false
        },

        -- rainbow
        rainbow = {
            enable = true,
            disable = {'bash'}
        }

    }
EOF

" treesitter经常在进行一些操作之后丢失渲染，比如撤销操作等
" 使用下面的命令可以恢复
" function s:render() abort
    " exec "write | edit | TSBufEnable highlight"
" endfunc
" nmap <silent> <F4> :call <SID>render()<cr>
