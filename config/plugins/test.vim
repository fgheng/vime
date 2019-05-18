" 用于测试插件配置
"
if has('nvim')
  fu! OpenTerminalS()
   " open split windows on the topleft
   botright split
   " resize the height of terminal windows to 30
   resize 15
   :terminal
  endf
else
  fu! OpenTerminalS()
   " open split windows on the topleft
   botright split
   " resize the height of terminal windows to 30
   resize 15
   :call term_start('bash', {'curwin' : 1, 'term_finish' : 'close'})
  endf
endif

if has('nvim')
  fu! OpenTerminalV()
   " open split windows on the topleft
   botright split
   " resize the height of terminal windows to 30
   resize 15
   :terminal
  endf
else
  fu! OpenTerminalS()
   " open split windows on the topleft
   botright split
   " resize the height of terminal windows to 30
   resize 15
   :call term_start('bash', {'curwin' : 1, 'term_finish' : 'close'})
  endf
endif

nnoremap <c-t> :call OpenTerminalS()<cr>
" nnoremap <c-t>s :call OpenTerminalS()<cr>
" nnoremap <c-t>v :call OpenTerminalV()<cr>

command! -nargs=0 Ter :call OpenTerminal()<cr>
