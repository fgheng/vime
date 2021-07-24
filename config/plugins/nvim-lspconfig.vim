if !exist("g:lspconfig")
    finish
endif

lua << EOF
-- clangd
require'lspconfig'.clangd.setup{
    cmd = {"clangd", "--background-index"},
    filetypes = { "c", "cpp", "objc", "objcpp" },
    -- root_dir = root_pattern("compile_commands.json", "compile_flags.txt", ".git")
}
EOF
