set laststatus=0
set showtabline=2
set noshowmode noruler

let g:onestatus_config_path = g:other_config_root_path . "onestatus.json"

fun g:LineNow()
  let l:lineCur = line('.')
  let l:lineTotal = line('$')
  return l:lineCur . "/" . l:lineTotal
endfunc

augroup vime_onestatus_group
    au!
    au BufEnter * :OneStatus
    au CursorMoved * :OneStatus
    exec 'au ExitPre * :!tmux source ' . g:tmux_config_path
augroup END
