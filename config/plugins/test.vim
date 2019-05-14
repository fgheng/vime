" 用于测试插件配置
"
if has('nvim')
  fu! OpenTerminal()
   " open split windows on the topleft
   botright split
   " resize the height of terminal windows to 30
   resize 15
   :terminal
  endf
else
  fu! OpenTerminal()
   " open split windows on the topleft
   botright split
   " resize the height of terminal windows to 30
   resize 15
   :call term_start('bash', {'curwin' : 1, 'term_finish' : 'close'})
  endf
endif

nnoremap <c-t> :call OpenTerminal()<cr>

command! -nargs=0 Ter :call OpenTerminal()<cr>
