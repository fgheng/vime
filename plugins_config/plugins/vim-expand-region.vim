" + 扩展，_ 缩小
" 扩展顺序,viw -> viW -> vi" -> vi' -> ...
" let g:expand_region_text_objects = {
"       \ 'iw'  :0,
"       \ 'iW'  :1,
"       \ 'i"'  :1,
"       \ 'i''' :1,
"       \ 'i]'  :1,
"       \ 'ib'  :1,
"       \ 'iB'  :1,
"       \ 'il'  :0,
"       \ 'ip'  :1,
"       \ 'ie'  :1,
"       \ }
"
"let g:expand_region_use_select_mode = 1

" 自定义文本块
"call expand_region#custom_text_objects({
"    \ "\/\\n\\n\<CR>": 1,
"    \ 'a]' :1,
"    \ 'ab' :1,
"    \ 'aB' :1,
"    \ 'ii' :0,
"    \ 'ai' :0,
"    \ })
