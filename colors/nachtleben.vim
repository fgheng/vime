
"    _  __         __   __  __    __
"   / |/ /__ _____/ /  / /_/ /__ / /  ___ ___     /  nachtleben.vim - Vim color file
"  /    / _ `/ __/ _ \/ __/ / -_) _ \/ -_) _ \   /  Author: <schickele|you~know~what|web.de>
" /_/|_/\_,_/\__/_//_/\__/_/\__/_.__/\__/_//_/  /  Created: 2018-11 | Last change: 2019-02-20

" Init {{{
hi clear

set background=dark

if exists('syntax on')
    syntax reset
endif

let g:colors_name='nachtleben' " }}}

let s:mred = '#ec224e' " red
let s:dora = '#ec6c39' " dark orange
let s:lora = '#f39e35' " light orange
let s:yell = '#fed522' " yellow
let s:gree = '#0cc531' " green
let s:lblu = '#06bed9' " light blue
let s:dblu = '#327ec9' " dark blue
let s:mage = '#c026c3' " magenta

let s:blac = '#040409' " bluish black
let s:dgra = '#1e1c40' " dark gray

" Highlight function {{{
function! s:hi(group, fg, bg, style, special)
  let l:command = 'hi ' . a:group

  if (!empty(a:fg))
    let l:command .= ' guifg=' . a:fg
  endif

  if (!empty(a:bg))
    let l:command .= ' guibg=' . a:bg
  endif

  if (!empty(a:style))
    let l:command .= ' gui=' . a:style
  endif

  if (!empty(a:special))
    let l:command .= ' guisp=' . a:special
  endif

  execute l:command
endfunction " }}}

call s:hi('Normal',           s:lora, s:blac, '', '')
call s:hi('SpecialKey',       s:dblu, s:blac, '', '')
call s:hi('NonText',          s:dblu, '',     'NONE', '')
call s:hi('Directory',        s:dblu, s:blac, '', '')
call s:hi('ErrorMsg',         s:blac, s:mred, '', '')
call s:hi('IncSearch',        'NONE', 'NONE', 'INVERSE', '')
call s:hi('Search',           s:blac, s:dblu, '', '')
call s:hi('MoreMsg',          s:blac, s:yell, 'NONE', '')
call s:hi('ModeMsg',          s:blac, s:yell, 'NONE', '')
call s:hi('LineNr',           s:dblu, s:blac, '', '')
call s:hi('CursorLineNr',     s:lora, s:dgra, 'NONE', '')
call s:hi('Question',         s:blac, s:yell, 'NONE', '')
call s:hi('StatusLine',       s:blac, s:dblu, 'NONE', '')
call s:hi('StatusLineNC',     s:dblu, s:blac, 'NONE', '')
call s:hi('VertSplit',        s:blac, s:dblu, '', '')
call s:hi('Title',            s:lblu, s:blac, 'NONE', '')
call s:hi('Visual',           s:blac, s:lblu, '', '')
call s:hi('VisualNOS',        s:blac, s:lblu, 'NONE', '')
call s:hi('WarningMsg',       s:blac, s:yell, '', '')
call s:hi('WildMenu',         s:dblu, s:blac, '', '')
call s:hi('Folded',           s:blac, s:dblu, '', '')
call s:hi('FoldColumn',       s:blac, s:dblu, '', '')
call s:hi('DiffAdd',          s:blac, s:gree, '', '')
call s:hi('DiffChange',       s:blac, s:dblu, '', '')
call s:hi('DiffDelete',       s:blac, s:mred, 'NONE', '')
call s:hi('DiffText',         s:blac, s:mred, 'NONE', '')
call s:hi('SignColumn',       s:yell, s:blac, '', '')
call s:hi('Conceal',          s:yell, s:blac, '', '')
call s:hi('SpellBad',         'NONE', 'NONE', 'UNDERCURL', s:mred)
call s:hi('SpellCap',         'NONE', 'NONE', 'UNDERCURL', s:dblu)
call s:hi('SpellRare',        'NONE', 'NONE', 'UNDERCURL', s:mage)
call s:hi('SpellLocal',       'NONE', 'NONE', 'UNDERCURL', s:gree)
call s:hi('Pmenu',            s:blac, s:lora, '', '')
call s:hi('PmenuSel',         s:blac, s:mred, '', '')
call s:hi('PmenuSbar',        s:blac, s:lora, '', '')
call s:hi('PmenuThumb',       s:blac, s:mred, '', '')
call s:hi('TabLine',          s:dblu, s:blac, '', '')
call s:hi('TabLineSel',       s:lblu, s:dgra, 'NONE', '')
call s:hi('TabLineFill',      s:blac, s:blac, '', '')
call s:hi('CursorColumn',     'NONE', s:dgra, '', '')
call s:hi('CursorLine',       'NONE', s:dgra, '', '')
call s:hi('ColorColumn',      'NONE', s:dgra, '', '')
call s:hi('StatusLineTerm',   s:blac, s:dblu, 'NONE', '')
call s:hi('StatusLineTermNC', s:dblu, s:blac, '', '')
call s:hi('Cursor',           s:blac, s:lora, '', '')
call s:hi('lCursor',          s:blac, s:lora, '', '')
call s:hi('MatchParen',       s:blac, s:dblu, '', '')
call s:hi('ToolbarLine',      s:lora, s:blac, '', '')
call s:hi('ToolbarButton',    s:lora, s:blac, 'NONE', '')
call s:hi('Comment',          s:gree, s:blac, '', '')
call s:hi('Constant',         s:lblu, s:blac, '', '')
call s:hi('Special',          s:dblu, s:blac, '', '')
call s:hi('Identifier',       s:mred, s:blac, '', '')
call s:hi('Statement',        s:dora, s:blac, 'NONE', '')
call s:hi('PreProc',          s:mage, s:blac, '', '')
call s:hi('Type',             s:lora, s:blac, 'NONE', '')
call s:hi('Underlined',       'NONE', 'NONE', 'UNDERLINE', '')
call s:hi('Ignore',           s:dgra, 'NONE', '', '')
call s:hi('Error',            s:blac, s:mred, '', '')
call s:hi('Todo',             s:blac, s:lora, '', '')

hi CursorLine     cterm=NONE
hi DiffText       cterm=NONE
hi Identifier     cterm=NONE
hi ModeMsg        cterm=NONE
hi StatusLine     cterm=NONE
hi StatusLineTerm cterm=NONE
hi TabLine        cterm=NONE
hi TabLineSel     cterm=NONE
hi ToolbarButton  cterm=NONE
hi VisualNOS      cterm=NONE
hi Underlined     ctermfg=NONE ctermfg=NONE

hi! link lilySlur         Comment
hi! link vimCommentString Comment
hi! link vimCommentTitle  Comment
hi! link TrailingSpac     DiffDelete
