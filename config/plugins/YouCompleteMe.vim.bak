
" youcomplete config begin
" if !empty(glob(plug_home."/YouCompleteMe"))
" brief:
" 使用tsserver代替tern
" python ./install.py --clang-completer --go-completer --ts-completer --java-completer
" 需要pip install neovim

" 原本位于~/.vim/plugins/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.
"let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'

"let g:ycm_error_symbol = '>>' "✖✘ㄨ✕✕
"let g:ycm_warning_symbol = '--' "◯➤
" let g:ycm_log_level = 'debug'
"打开加载.ycm_extra_conf.py提示
let g:ycm_confirm_extra_conf=1
" 屏蔽语法检查， 使用ale
let g:ycm_show_diagnostics_ui = 0
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_enable_diagnostic_signs = 0
"在注释输入中也能补全
let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 1
"开启基于tag的补全，可以在这之后添加需要的标签路径
let g:ycm_collect_identifiers_from_tags_files = 1
" 开启 YCM 基于标签引擎
let g:ycm_collect_identifiers_from_tags_files=1
" 从第2个键入字符就开始罗列匹配项
let g:ycm_min_num_of_chars_for_completion=1
" 允许缓存匹配项
let g:ycm_cache_omnifunc=1
" 语法关键字补全
let g:ycm_seed_identifiers_with_syntax=1
"补全后自动关闭预览窗口, 以后支持悬浮窗口就好了
"let g:ycm_autoclose_preview_window_after_completion = 1
"离开插入模式后自动关闭预览窗口
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
"语法关键字补全
let g:ycm_seed_identifiers_with_syntax = 1
"整合UltiSnips的提示
let g:ycm_use_ultisnips_completer = 1
"在实现和声明之间跳转,并分屏打开, 以后支持悬浮窗口就好了
" let g:ycm_goto_buffer_command = 'horizontal-split'
let g:ycm_goto_buffer_command = 'vertical-split'
" 自动补全python的import等，不用ctrl space了
let g:ycm_semantic_triggers = {'python': ['re!from\s+\S+\s+import\s']}
" 可以同时安装clang和clangd，默认启动clangd除非设置下面
let g:ycm_use_clangd = 0
let g:ycm_filetype_whitelist = {
            \ "c":1,
            \ 'h': 1,
            \ 'hpp': 1,
            \ "cpp":1,
            \ "go":1,
            \ }
            " \ "java":1,
            " \ "ts":1,
            " \ "python":1,
            " \ "javascript":1,
            " \ "javascript.jsx":1,


" let g:ycm_filetype_blacklist = {
"         \ 'tagbar': 1,
"         \ 'notes': 1,
"         \ 'markdown': 1,
"         \ 'netrw': 1,
"         \ 'unite': 1,
"         \ 'text': 1,
"         \ 'vimwiki': 1,
"         \ 'pandoc': 1,
"         \ 'infolog': 1,
"         \ 'mail': 1
"         \ 'html': 1,
"         \ 'css': 1,
"         \ 'xml': 1,
"         \ 'json': 1,
"       \ }
"
" endif
" youcomplete config end
