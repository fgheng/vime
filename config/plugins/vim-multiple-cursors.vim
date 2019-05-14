" normal mode / visual mode
" start: <C-n> start multicursor and add a virtual cursor + selection on the match
" next: <C-n> add a new virtual cursor + selection on the next match
" skip: <C-x> skip the next match
" prev: <C-p> remove current virtual cursor + selection and go back on previous match
" select all: <A-n> start muticursor and directly select all matches
" You can now change the virtual cursors + selection with visual mode commands.
" For instance: c, s, I, A work without any issues.
" You could also go to normal mode by pressing v and use normal commands there.

" At any time, you can press <Esc> to exit back to regular Vim.

" NOTE: start with g<C-n> to match without boundaries (behaves like g* instead of *)

" visual mode when multiple lines are selected
" start: <C-n> add virtual cursors on each line
" You can now change the virtual cursors with normal mode commands.
" For instance: ciw.

" command
" The command MultipleCursorsFind accepts a range and a pattern (regexp), it creates a visual cursor at the end of each match.
" If no range is passed in, then it defaults to the entire buffer.
" let g:multi_cursor_use_default_mapping=0

" Default mapping
" let g:multi_cursor_start_word_key      = '<C-n>'
" let g:multi_cursor_select_all_word_key = '<A-n>'
" let g:multi_cursor_start_key           = 'g<C-n>'
" let g:multi_cursor_select_all_key      = 'g<A-n>'
" let g:multi_cursor_next_key            = '<C-n>'
" let g:multi_cursor_prev_key            = '<C-p>'
" let g:multi_cursor_skip_key            = '<C-x>'
" let g:multi_cursor_quit_key            = '<Esc>'

" let g:VM_leader = "'"
" " 取消默认按键映射
let g:VM_default_mappings = 0
" 开启鼠标选择
let g:VM_mouse_mappings = 0

let g:VM_maps = {}
let g:VM_maps["Switch Mode"]                 = '<Tab>'
" 当前位置插入光标
let g:VM_maps["Add Cursor At Pos"]           = '<C-c>'
let g:VM_maps['Find Under']                  = '<C-n>'
let g:VM_maps['Find Subword Under']          = '<C-n>'
let g:VM_maps["Select All"]                  = '<c-a>'
let g:VM_maps["Skip Region"]                 = '<C-s>'
let g:VM_maps["Add Cursor Down"]             = '<C-Down>'
let g:VM_maps["Add Cursor Up"]               = '<C-Up>'

let g:VM_maps["Alt Skip"]                    = 'q'
let g:VM_maps["Remove Region"]               = 'Q'
let g:VM_maps["Invert Direction"]            = 'o'
let g:VM_maps["Find Operator"]               = "m"
let g:VM_maps["Surround"]                    = 'S' " 需要vim-Surround支持

let g:VM_maps["Find Next"]                   = ']'
let g:VM_maps["Find Prev"]                   = '['
let g:VM_maps["Goto Next"]                   = '}'
let g:VM_maps["Goto Prev"]                   = '{'

let g:VM_maps["Visual Regex"]                = '\\/'
let g:VM_maps["Visual All"]                  = '\\A'
let g:VM_maps["Visual Add"]                  = '\\a'

" let g:VM_maps["D"]                           = 'D'
" let g:VM_maps["Y"]                           = 'Y'
" let g:VM_maps["x"]                           = 'x'
" let g:VM_maps["X"]                           = 'X'
" let g:VM_maps["J"]                           = 'J'
" let g:VM_maps["~"]                           = '~'
" let g:VM_maps["Del"]                         = '<del>'
" let g:VM_maps["Dot"]                         = '.'
" let g:VM_maps["Increase"]                    = '<C-a>'
" let g:VM_maps["Decrease"]                    = '<C-x>'
" let g:VM_maps["a"]                           = 'a'
" let g:VM_maps["A"]                           = 'A'
" let g:VM_maps["i"]                           = 'i'
" let g:VM_maps["I"]                           = 'I'
" let g:VM_maps["o"]                           = '\\o'
" let g:VM_maps["O"]                           = '\\O'
" let g:VM_maps["c"]                           = 'c'
" let g:VM_maps["C"]                           = 'C'
" let g:VM_maps["Yank"]                        = 'y'
" let g:VM_maps["Delete"]                      = 'd'
" let g:VM_maps["Replace"]                     = 'r'
" let g:VM_maps["Replace Pattern"]             = 'R'
" let g:VM_maps["p Paste Regions"]             = 'p'
" let g:VM_maps["P Paste Regions"]             = 'P'
" let g:VM_maps["p Paste Vimreg"]              = '\\p'
" let g:VM_maps["P Paste Vimreg"]              = '\\P'
"

"-----------------------------------------------------"
" let g:VM_maps["Tools Menu"]                  = '\\`'
" let g:VM_maps["Show Registers"]              = '\\"'
" let g:VM_maps["Case Setting"]                = '\\c'
" let g:VM_maps["Toggle Whole Word"]           = '\\w'
" let g:VM_maps["Transpose"]                   = '\\t'
" let g:VM_maps["Align"]                       = '\\a'
" let g:VM_maps["Duplicate"]                   = '\\d'
" let g:VM_maps["Rewrite Last Search"]         = '\\r'
" let g:VM_maps["Merge Regions"]               = '\\m'
" let g:VM_maps["Split Regions"]               = '\\s'
" let g:VM_maps["Remove Last Region"]          = '\\q'
" let g:VM_maps["Case Conversion Menu"]        = '\\C'
" let g:VM_maps["Search Menu"]                 = '\\S'

" let g:VM_maps["Run Normal"]                  = '\\z'
" let g:VM_maps["Run Last Normal"]             = '\\Z'
" let g:VM_maps["Run Visual"]                  = '\\v'
" let g:VM_maps["Run Last Visual"]             = '\\V'
" let g:VM_maps["Run Ex"]                      = '\\x'
" let g:VM_maps["Run Last Ex"]                 = '\\X'
" let g:VM_maps["Run Macro"]                   = '\\@'
" let g:VM_maps["Align Char"]                  = '\\<'
" let g:VM_maps["Align Regex"]                 = '\\>'
" let g:VM_maps["Numbers"]                     = '\\n'
" let g:VM_maps["Numbers Append"]              = '\\N'
" let g:VM_maps["Zero Numbers"]                = '\\0n'
" let g:VM_maps["Zero Numbers Append"]         = '\\0N'
" let g:VM_maps["Shrink"]                      = "\\-"
" let g:VM_maps["Enlarge"]                     = "\\+"

" let g:VM_maps["Toggle Block"]                = '\\<BS>'
" let g:VM_maps["Toggle Only This Region"]     = '\\<CR>'

" let g:VM_maps["Visual Subtract"]             = '\\s'
