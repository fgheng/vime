local nvim_lsp = require'nvim_lsp'
nvim_lsp.gopls.setup{
  root_dir = nvim_lsp.util.root_pattern('.git');
}
