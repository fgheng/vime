" File:       kuroi.vim
" Maintainer: aonemd
" URL:        https://github.com/aonemd/kuroi.vim
" Modified:   04 April 2019 02:38 PM EET
" License:    MIT

" Initialisation:"{{{
" ----------------------------------------------------------------------------

hi clear

if exists("syntax_on")
  syntax reset
endif

let s:style = &background

let g:colors_name = "kuroi"

"}}}
" GUI And Cterm Palettes:"{{{
" ----------------------------------------------------------------------------

let s:palette = {'gui' : {} , 'cterm' : {}}

let s:gui_background = "#1b1918"
let s:gui_selection  = "#373b41"
let s:gui_line       = "#282a2e"
let s:gui_comment    = "#707880"

let s:palette.gui.background   = { 'dark' : s:gui_background , 'light' : "#e4e4e4" }
let s:palette.gui.foreground   = { 'dark' : "#c5c8c6"        , 'light' : "#000000" }
let s:palette.gui.selection    = { 'dark' : s:gui_selection  , 'light' : "#bcbcbc" }
let s:palette.gui.line         = { 'dark' : s:gui_line       , 'light' : "#d0d0d0" }
let s:palette.gui.comment      = { 'dark' : s:gui_comment    , 'light' : "#5f5f5f" }
let s:palette.gui.red          = { 'dark' : "#d75f87"        , 'light' : "#5f0000" }
let s:palette.gui.orange       = { 'dark' : "#d78700"        , 'light' : "#875f00" }
let s:palette.gui.yellow       = { 'dark' : "#ffd700"        , 'light' : "#5f5f00" }
let s:palette.gui.green        = { 'dark' : "#5faf5f"        , 'light' : "#005f00" }
let s:palette.gui.aqua         = { 'dark' : "#87afd7"        , 'light' : "#005f5f" }
let s:palette.gui.blue         = { 'dark' : "#5fafff"        , 'light' : "#00005f" }
let s:palette.gui.purple       = { 'dark' : "#8787ff"        , 'light' : "#5f005f" }
let s:palette.gui.window       = { 'dark' : "#303030"        , 'light' : "#9e9e9e" }
let s:palette.gui.darkcolumn   = { 'dark' : "#1c1c1c"        , 'light' : "#808080" }
let s:palette.gui.addbg        = { 'dark' : "#5F875F"        , 'light' : "#d7ffd7" }
let s:palette.gui.addfg        = { 'dark' : "#d7ffaf"        , 'light' : "#005f00" }
let s:palette.gui.changebg     = { 'dark' : "#5f5faf"        , 'light' : "#d7d7ff" }
let s:palette.gui.changefg     = { 'dark' : "#d7d7ff"        , 'light' : "#5f005f" }
let s:palette.gui.delbg        = { 'dark' : "#cc6666"        , 'light' : "#ffd7d7" }
let s:palette.gui.darkblue     = { 'dark' : "#00005f"        , 'light' : "#d7ffd7" }
let s:palette.gui.darkcyan     = { 'dark' : "#005f5f"        , 'light' : "#005f00" }
let s:palette.gui.darkred      = { 'dark' : "#5f0000"        , 'light' : "#d7d7ff" }
let s:palette.gui.darkpurple   = { 'dark' : "#5f005f"        , 'light' : "#5f005f" }
let s:palette.gui.gray         = { 'dark' : "#262626"        , 'light' : "#d0d0d0" }
let s:palette.gui.statusline   = { 'dark' : "#6c6c6c"        , 'light' : "#585858" }
let s:palette.gui.statuslinenc = { 'dark' : "#4e4e4e"        , 'light' : "#3a3a3a"  }
let s:palette.gui.gitgutteradd = { 'dark' : "#5faf5f"        , 'light' : "#5faf5f"  }
let s:palette.gui.gitgutterchg = { 'dark' : "#d78700"        , 'light' : "#d78700"  }
let s:palette.gui.gitgutterdlt = { 'dark' : "#d75f87"        , 'light' : "#d75f87"  }

let s:cterm_foreground = "250"
let s:cterm_selection  = "237"
let s:cterm_line       = "235"
let s:cterm_comment    = "243"

let s:palette.cterm.background   = { 'dark' : "0"                , 'light' : "254" }
let s:palette.cterm.foreground   = { 'dark' : s:cterm_foreground , 'light' : "16"  }
let s:palette.cterm.window       = { 'dark' : "236"              , 'light' : "247" }
let s:palette.cterm.selection    = { 'dark' : s:cterm_selection  , 'light' : "250" }
let s:palette.cterm.line         = { 'dark' : s:cterm_line       , 'light' : "252" }
let s:palette.cterm.comment      = { 'dark' : s:cterm_comment    , 'light' : "59"  }
let s:palette.cterm.red          = { 'dark' : "168"              , 'light' : "52"  }
let s:palette.cterm.orange       = { 'dark' : "172"              , 'light' : "94"  }
let s:palette.cterm.yellow       = { 'dark' : "220"              , 'light' : "58"  }
let s:palette.cterm.green        = { 'dark' : "71"               , 'light' : "22"  }
let s:palette.cterm.aqua         = { 'dark' : "110"              , 'light' : "23"  }
let s:palette.cterm.blue         = { 'dark' : "75"               , 'light' : "17"  }
let s:palette.cterm.purple       = { 'dark' : "105"              , 'light' : "53"  }
let s:palette.cterm.darkcolumn   = { 'dark' : "234"              , 'light' : "244" }
let s:palette.cterm.addbg        = { 'dark' : "65"               , 'light' : "194" }
let s:palette.cterm.addfg        = { 'dark' : "193"              , 'light' : "22"  }
let s:palette.cterm.changebg     = { 'dark' : "61"               , 'light' : "189" }
let s:palette.cterm.changefg     = { 'dark' : "189"              , 'light' : "53"  }
let s:palette.cterm.delbg        = { 'dark' : "167"              , 'light' : "224" }
let s:palette.cterm.darkblue     = { 'dark' : "17"               , 'light' : "194" }
let s:palette.cterm.darkcyan     = { 'dark' : "24"               , 'light' : "22"  }
let s:palette.cterm.darkred      = { 'dark' : "52"               , 'light' : "189" }
let s:palette.cterm.darkpurple   = { 'dark' : "53"               , 'light' : "53"  }
let s:palette.cterm.gray         = { 'dark' : "235"              , 'light' : "252"  }
let s:palette.cterm.statusline   = { 'dark' : "242"              , 'light' : "240"  }
let s:palette.cterm.statuslinenc = { 'dark' : "239"              , 'light' : "237"  }
let s:palette.cterm.gitgutteradd = { 'dark' : "71"               , 'light' : "71"  }
let s:palette.cterm.gitgutterchg = { 'dark' : "172"              , 'light' : "172"  }
let s:palette.cterm.gitgutterdlt = { 'dark' : "168"              , 'light' : "168"  }

"}}}
" Formatting Options:"{{{
" ----------------------------------------------------------------------------
let s:none   = "NONE"
let s:t_none = "NONE"
let s:n      = "NONE"
let s:c      = ",undercurl"
let s:r      = ",reverse"
let s:s      = ",standout"
let s:b      = ",bold"
let s:u      = ",underline"
let s:i      = ",italic"

"}}}
" Highlighting Primitives:"{{{
" ----------------------------------------------------------------------------
function! s:build_prim(hi_elem, field)
  " Given a:hi_elem = bg, a:field = comment
  let l:vname = "s:" . a:hi_elem . "_" . a:field " s:bg_comment
  let l:gui_assign = "gui".a:hi_elem."=".s:palette.gui[a:field][s:style] " guibg=...
  let l:cterm_assign = "cterm".a:hi_elem."=".s:palette.cterm[a:field][s:style] " ctermbg=...
  exe "let " . l:vname . " = ' " . l:gui_assign . " " . l:cterm_assign . "'"
endfunction

let s:bg_none = ' guibg=NONE ctermbg=NONE'
call s:build_prim('bg', 'foreground')
call s:build_prim('bg', 'background')
call s:build_prim('bg', 'selection')
call s:build_prim('bg', 'line')
call s:build_prim('bg', 'comment')
call s:build_prim('bg', 'red')
call s:build_prim('bg', 'orange')
call s:build_prim('bg', 'yellow')
call s:build_prim('bg', 'green')
call s:build_prim('bg', 'aqua')
call s:build_prim('bg', 'blue')
call s:build_prim('bg', 'purple')
call s:build_prim('bg', 'window')
call s:build_prim('bg', 'darkcolumn')
call s:build_prim('bg', 'addbg')
call s:build_prim('bg', 'addfg')
call s:build_prim('bg', 'changebg')
call s:build_prim('bg', 'changefg')
call s:build_prim('bg', 'delbg')
call s:build_prim('bg', 'darkblue')
call s:build_prim('bg', 'darkcyan')
call s:build_prim('bg', 'darkred')
call s:build_prim('bg', 'darkpurple')
call s:build_prim('bg', 'statusline')
call s:build_prim('bg', 'statuslinenc')

let s:fg_none = ' guifg=NONE ctermfg=NONE'
call s:build_prim('fg', 'foreground')
call s:build_prim('fg', 'background')
call s:build_prim('fg', 'selection')
call s:build_prim('fg', 'line')
call s:build_prim('fg', 'comment')
call s:build_prim('fg', 'red')
call s:build_prim('fg', 'orange')
call s:build_prim('fg', 'yellow')
call s:build_prim('fg', 'green')
call s:build_prim('fg', 'aqua')
call s:build_prim('fg', 'blue')
call s:build_prim('fg', 'purple')
call s:build_prim('fg', 'window')
call s:build_prim('fg', 'darkcolumn')
call s:build_prim('fg', 'addbg')
call s:build_prim('fg', 'addfg')
call s:build_prim('fg', 'changebg')
call s:build_prim('fg', 'changefg')
call s:build_prim('fg', 'darkblue')
call s:build_prim('fg', 'darkcyan')
call s:build_prim('fg', 'darkred')
call s:build_prim('fg', 'darkpurple')
call s:build_prim('fg', 'gray')
call s:build_prim('fg', 'gitgutteradd')
call s:build_prim('fg', 'gitgutterchg')
call s:build_prim('fg', 'gitgutterdlt')

exe "let s:fmt_none = ' gui=NONE".          " cterm=NONE".          " term=NONE"        ."'"
exe "let s:fmt_bold = ' gui=NONE".s:b.      " cterm=NONE".s:b.      " term=NONE".s:b    ."'"
exe "let s:fmt_bldi = ' gui=NONE".s:b.      " cterm=NONE".s:b.      " term=NONE".s:b    ."'"
exe "let s:fmt_undr = ' gui=NONE".s:u.      " cterm=NONE".s:u.      " term=NONE".s:u    ."'"
exe "let s:fmt_undb = ' gui=NONE".s:u.s:b.  " cterm=NONE".s:u.s:b.  " term=NONE".s:u.s:b."'"
exe "let s:fmt_undi = ' gui=NONE".s:u.      " cterm=NONE".s:u.      " term=NONE".s:u    ."'"
exe "let s:fmt_curl = ' gui=NONE".s:c.      " cterm=NONE".s:c.      " term=NONE".s:c    ."'"
exe "let s:fmt_ital = ' gui=NONE".s:i.      " cterm=NONE".s:i.      " term=NONE".s:i    ."'"
exe "let s:fmt_stnd = ' gui=NONE".s:s.      " cterm=NONE".s:s.      " term=NONE".s:s    ."'"
exe "let s:fmt_revr = ' gui=NONE".s:r.      " cterm=NONE".s:r.      " term=NONE".s:r    ."'"
exe "let s:fmt_revb = ' gui=NONE".s:r.s:b.  " cterm=NONE".s:r.s:b.  " term=NONE".s:r.s:b."'"

exe "let s:sp_none       = ' guisp=". s:none                            ."'"
exe "let s:sp_foreground = ' guisp=". s:palette.gui.foreground[s:style] ."'"
exe "let s:sp_background = ' guisp=". s:palette.gui.background[s:style] ."'"
exe "let s:sp_selection  = ' guisp=". s:palette.gui.selection[s:style]  ."'"
exe "let s:sp_line       = ' guisp=". s:palette.gui.line[s:style]       ."'"
exe "let s:sp_comment    = ' guisp=". s:palette.gui.comment[s:style]    ."'"
exe "let s:sp_red        = ' guisp=". s:palette.gui.red[s:style]        ."'"
exe "let s:sp_orange     = ' guisp=". s:palette.gui.orange[s:style]     ."'"
exe "let s:sp_yellow     = ' guisp=". s:palette.gui.yellow[s:style]     ."'"
exe "let s:sp_green      = ' guisp=". s:palette.gui.green[s:style]      ."'"
exe "let s:sp_aqua       = ' guisp=". s:palette.gui.aqua[s:style]       ."'"
exe "let s:sp_blue       = ' guisp=". s:palette.gui.blue[s:style]       ."'"
exe "let s:sp_purple     = ' guisp=". s:palette.gui.purple[s:style]     ."'"
exe "let s:sp_window     = ' guisp=". s:palette.gui.window[s:style]     ."'"
exe "let s:sp_addbg      = ' guisp=". s:palette.gui.addbg[s:style]      ."'"
exe "let s:sp_addfg      = ' guisp=". s:palette.gui.addfg[s:style]      ."'"
exe "let s:sp_changebg   = ' guisp=". s:palette.gui.changebg[s:style]   ."'"
exe "let s:sp_changefg   = ' guisp=". s:palette.gui.changefg[s:style]   ."'"
exe "let s:sp_darkblue   = ' guisp=". s:palette.gui.darkblue[s:style]   ."'"
exe "let s:sp_darkcyan   = ' guisp=". s:palette.gui.darkcyan[s:style]   ."'"
exe "let s:sp_darkred    = ' guisp=". s:palette.gui.darkred[s:style]    ."'"
exe "let s:sp_darkpurple = ' guisp=". s:palette.gui.darkpurple[s:style] ."'"

"}}}
" Vim Highlighting: (see :help highlight-groups)"{{{
" ----------------------------------------------------------------------------
exe "hi! ColorColumn"   .s:fg_none        .s:bg_line        .s:fmt_none
"   Conceal"
"   Cursor"
"   CursorIM"
exe "hi! CursorColumn"  .s:fg_none        .s:bg_line        .s:fmt_none
exe "hi! CursorLine"    .s:fg_none        .s:bg_line        .s:fmt_none
exe "hi! Directory"     .s:fg_blue        .s:bg_none        .s:fmt_none
exe "hi! DiffAdd"       .s:fg_addfg       .s:bg_addbg       .s:fmt_none
exe "hi! DiffChange"    .s:fg_changefg    .s:bg_changebg    .s:fmt_none
exe "hi! DiffDelete"    .s:fg_background  .s:bg_delbg       .s:fmt_none
exe "hi! DiffText"      .s:fg_background  .s:bg_blue        .s:fmt_none
exe "hi! ErrorMsg"      .s:fg_background  .s:bg_red         .s:fmt_stnd
exe "hi! VertSplit"     .s:fg_window      .s:bg_none        .s:fmt_none
exe "hi! Folded"        .s:fg_comment     .s:bg_darkcolumn  .s:fmt_none
exe "hi! FoldColumn"    .s:fg_none        .s:bg_darkcolumn  .s:fmt_none
exe "hi! SignColumn"    .s:fg_none        .s:bg_darkcolumn  .s:fmt_none
"   Incsearch"
exe "hi! LineNr"        .s:fg_selection   .s:bg_none        .s:fmt_none
exe "hi! CursorLineNr"  .s:fg_yellow      .s:bg_none        .s:fmt_none
exe "hi! MatchParen"    .s:fg_background  .s:bg_changebg    .s:fmt_none
exe "hi! ModeMsg"       .s:fg_green       .s:bg_none        .s:fmt_none
exe "hi! MoreMsg"       .s:fg_green       .s:bg_none        .s:fmt_none
exe "hi! NonText"       .s:fg_selection   .s:bg_none        .s:fmt_none
exe "hi! Pmenu"         .s:fg_foreground  .s:bg_selection   .s:fmt_none
exe "hi! PmenuSel"      .s:fg_foreground  .s:bg_selection   .s:fmt_revr
"   PmenuSbar"
"   PmenuThumb"
exe "hi! Question"      .s:fg_green       .s:bg_none          .s:fmt_none
exe "hi! Search"        .s:fg_background  .s:bg_yellow        .s:fmt_none
exe "hi! SpecialKey"    .s:fg_selection   .s:bg_none          .s:fmt_none
exe "hi! SpellCap"      .s:fg_blue        .s:bg_darkblue      .s:fmt_undr
exe "hi! SpellLocal"    .s:fg_aqua        .s:bg_darkcyan      .s:fmt_undr
exe "hi! SpellBad"      .s:fg_red         .s:bg_darkred       .s:fmt_undr
exe "hi! SpellRare"     .s:fg_purple      .s:bg_darkpurple    .s:fmt_undr
exe "hi! StatusLine"    .s:fg_gray        .s:bg_statusline    .s:fmt_revr
exe "hi! StatusLineNC"  .s:fg_gray        .s:bg_statuslinenc  .s:fmt_revr
exe "hi! TabLine"       .s:fg_foreground  .s:bg_darkcolumn    .s:fmt_revr
exe "hi! EndOfBuffer"   .s:fg_background  .s:bg_background    .s:fmt_revr
"   TabLineFill"
"   TabLineSel"
exe "hi! Title"         .s:fg_yellow      .s:bg_none        .s:fmt_none
exe "hi! Visual"        .s:fg_none        .s:bg_selection   .s:fmt_none
"   VisualNos"
exe "hi! WarningMsg"    .s:fg_red         .s:bg_none        .s:fmt_none
" FIXME LongLineWarning to use variables instead of hardcoding
hi LongLineWarning  guifg=NONE        guibg=#371F1C     gui=underline ctermfg=NONE        ctermbg=NONE        cterm=underline
"   WildMenu"

exe "hi! Normal"        .s:fg_foreground  .s:bg_background    .s:fmt_none

"}}}
" Generic Syntax Highlighting: (see :help group-name)"{{{
" ----------------------------------------------------------------------------
exe "hi! Comment"         .s:fg_comment     .s:bg_none        .s:fmt_none

exe "hi! Constant"        .s:fg_red         .s:bg_none        .s:fmt_none
exe "hi! String"          .s:fg_green       .s:bg_none        .s:fmt_none
"   Character"
"   Number"
"   Boolean"
"   Float"

exe "hi! Identifier"      .s:fg_purple      .s:bg_none        .s:fmt_none
exe "hi! Function"        .s:fg_yellow      .s:bg_none        .s:fmt_none

exe "hi! Statement"       .s:fg_blue        .s:bg_none        .s:fmt_none
"   Conditional"
"   Repeat"
"   Label"
exe "hi! Operator"        .s:fg_aqua        .s:bg_none        .s:fmt_none
"   Keyword"
"   Exception"

exe "hi! PreProc"         .s:fg_aqua        .s:bg_none        .s:fmt_none
"   Include"
"   Define"
"   Macro"
"   PreCondit"

exe "hi! Type"            .s:fg_orange      .s:bg_none        .s:fmt_none
"   StorageClass"
exe "hi! Structure"       .s:fg_aqua        .s:bg_none        .s:fmt_none
"   Typedef"

exe "hi! Special"         .s:fg_green       .s:bg_none        .s:fmt_none
"   SpecialChar"
"   Tag"
"   Delimiter"
"   SpecialComment"
"   Debug"
"
exe "hi! Underlined"      .s:fg_blue        .s:bg_none        .s:fmt_none

exe "hi! Ignore"          .s:fg_none        .s:bg_none        .s:fmt_none

exe "hi! Error"           .s:fg_red         .s:bg_darkred     .s:fmt_undr

exe "hi! Todo"            .s:fg_foreground  .s:bg_none        .s:fmt_bold

" Quickfix window highlighting
exe "hi! qfLineNr"        .s:fg_yellow      .s:bg_none        .s:fmt_none
"   qfFileName"
"   qfLineNr"
"   qfError"

"}}}
" Diff Syntax Highlighting:"{{{
" ----------------------------------------------------------------------------
" Diff
"   diffOldFile
"   diffNewFile
"   diffFile
"   diffOnly
"   diffIdentical
"   diffDiffer
"   diffBDiffer
"   diffIsA
"   diffNoEOL
"   diffCommon
hi! link diffRemoved Constant
"   diffChanged
hi! link diffAdded Special
"   diffLine
"   diffSubname
"   diffComment

"}}}
" GitGutter Sign Highlighting:"{{{
" ----------------------------------------------------------------------------
exe "hi! GitGutterAdd"     .s:fg_gitgutteradd  .s:bg_none  .s:fmt_none
exe "hi! GitGutterChange"  .s:fg_gitgutterchg  .s:bg_none  .s:fmt_none
exe "hi! GitGutterDelete"  .s:fg_gitgutterdlt  .s:bg_none  .s:fmt_none

"}}}
"
" This is needed for some reason: {{{

let &background = s:style

" }}}
" Legal:"{{{
" ----------------------------------------------------------------------------
" Copyright (c) 2011 Ethan Schoonover
" Copyright (c) 2009-2012 NanoTech
" Copyright (c) 2012 w0ng
" Copyright (c) 2019 aonemd
"
" Permission is hereby granted, free of charge, to any per‐
" son obtaining a copy of this software and associated doc‐
" umentation files (the “Software”), to deal in the Soft‐
" ware without restriction, including without limitation
" the rights to use, copy, modify, merge, publish, distrib‐
" ute, sublicense, and/or sell copies of the Software, and
" to permit persons to whom the Software is furnished to do
" so, subject to the following conditions:
"
" The above copyright notice and this permission notice
" shall be included in all copies or substantial portions
" of the Software.
"
" THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY
" KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO
" THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICU‐
" LAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
" AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
" DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CON‐
" TRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CON‐
" NECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
" THE SOFTWARE.

" }}}
