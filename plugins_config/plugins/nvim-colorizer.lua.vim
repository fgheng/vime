if has('termguicolors')
    set termguicolors
else
    finish
endif

lua << EOF

require'colorizer'.setup()

EOF
