if !common#functions#HasPlug("nvim-treesitter")

lua <<EOF
require'nvim-treesitter.configs'.setup {
  matchup = {
    enable = true,              -- mandatory, false will disable the whole extension
    disable = {},  -- optional, list of language that will be disabled
  },
}
EOF

endif
