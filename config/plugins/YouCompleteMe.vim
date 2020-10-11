" 全局的.ycm_extra_conf.py路径
let g:ycm_global_ycm_extra_conf = g:other_config_root_path . "/ycm_extra_conf.py"
" 最少触发提示单词数量
let g:ycm_min_num_of_chars_for_completion = 1
" 补全列表可见候选条目数量
let g:ycm_max_num_candidates = 20
let g:ycm_max_num_identifier_candidates = 20

let g:ycm_add_preview_to_completeopt = 2

" 开启语法检查
let g:ycm_show_diagnostics_ui = 1
let g:ycm_enable_diagnostic_highlighting = 2
let g:ycm_enable_diagnostic_signs = 2
" 错误和警告标志
let g:ycm_error_symbol = '■'
let g:ycm_warning_symbol = '▲'

"在注释输入中也能补全
let g:ycm_complete_in_comments = 1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 1

" 自定义python解释器路径
" let g:ycm_server_python_interpreter = '~/Software/anaconda3/bin/python3.8'

let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_completion = 1

let g:ycm_key_detailed_diagnostics = '<space>a'

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

nmap <silent> gd :YcmCompleter GoToDefinition<cr>
nmap <silent> gy :YcmCompleter GoToType<cr>
nmap <silent> gi :YcmCompleter GoToImplementation<cr>
nmap <silent> gr :YcmCompleter GoToReferences<cr>

nmap <silent> <space>f    :YcmCompleter FixIt<cr>
nmap <silent> <space>rn   :YcmCompleter RefactorRename<cr>
nmap <silent> <space>a    :YcmDiags<cr>
nmap <silent> <space>A    :YcmShowDetailedDiagnostic<cr>

" 不自动显示悬浮窗口
let g:ycm_auto_hover = ""
nmap <silent> K <plug>(YCMHover)
