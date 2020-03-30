let SessionLoad = 1
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
let AutoPairsMapBS =  1 
let VM_mouse_mappings =  0 
let AutoPairsShortcutBackInsert = "<M-b>"
let AutoPairsLoaded =  1 
let AutoPairsShortcutToggle = "<M-p>"
let AutoPairsMapCR =  1 
let AutoPairsMapCh =  1 
let NERDCommentEmptyLines = "0"
let AutoPairsSmartQuotes =  1 
let VM_default_mappings =  1 
let VM_persistent_registers =  0 
let AutoPairsShortcutFastWrap = "<M-e>"
let NERDMenuMode = "3"
let NERDDefaultNesting = "1"
let VM_highlight_matches = "underline"
let AutoPairsCenterLine =  1 
let NERDUsePlaceHolders = "1"
let NERDToggleCheckAllLines =  1 
let NERDSpaceDelims =  1 
let NERDLPlace = "[>"
let NERDDefaultAlign = "none"
let NERDCreateDefaultMappings = "1"
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
let NERDDisableTabsInBlockComm = "0"
let VM_check_mappings =  1 
let NERDCompactSexyComs = "0"
let NERDAllowAnyVisualDelims = "1"
let VM_theme = "ocean"
let AutoPairsMoveCharacter = "()[]{}\"'"
let AutoPairsWildClosedPair = ""
silent only
cd ~/
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +18 Documents/wiki/index.md
badd +25 Documents/wiki/笔记/index.md
badd +6 Documents/wiki/笔记/python/index.md
badd +4 Documents/wiki/笔记/科学计算/index.md
badd +1 Documents/wiki/笔记/科学计算/科学计算-numpy.md
badd +150 .dotfiles/nvim/config/plugins/coc.nvim.vim
badd +65 .dotfiles/nvim/coc-settings.json
badd +8 .dotfiles/nvim/config/config.vim
argglobal
%argdel
edit Documents/wiki/笔记/index.md
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
let s:l = 18 - ((17 * winheight(0) + 27) / 54)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
18
normal! 026|
tabedit .dotfiles/nvim/coc-settings.json
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd _ | wincmd |
split
1wincmd k
wincmd w
wincmd w
set nosplitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe '1resize ' . ((&lines * 26 + 28) / 56)
exe 'vert 1resize ' . ((&columns * 119 + 119) / 239)
exe '2resize ' . ((&lines * 27 + 28) / 56)
exe 'vert 2resize ' . ((&columns * 119 + 119) / 239)
exe 'vert 3resize ' . ((&columns * 119 + 119) / 239)
argglobal
setlocal fdm=expr
setlocal fde=b:anyfold_ind_buffer[v:lnum-1]
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
1
normal! zo
let s:l = 84 - ((24 * winheight(0) + 13) / 26)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
84
normal! 0
wincmd w
argglobal
if bufexists(".dotfiles/nvim/config/config.vim") | buffer .dotfiles/nvim/config/config.vim | else | edit .dotfiles/nvim/config/config.vim | endif
if &buftype ==# 'terminal'
  silent file .dotfiles/nvim/config/config.vim
endif
setlocal fdm=expr
setlocal fde=b:anyfold_ind_buffer[v:lnum-1]
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 8 - ((7 * winheight(0) + 13) / 27)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
8
normal! 057|
wincmd w
argglobal
if bufexists(".dotfiles/nvim/config/plugins/coc.nvim.vim") | buffer .dotfiles/nvim/config/plugins/coc.nvim.vim | else | edit .dotfiles/nvim/config/plugins/coc.nvim.vim | endif
if &buftype ==# 'terminal'
  silent file .dotfiles/nvim/config/plugins/coc.nvim.vim
endif
setlocal fdm=expr
setlocal fde=b:anyfold_ind_buffer[v:lnum-1]
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 232 - ((50 * winheight(0) + 27) / 54)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
232
normal! 08|
wincmd w
exe '1resize ' . ((&lines * 26 + 28) / 56)
exe 'vert 1resize ' . ((&columns * 119 + 119) / 239)
exe '2resize ' . ((&lines * 27 + 28) / 56)
exe 'vert 2resize ' . ((&columns * 119 + 119) / 239)
exe 'vert 3resize ' . ((&columns * 119 + 119) / 239)
tabnext 2
if exists('s:wipebuf') && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 winminheight=1 winminwidth=1 shortmess=filnxtToOFc
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
