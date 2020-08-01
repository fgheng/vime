let g:vimtex_cache_root='~/.cache/vim/vimtex'
" https://zhuanlan.zhihu.com/p/61036165
let g:tex_flavor='latex'

" 80列自动换行
" au FileType tex setl textwidth=80 | setl fo+=t | setl fo-=l

if has("nvim")
    " 用于反向定位
	let g:vimtex_compiler_progname = 'nvr'
endif

" vimtex默认的pdf浏览器
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
let g:tex_conceal='abdmg'

" let g:latex_view_general_viewer = 'zathura'
" let g:latex_view_general_options = shellescape('--synctex-forward "' . exepath(v:progpath) . ' --servername ' . v:servername . ' +{%lline} {%ffile}"')
" let g:latex_view_general_options = shellescape('--synctex-forward "' . v:progname . ' --servername ' . v:servername . ' +{%line} {%file}"')

" if &ft == 'latex' || &ft == 'tex'
"     setlocal spell
"     set spelllang=nl,en_gb
"     inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
" endif

" \ll编译tex文件 (注意：\ll执行后，表示进入continuous mode，每次编辑过后，:w保存文档，对应的pdf就会自动更新)
" \lk(或\ll)停止编译 (注意：当执行\lk或再次执行\ll后，表示退出continuous mode，:w保存文档，对应的pdf就不会自动更新)
" \lv打开pdf阅读器查看文档，或在pdf文档已经打开的情况下向前搜索pdf中对应的目前光标所在位置的内容
" \le打开或关闭编译的报错和警告信息
" \lc清除latex编译文件
" \lt打开目录(可以通过目录跳转)

"     Esc或q退出目录
"     Space跳转
"     Enter跳转并关闭目录

" \li查看latex项目信息，按Esc或q退出
" \lm查看内置的imaps
"
au FileType tex setl tw=80 | setl fo+=t | setl fo-=l | setl fo+=mM
