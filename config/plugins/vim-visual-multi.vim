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
