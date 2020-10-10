" 不使用clangd
let g:ycm_use_clangd = 2
" .ycm_extra_conf.py的路径
" let g:ycm_global_ycm_extra_conf='~/.config/nvim/.ycm_extra_conf.py'
"打开加载.ycm_extra_conf.py提示
let g:ycm_confirm_extra_conf=3
" 错误和警告标志
let g:ycm_error_symbol = '■'
let g:ycm_warning_symbol = '▲'
" 开启语法检查
let g:ycm_show_diagnostics_ui = 3
let g:ycm_enable_diagnostic_highlighting = 2
let g:ycm_enable_diagnostic_signs = 2
"在注释输入中也能补全
let g:ycm_complete_in_comments = 3
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 3
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 1
"开启基于tag的补全，可以在这之后添加需要的标签路径
let g:ycm_collect_identifiers_from_tags_files = 1
" 开启 YCM 基于标签引擎
let g:ycm_collect_identifiers_from_tags_files = 1
" 从第1个键入字符就开始罗列匹配项
let g:ycm_min_num_of_chars_for_completion = 1
" 语义补全快捷键
let g:ycm_key_invoke_completion = '<c-space>'
" 允许缓存匹配项
let g:ycm_cache_omnifunc = 1
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
" 黑名单，不启用ycm
let g:ycm_filetype_blacklist = {
            \ 'tagbar': 1,
            \ 'netrw': 1,
            \ 'unite': 1,
            \ 'pandoc': 1,
            \ 'infolog': 1,
            \ 'coc-explorer': 1,
            \ 'vista': 1,
            \ 'leaderf': 1,
            \ 'startify': 1
            \ }
" 仅关闭语义补全不关闭标识符补全
let g:ycm_filetype_specific_completion_to_disable = {
            \ 'gitcommit': 1,
            \ 'markdown': 1,
            \ 'mail': 1,
            \ 'text': 1,
            \ 'vimwiki': 1,
            \ 'notes': 1,
            \ }

" " 触发语义补全条件
" let g:ycm_semantic_triggers =  {
	" \   'c' : ['->', '.'],
	" \   'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
	" \             're!\[.*\]\s'],
	" \   'ocaml' : ['.', '#'],
	" \   'cpp,objcpp' : ['->', '.', '::'],
	" \   'perl' : ['->'],
	" \   'php' : ['->', '::'],
	" \   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
	" \   'ruby' : ['.', '::'],
	" \   'lua' : ['.', ':'],
	" \   'erlang' : [':'],
" \ }

nmap <silent> gd :YcmCompleter GoToDefinition<cr>
nmap <silent> gy :YcmCompleter GoToType<cr>
nmap <silent> gi :YcmCompleter GoToImplementation<cr>
nmap <silent> gr :YcmCompleter GoToReference<cr>

nmap <silent> <space>f    :YcmCompleter FixIt<cr>
nmap <silent> <space>rn   :YcmCompleter RefactorRename<cr>
nmap <silent> <space>a    :YcmDiags<cr>
nmap <silent> <space>A    :YcmShowDetailedDiagnostic<cr>

let s:ycm_hover_popup = -1
function s:Hover()
  let response = youcompleteme#GetCommandResponse( 'GetDoc' )
  if response == ''
    return
  endif

  call popup_hide( s:ycm_hover_popup )
  let s:ycm_hover_popup = popup_atcursor( balloon_split( response ), {} )
endfunction

" CursorHold triggers in normal mode after a delay
autocmd CursorHold * call s:Hover()
" Or, if you prefer, a mapping:
nnoremap <silent> K :call <SID>Hover()<CR>
nmap <leader>D <plug>(YCMHover)
