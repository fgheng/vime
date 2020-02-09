
nnoremap <F5> :UndotreeToggle<cr>
set undofile
set undodir=$HOME"/.cache/vim/undo"

if !exists('g:undotree_WindowLayout')
    let g:undotree_WindowLayout = 3
endif
