lua << EOF

require'nvim-treesitter.configs'.setup {
    rainbow = {
        enable = true,
        extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
    }
}

EOF
