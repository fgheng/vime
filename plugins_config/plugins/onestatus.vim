set laststatus=0
set noshowmode noruler

let g:onestatus_config_path = g:vim_root_path . "/plugins_config/onestatus.json"

fun g:LineNow()
  let l:lineCur = line('.')
  let l:lineTotal = line('$')
  return l:lineCur . "/" . l:lineTotal
endfunc

au BufEnter * :OneStatus
au CursorMoved * :OneStatus
au ExitPre * :!tmux source ~/.tmux.conf
