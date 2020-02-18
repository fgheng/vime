" basic usage
" 1. 使用ctrl n来选择当前光标下的单词，使用n进行向下选择，使用N向上选择,
" 使用shift arrows进行选择，然后n选择下一个
" 2. ctrl down/up 垂直多选
" 3. ]/[ 在所有光标之间进行跳转，ctrl f/b
" 4. q，跳过当前选择并将光标移动到下一个选择处
" 5. Q，仅仅取消当前选择不移动下一处
" 6. 使用tab可以在光标模式和visual模式之间进行跳转
" 7. 多光标选中之后使用s可以进行扩展选择，比如siw，si'等
"
"
let g:VM_theme='ocean'
let g:VM_show_warnings = 0 " 取消警告
let g:VM_maps = {}
let g:VM_maps["Add Cursor At Pos"] = '<c-c>' " 增加一个光标
let g:VM_maps['Select All'] = '<c-a>' " 全选
let g:VM_maps["Start Regex Search"]          = '\\/'
let g:VM_maps["Visual Regex"]                = '\\/'
let g:VM_maps["Visual All"]                  = '\\A'
let g:VM_maps["Visual Add"]                  = '\\a'
let g:VM_maps["Visual Find"]                 = '\\f'
let g:VM_maps["Visual Cursors"]              = '\\c'

" let g:VM_maps["Switch Mode"]                 = '<Tab>'
" let g:VM_maps['Find Under'] = '<c-n>' " 用ctrl-d代替ctrl-n
" let g:VM_maps['Find Subword Under'] = '<c-n>'
" let g:VM_maps['Select All'] = '<c-a>' " 全选
" let g:VM_maps["Add Cursor At Pos"] = '<c-c>'
" let g:VM_maps["Add Cursors Up"]               = '<C-Up>'
" let g:VM_maps["Find Next"]                   = '}'
" let g:VM_maps["Find Prev"]                   = '{'
" let g:VM_maps["Goto Next"]                   = ']'
" let g:VM_maps["Goto Prev"]                   = '['
" let g:VM_maps["Seek Next"]                   = '<C-f>'
" let g:VM_maps["Seek Prev"]                   = '<C-b>'
" let g:VM_maps["Remove Region"]               = 'q'
" let g:VM_maps["Invert Direction"]            = 'o'
" let g:VM_maps["Find Operator"]               = "m"
" let g:VM_maps["Surround"]                    = 'S'
" let g:VM_maps["Replace Pattern"]             = 'R'

" let g:VM_maps['Find Subword Under'] = '<c-n>'
" let g:VM_maps['Find Under'] = '<c-n>' " 用ctrl-d代替ctrl-n
" let g:VM_maps['Select All'] = '<c-a>' " 全选
" let g:VM_maps["Find Next"]                   = '}'
" let g:VM_maps["Find Prev"]                   = '{'
" let g:VM_maps["Goto Next"]                   = ']'
" let g:VM_maps["Goto Prev"]                   = '['
" let g:VM_maps["Seek Next"]                   = '<C-f>'
" let g:VM_maps["Seek Prev"]                   = '<C-b>'
" let g:VM_maps["Skip Region"]                 = 'Q'
" let g:VM_maps["Remove Region"]               = 'q'
" let g:VM_maps["Invert Direction"]            = 'o'
" let g:VM_maps["Find Operator"]               = "m"
" let g:VM_maps["Surround"]                    = 'S'
" let g:VM_maps["Replace Pattern"]             = 'R'

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
" let g:VM_maps["Visual Subtract"]             = '\\s'
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
" let g:VM_maps["Toggle Single Region"]        = '\\<CR>'
" let g:VM_maps["Toggle Multiline"]            = '\\M'
" " let g:VM_maps["Switch Mode"]                 = '<Tab>'
" " let g:VM_maps["Find Next"]                   = ']'
" " let g:VM_maps["Find Prev"]                   = '['
" " let g:VM_maps["Goto Next"]                   = '}'
" " let g:VM_maps["Goto Prev"]                   = '{'
" " let g:VM_maps["Seek Next"]                   = '<C-f>'
" " let g:VM_maps["Seek Prev"]                   = '<C-b>'
" " let g:VM_maps["Skip Region"]                 = 'q'
" " let g:VM_maps["Remove Region"]               = 'Q'
" " let g:VM_maps["Invert Direction"]            = 'o'
" " let g:VM_maps["Find Operator"]               = "m"
" " let g:VM_maps["Surround"]                    = 'S'
" " let g:VM_maps["Replace Pattern"]             = 'R'

" " let g:VM_maps["Tools Menu"]                  = '\\`'
" " let g:VM_maps["Show Registers"]              = '\\"'
" " let g:VM_maps["Case Setting"]                = '\\c'
" " let g:VM_maps["Toggle Whole Word"]           = '\\w'
" " let g:VM_maps["Transpose"]                   = '\\t'
" " let g:VM_maps["Align"]                       = '\\a'
" " let g:VM_maps["Duplicate"]                   = '\\d'
" " let g:VM_maps["Rewrite Last Search"]         = '\\r'
" " let g:VM_maps["Merge Regions"]               = '\\m'
" " let g:VM_maps["Split Regions"]               = '\\s'
" " let g:VM_maps["Remove Last Region"]          = '\\q'
" " let g:VM_maps["Visual Subtract"]             = '\\s'
" " let g:VM_maps["Case Conversion Menu"]        = '\\C'
" " let g:VM_maps["Search Menu"]                 = '\\S'

" " let g:VM_maps["Run Normal"]                  = '\\z'
" " let g:VM_maps["Run Last Normal"]             = '\\Z'
" " let g:VM_maps["Run Visual"]                  = '\\v'
" " let g:VM_maps["Run Last Visual"]             = '\\V'
" " let g:VM_maps["Run Ex"]                      = '\\x'
" " let g:VM_maps["Run Last Ex"]                 = '\\X'
" " let g:VM_maps["Run Macro"]                   = '\\@'
" " let g:VM_maps["Align Char"]                  = '\\<'
" " let g:VM_maps["Align Regex"]                 = '\\>'
" " let g:VM_maps["Numbers"]                     = '\\n'
" " let g:VM_maps["Numbers Append"]              = '\\N'
" " let g:VM_maps["Zero Numbers"]                = '\\0n'
" " let g:VM_maps["Zero Numbers Append"]         = '\\0N'
" " let g:VM_maps["Shrink"]                      = "\\-"
" " let g:VM_maps["Enlarge"]                     = "\\+"

" " let g:VM_maps["Toggle Block"]                = '\\<BS>'
" " let g:VM_maps["Toggle Single Region"]        = '\\<CR>'
" " let g:VM_maps["Toggle Multiline"]            = '\\M'
