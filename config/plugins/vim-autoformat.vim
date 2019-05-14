
" 需要安装相应的格式化工具
" js-beautiful:js, html, css, json
" astyle:c, c++, java,
" autopep8:python
"
" 选择下一个格式化工具 :NextFormatter and :PreviousFormatter
" 查看当前的格式化工具 :CurrentFormatter
"
" 可以选择一部分进行格式化
"
autocmd FileType vim,tex let b:autoformat_autoindent=0
" let g:autoformat_autoindent = 1
" let g:autoformat_retab = 0
" let g:autoformat_remove_trailing_spaces = 1
"
" 可以自定义格式化命令,
" my_custom_cs是标签，表示一个命令，formatters_cs = []表示使用my_custom_cs对c#进行格式化
" 其中cs表示文件类型，c cpp py js
" let g:formatdef_my_custom_cs = '"astyle --mode=cs --style=ansi -pcHs".&shiftwidth'
" let g:formatters_cs = ['my_custom_cs']
let g:formatdef_my_custom_c = "'astyle --mode=c --style=allman '"
let g:formatters_c = ['my_custom_c']
let g:formatdef_my_custom_h = '"astyle --mode=c --style=allman" '
let g:formatters_h = ['my_custom_h']

let g:formatdef_my_custom_cpp = "'astyle --style=google' "
let g:formatters_cpp = ['my_custom_cpp']
let g:formatdef_my_custom_hpp = "'astyle --style=google' "
let g:formatters_hpp = ['my_custom_hpp']

" let g:formatdef_my_custom_py = "'autopep8 --in-place --aggressive --max-line-length=80 --range '.a:firstline.' '.a:lastline"
let g:formatdef_my_custom_py = "'autopep8 --in-place --aggressive --max-line-length=120 '"
" let g:formatdef_my_custom_py = '"yapf --in-place --aggressive --style chromium"'
let g:formatters_py = ['my_custom_py']
" let g:formatter_yapf_style = 'chromium'

let g:formatdef_my_custom_java = "'astyle --style=java'"
let g:formatters_java = ['my_custom_java']
