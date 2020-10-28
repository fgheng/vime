" 自定义tabline
if common#functions#HasPlug('vim-crystalline')
    \ || common#functions#HasPlug('lightline.vim')
    \ || common#functions#HasPlug('vim-airline')
    finish
set showtabline=2
endif
