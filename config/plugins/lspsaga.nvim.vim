lua << EOF

local saga = require 'lspsaga'
saga.init_lsp_saga {
    use_saga_diagnostic_sign = true,
    error_sign = '',
    warn_sign = '',
    hint_sign = '',
    infor_sign = '',
    dianostic_header_icon = '   ',
    code_action_icon = ' ',
    code_action_prompt = {
      enable = true,
      sign = true,
      sign_priority = 20,
      virtual_text = true,
    },
    finder_definition_icon = '  ',
    finder_reference_icon = '  ',
    max_preview_lines = 10, -- preview lines of lsp_finder and definition preview
    finder_action_keys = {
      open = 'o', vsplit = 's',split = 'i',quit = 'q',scroll_down = '<C-f>', scroll_up = '<C-b>' -- quit can be a table
    },
    code_action_keys = {
      quit = 'q',exec = '<CR>'
    },
    rename_action_keys = {
      quit = '<C-c>',exec = '<CR>'  -- quit can be a table
    },
    definition_preview_icon = '  ',
    -- "single" "double" "round" "plus"
    border_style = "single",
    rename_prompt_prefix = '➤',
    -- if you don't use nvim-lspconfig you must pass your server name and
    -- the related filetypes into this table
    -- like server_filetype_map = {metals = {'sbt', 'scala'}}
    -- server_filetype_map = {}
}

EOF
" go to definition
nnoremap <silent> gd :Lspsaga lsp_finder<CR>
" show documents
nnoremap <silent>K :Lspsaga hover_doc<CR>
" signature help
nnoremap <silent> gs :Lspsaga signature_help<CR>
" fix
nnoremap <silent> <space>f :Lspsaga code_action<CR>
vnoremap <silent> <space>f :<C-U>Lspsaga range_code_action<CR>
" rename
nnoremap <silent> <space>rn :Lspsaga rename<CR>
" preview definition
nnoremap <silent> gp :Lspsaga preview_definition<CR>
" jump diagnostic
nnoremap <silent> <M-j> :Lspsaga diagnostic_jump_next<CR>
nnoremap <silent> <M-k> :Lspsaga diagnostic_jump_prev<CR>
