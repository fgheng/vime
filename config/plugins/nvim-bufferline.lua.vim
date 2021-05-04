set termguicolors

lua << EOF
require'bufferline'.setup{
options = {
    view = "multiwindow",
    numbers = "buffer_id",
    number_style = "superscript",
    mappings = true,
    buffer_close_icon= '',
    modified_icon = '●',
    close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',
    max_name_length = 18,
    max_prefix_length = 15, -- prefix used when a buffer is deduplicated
    tab_size = 18,
    diagnostics = "nvim_lsp",
    -- diagnostics_indicator = function(count, level)
      -- return "("..count..")"
    -- end,
    show_buffer_close_icons = true,
    persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
    -- can also be a table containing 2 custom separators
    -- [focused and unfocused]. eg: { '|', '|' }
    separator_style = "slant",
    enforce_regular_tabs = true,
    always_show_bufferline = true,
    sort_by = 'relative_directory',

    diagnostics_indicator = function(_, _, diagnostics_dict)
        local s = " "
        for e, n in pairs(diagnostics_dict) do
            local sym = e == "error" and " "
            or (e == "warning" and " " or "" )
            s = s .. n .. sym
        end
        return s
    end
  }
}
EOF

nnoremap <silent><M-l> :BufferLineCycleNext<CR>
nnoremap <silent><M-h> :BufferLineCyclePrev<CR>
tnoremap <silent><M-l> <c-\><c-n>:BufferLineCycleNext<CR>
tnoremap <silent><M-h> <c-\><c-n>:BufferLineCyclePrev<CR>

" These commands will move the current buffer backwards or forwards in the bufferline
nnoremap <silent><M-L> :BufferLineMoveNext<CR>
nnoremap <silent><M-H> :BufferLineMovePrev<CR>
tnoremap <silent><M-L> <c-\><c-n>:BufferLineMoveNext<CR>
tnoremap <silent><M-H> <c-\><c-n>:BufferLineMovePrev<CR>

nnoremap <silent> gb :BufferLinePick<CR>
