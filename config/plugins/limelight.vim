" limelight config begin

" if !empty(glob(plug_home."/limelight.vim"))
    let g:limelight_conceal_ctermfg = 'gray'
    let g:limelight_conceal_ctermfg = 240
    let g:limelight_conceal_guifg = 'DarkGray'
    let g:limelight_conceal_guifg = '#777777'
    let g:limelight_default_coefficient = 0.7

    " 上下多少行
    let g:limelight_paragraph_span = 5

    " Beginning/end of paragraph
    "   When there's no empty line between the paragraphs
    "   and each paragraph starts with indentation
    let g:limelight_bop = '^\s'
    let g:limelight_eop = '\ze\n^\s'

    " 默认10，设置成-1灰色部分也高亮显示
    let g:limelight_priority = -1

    " 启动goyo的时候自动启动limelight
    autocmd! User GoyoEnter Limelight
    autocmd! User GoyoLeave Limelight!

" endif
" limelight config end
