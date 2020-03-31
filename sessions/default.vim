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
let NERDRemoveAltComs = "1"
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
cd ~/.dotfiles/nvim
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +20 config/plugins/coc.nvim.vim
badd +169 coc-settings.json
badd +0 config/plugins/fzf.vim.vim
argglobal
%argdel
edit config/plugins/fzf.vim.vim
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
1
normal! zo
let s:l = 65 - ((52 * winheight(0) + 27) / 54)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
65
normal! 05|
tabnext 1
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
