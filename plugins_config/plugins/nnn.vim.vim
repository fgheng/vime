" Disable default mappings
let g:nnn#set_default_mappings = 0

" Then set your own
"nnoremap <silent> <F2> :NnnPicker<CR>

" Start nnn in the current file's directory
nnoremap <silent> <F2> :NnnPicker '%:p:h'<CR>

" Opens the nnn window in a split
"let g:nnn#layout = 'new' " or vnew, tabnew etc.
"" Or pass a dictionary with window size
"let g:nnn#layout = { 'left': '~20%' } " or right, up, down
