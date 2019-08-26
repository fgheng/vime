if HasPlug('vim-visual-multi')
    let g:VM_theme = "pray"
    " let g:VM_leader = "'"
    " " 取消默认按键映射
    "let g:VM_default_mappings = 0
    " 开启鼠标选择
    let g:VM_mouse_mappings = 0
    let g:VM_maps = {}
    let g:VM_maps["Add Cursor At Pos"]            = '<c-c>'
    let g:VM_maps['Visual Add']                   = '<c-c>'
    let g:VM_maps["Select All"]                   = '<c-a>'
    let g:VM_maps['Visual All']                   = '<c-a>'

    "let g:VM_maps = {}
    "let g:VM_maps["Switch Mode"]                 = '<Tab>'
    "let g:VM_maps["Add Cursor At Pos"]           = '<C-c>'
    "let g:VM_maps['Visual Add']             = '<C-c>'
    "let g:VM_maps['Find Under']                  = '<C-n>'
    "let g:VM_maps['Find Subword Under']          = '<C-n>'
    "let g:VM_maps["Select All"]                  = '<c-a>'
    "let g:VM_maps["Visual All"]                  = '<c-a>'
    "let g:VM_maps["Skip Region"]                 = '<C-s>'
    "let g:VM_maps["Add Cursors Down"]             = '<C-Down>'
    "let g:VM_maps["Add Cursors Up"]               = '<C-Up>'
    "let g:VM_maps['Start Regex Search']             = '<C-/>'
    "let g:VM_maps['Visual Regex']             = '<C-/>'

    "let g:VM_maps["Alt Skip"]                    = 'q'
    "let g:VM_maps["Remove Region"]               = 'Q'
    "let g:VM_maps["Invert Direction"]            = 'o'
    "let g:VM_maps["Find Operator"]               = "m"
    "let g:VM_maps["Surround"]                    = 'S' " 需要vim-Surround支持

    "let g:VM_maps["Find Next"]                   = ']'
    "let g:VM_maps["Find Prev"]                   = '['
    "let g:VM_maps["Goto Next"]                   = '}'
    "let g:VM_maps["Goto Prev"]                   = '{'

    "let g:VM_maps["Visual Regex"]                = '\\/'
    "let g:VM_maps["Visual All"]                  = '\\A'
    "let g:VM_maps["Visual Add"]                  = '\\a'

endif
