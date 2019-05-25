" 用于测试插件配置
"
if has('nvim')
  " 在当前窗口下打开终端
  fu! OpenTerminalSCurrent()
   " open split windows on the topleft
   echo 'ok'
   belowright split
   " resize the height of terminal windows to 30
   resize 15
   :terminal
   :normal! a
  endf
else
  fu! OpenTerminalSCurrent()
   " open split windows on the topleft
   belowright split
   " resize the height of terminal windows to 30
   resize 15
   :call term_start('bash', {'curwin' : 1, 'term_finish' : 'close'})
   :normal! a
  endf
endif

if has('nvim')
  " 在整个窗口下打开终端
  fu! OpenTerminalSWindow()
   " open vsplit windows on the topleft
   botright split
   " resize the height of terminal windows to 30
   resize 15
   :terminal
   :normal! a
  endf
else
  fu! OpenTerminalS()
   " open vsplit windows on the topleft
   botright split
   " resize the height of terminal windows to 30
   resize 15
   :call term_start('bash', {'curwin' : 1, 'term_finish' : 'close'})
   :normal! a
  endf
endif

" command! -nargs=0 TerSmall :call OpenTerminalSCurrent()<cr>
" command! -nargs=0 TerBig :call OpenTerminalSWindow()<cr>
imap <c-t> <esc>:call OpenTerminalSCurrent()<cr>
nnoremap <c-t> :call OpenTerminalSCurrent()<cr>

" command Ter call OpenTerminalSCurrent()
command Ter call OpenTerminalSWindow()

"-----------------------------------------
function! Tagbar_or_markdown_bar()
    if &ft == 'markdown'
        exe "Toc"
    else
        exe "TagbarToggle"
    endif
endfunction

nnoremap <F3> :call Tagbar_or_markdown_bar()<cr>

"-----------------------------------------changewindowsize
" function! JudgeWindowSize()
"     if wincol() < 85
"         exe "vertical resize 85"
"     endif
" endfunction

" autocmd WinEnter * call JudgeWindowSize()

"----------------------------------------filetype
" markdown 不换行
autocmd FileType markdown setlocal nowrap
" autocmd FileType markdown setlocal spell
