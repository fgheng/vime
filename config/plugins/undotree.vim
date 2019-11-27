nnoremap <F4> :UndotreeToggle<cr>
set undofile
set undodir=$HOME"/.cache/undo"
if !exists('g:undotree_WindowLayout')
    let g:undotree_WindowLayout = 4
endif
