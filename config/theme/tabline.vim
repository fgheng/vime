" 自定义tabline
if common#functions#HasPlug('vim-crystalline')
    \ || common#functions#HasPlug('lightline.vim')
    \ || common#functions#HasPlug('vim-airline')
    \ || common#functions#HasPlug('lualine.vim')
    finish
set showtabline=2
endif
