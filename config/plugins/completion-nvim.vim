let g:completion_enable_auto_popup = 1
let g:completion_enable_auto_hover = 1
let g:completion_enable_auto_signature = 0
let g:completion_enable_snippet = 'vim-vsnip'
let g:completion_trigger_character = ['.', '::']
let g:completion_auto_change_source = 1

let g:completion_chain_complete_list = {
      \ 'default': [
      \    {'complete_items': ['lsp', 'tags', 'buffers', 'tmux', 'snippet']},
      \  ]}

lua require'lspconfig'.clangd.setup{on_attach=require'completion'.on_attach}
lua require'lspconfig'.pyls.setup{on_attach=require'completion'.on_attach}
lua require'lspconfig'.bashls.setup{on_attach=require'completion'.on_attach}
lua require'lspconfig'.vimls.setup{on_attach=require'completion'.on_attach}
lua require'lspconfig'.tsserver.setup{on_attach=require'completion'.on_attach}
lua require'lspconfig'.yamlls.setup{on_attach=require'completion'.on_attach}
lua require'lspconfig'.rls.setup{on_attach=require'completion'.on_attach}

" autocmd BufEnter * lua require'completion'.on_attach()

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <M-j>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <M-k>   pumvisible() ? "\<C-p>" : "\<S-Tab>"

imap <tab> <Plug>(completion_smart_tab)
imap <s-tab> <Plug>(completion_smart_s_tab)

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

let g:completion_confirm_key = ""
imap <expr> <cr>  pumvisible() ? complete_info()["selected"] != "-1" ?
                 \ "\<Plug>(completion_confirm_completion)"  : "\<c-e>\<CR>" :  "\<CR>"
