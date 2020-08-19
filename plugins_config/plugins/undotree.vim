
set undofile
set undodir = g:undo_dir
if !exists('g:undotree_WindowLayout')
    let g:undotree_WindowLayout = 3
endif

nnoremap <F5> :UndotreeToggle<cr>
