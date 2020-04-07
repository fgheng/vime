let SessionLoad = 1
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
let AutoPairsMapBS =  1 
let VM_mouse_mappings =  0 
let AutoPairsShortcutBackInsert = "<M-b>"
let AutoPairsLoaded =  1 
let AutoPairsShortcutToggle = "<M-p>"
let AutoPairsMapCR =  1 
let Lf_PopupColorscheme = "gruvbox_material"
let AutoPairsMapCh =  1 
let VM_Extend_hl = "Visual"
let NERDCommentEmptyLines = "0"
let VM_default_mappings =  1 
let VM_persistent_registers =  0 
let AutoPairsShortcutFastWrap = "<M-e>"
let VM_Insert_hl = "Cursor"
let VM_Mono_hl = "Cursor"
let NERDMenuMode = "3"
let NERDDefaultNesting = "1"
let VM_highlight_matches = "underline"
let NERDUsePlaceHolders = "1"
let NERDToggleCheckAllLines =  1 
let NERDSpaceDelims =  1 
let NERDLPlace = "[>"
let NERDDefaultAlign = "none"
let NERDCreateDefaultMappings = "1"
let Lf_StlColorscheme = "gruvbox_material"
let VM_show_warnings =  0 
let AutoPairsMultilineClose =  1 
let NERDCommentWholeLinesInVMode = "0"
let NERDRPlace = "<]"
let AutoPairsShortcutJump = "<M-n>"
let AutoPairsMapSpace =  1 
let NERDRemoveExtraSpaces = "0"
let NERDRemoveAltComs = "1"
let AutoPairsFlyMode =  0 
let NERDTrimTrailingWhitespace = "0"
let NERDBlockComIgnoreEmpty = "0"
let AutoPairsCenterLine =  1 
let NERDDisableTabsInBlockComm = "0"
let VM_check_mappings =  1 
let NERDCompactSexyComs = "0"
let NERDAllowAnyVisualDelims = "1"
let AutoPairsSmartQuotes =  1 
let VM_theme = "ocean"
let VM_Cursor_hl = "Cursor"
let AutoPairsMoveCharacter = "()[]{}\"'"
let AutoPairsWildClosedPair = ""
silent only
cd ~/Documents/wiki/笔记/人工智能/code/深度学习入门基于python的理论与实践
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +20 感知机.py
badd +47 ~/.dotfiles/nvim/coc-settings.json
badd +29 ~/Documents/wiki/笔记/index.md
badd +7 ~/Documents/wiki/笔记/人工智能/index.md
badd +18 ~/Documents/wiki/index.md
badd +1 ~/Documents/wiki/笔记/latex/index.md
badd +20 term://~/Documents/wiki/笔记/人工智能/code/深度学习入门基于python的理论与实践//9008:/bin/zsh
badd +3 ~/Documents/wiki/笔记/科学计算/index.md
badd +0 ~/Documents/wiki/笔记/科学计算/numpy.md
badd +50 ~/.dotfiles/nvim/config/keymap.vim
argglobal
%argdel
$argadd 感知机.py
edit ~/.dotfiles/nvim/config/keymap.vim
set splitbelow splitright
set nosplitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
setlocal fdm=expr
setlocal fde=b:anyfold_ind_buffer[v:lnum-1]
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 50 - ((32 * winheight(0) + 27) / 54)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
50
normal! 027|
tabnew
set splitbelow splitright
set nosplitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
if bufexists("term://~/Documents/wiki/笔记/人工智能/code/深度学习入门基于python的理论与实践//9008:/bin/zsh") | buffer term://~/Documents/wiki/笔记/人工智能/code/深度学习入门基于python的理论与实践//9008:/bin/zsh | else | edit term://~/Documents/wiki/笔记/人工智能/code/深度学习入门基于python的理论与实践//9008:/bin/zsh | endif
if &buftype ==# 'terminal'
  silent file term://~/Documents/wiki/笔记/人工智能/code/深度学习入门基于python的理论与实践//9008:/bin/zsh
endif
setlocal fdm=manual
setlocal fde=b:anyfold_ind_buffer[v:lnum-1]
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 23 - ((22 * winheight(0) + 27) / 54)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
23
normal! 07|
tabedit ~/Documents/wiki/笔记/科学计算/numpy.md
set splitbelow splitright
set nosplitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
setlocal fdm=manual
setlocal fde=b:anyfold_ind_buffer[v:lnum-1]
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 17 - ((16 * winheight(0) + 27) / 54)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
17
normal! 0227|
tabnext 1
if exists('s:wipebuf') && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 winminheight=1 winminwidth=1 shortmess=filnxtToOFcI
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
