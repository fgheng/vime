
" Vim color scheme using Open Color
" (https://yeun.github.io/open-color/)
" Maintainer: Chayoung You <yousbe@gmail.com>
" URL: https://github.com/yous/vim-open-color
" Version: 2.4.1
" License: The MIT License (MIT)

let s:save_cpo = &cpoptions
set cpoptions&vim

let s:background = &background

function! s:Hi(item, fg, bg, ...)
  if empty(a:fg) && empty(a:bg) && a:0 == 0
    return
  endif
  let l:hi = printf('highlight %s', a:item)
  if !empty(a:fg)
    if type(a:fg) == type('')
      let l:fg_gui = a:fg
      let l:fg_256 = a:fg
    else
      let l:fg_gui = a:fg[0]
      let l:fg_256 = a:fg[1]
    endif
    let l:hi = printf('%s ctermfg=%s guifg=%s', l:hi, l:fg_256, l:fg_gui)
  endif
  if !empty(a:bg)
    if type(a:bg) == type('')
      let l:bg_gui = a:bg
      let l:bg_256 = a:bg
    else
      let l:bg_gui = a:bg[0]
      let l:bg_256 = a:bg[1]
    endif
    let l:hi = printf('%s ctermbg=%s guibg=%s', l:hi, l:bg_256, l:bg_gui)
  endif
  if a:0 > 0
    let l:hi .= ' ' . a:1
  endif
  execute l:hi
endfunction

if !exists('s:oc')
  let s:oc = {}
  let s:oc['gray'] = [
        \ ['#f8f9fa', 15], ['#f1f3f5', 255], ['#e9ecef', 255],
        \ ['#dee2e6', 254], ['#ced4da', 252], ['#adb5bd', 249],
        \ ['#868e96', 245], ['#495057', 239], ['#343a40', 237],
        \ ['#212529', 235]]
  let s:oc['red'] = [
        \ ['#fff5f5', 15], ['#ffe3e3', 224], ['#ffc9c9', 224],
        \ ['#ffa8a8', 217], ['#ff8787', 210], ['#ff6b6b', 203],
        \ ['#fa5252', 203], ['#f03e3e', 167], ['#e03131', 160],
        \ ['#c92a2a', 160]]
  let s:oc['pink'] = [
        \ ['#fff0f6', 255], ['#ffdeeb', 224], ['#fcc2d7', 218],
        \ ['#faa2c1', 218], ['#f783ac', 211], ['#f06595', 204],
        \ ['#e64980', 168], ['#d6336c', 161], ['#c2255c', 161],
        \ ['#a61e4d', 125]]
  let s:oc['grape'] = [
        \ ['#f8f0fc', 255], ['#f3d9fa', 225], ['#eebefa', 219],
        \ ['#e599f7', 213], ['#da77f2', 177], ['#cc5de8', 171],
        \ ['#be4bdb', 134], ['#ae3ec9', 128], ['#9c36b5', 127],
        \ ['#862e9c', 91]]
  let s:oc['violet'] = [
        \ ['#f3f0ff', 255], ['#e5dbff', 189], ['#d0bfff', 183],
        \ ['#b197fc', 141], ['#9775fa', 141], ['#845ef7', 99],
        \ ['#7950f2', 99], ['#7048e8', 62], ['#6741d9', 57],
        \ ['#5f3dc4', 56]]
  let s:oc['indigo'] = [
        \ ['#edf2ff', 255], ['#dbe4ff', 189], ['#bac8ff', 147],
        \ ['#91a7ff', 111], ['#748ffc', 69], ['#5c7cfa', 69],
        \ ['#4c6ef5', 27], ['#4263eb', 27], ['#3b5bdb', 27],
        \ ['#364fc7', 26]]
  let s:oc['blue'] = [
        \ ['#e7f5ff', 255], ['#d0ebff', 153], ['#a5d8ff', 153],
        \ ['#74c0fc', 75], ['#4dabf7', 75], ['#339af0', 75],
        \ ['#228be6', 32], ['#1c7ed6', 32], ['#1971c2', 25],
        \ ['#1864ab', 25]]
  let s:oc['cyan'] = [
        \ ['#e3fafc', 195], ['#c5f6fa', 195], ['#99e9f2', 116],
        \ ['#66d9e8', 80], ['#3bc9db', 45], ['#22b8cf', 38],
        \ ['#15aabf', 38], ['#1098ad', 31], ['#0c8599', 31],
        \ ['#0b7285', 6]]
  let s:oc['teal'] = [
        \ ['#e6fcf5', 195], ['#c3fae8', 158], ['#96f2d7', 122],
        \ ['#63e6be', 79], ['#38d9a9', 43], ['#20c997', 43],
        \ ['#12b886', 36], ['#0ca678', 36], ['#099268', 29],
        \ ['#087f5b', 29]]
  let s:oc['green'] = [
        \ ['#ebfbee', 195], ['#d3f9d8', 194], ['#b2f2bb', 157],
        \ ['#8ce99a', 114], ['#69db7c', 78], ['#51cf66', 77],
        \ ['#40c057', 71], ['#37b24d', 71], ['#2f9e44', 35],
        \ ['#2b8a3e', 28]]
  let s:oc['lime'] = [
        \ ['#f4fce3', 230], ['#e9fac8', 230], ['#d8f5a2', 193],
        \ ['#c0eb75', 192], ['#a9e34b', 149], ['#94d82d', 112],
        \ ['#82c91e', 112], ['#74b816', 70], ['#66a80f', 70],
        \ ['#5c940d', 64]]
  let s:oc['yellow'] = [
        \ ['#fff9db', 230], ['#fff3bf', 230], ['#ffec99', 229],
        \ ['#ffe066', 221], ['#ffd43b', 220], ['#fcc419', 220],
        \ ['#fab005', 214], ['#f59f00', 214], ['#f08c00', 208],
        \ ['#e67700', 208]]
  let s:oc['orange'] = [
        \ ['#fff4e6', 255], ['#ffe8cc', 223], ['#ffd8a8', 223],
        \ ['#ffc078', 215], ['#ffa94d', 215], ['#ff922b', 208],
        \ ['#fd7e14', 208], ['#f76707', 202], ['#e8590c', 166],
        \ ['#d9480f', 166]]
endif

highlight clear
if exists('g:syntax_on')
  syntax reset
endif

if has('gui_running') || &t_Co == 88 || &t_Co == 256
  if s:background ==# 'dark'
    " :help group-name
    " :help highlight-groups
    call s:Hi('Normal', s:oc['gray'][2], s:oc['gray'][9])
    call s:Hi('LineNr', s:oc['gray'][6], '')
    call s:Hi('Visual', '', s:oc['gray'][8])
    call s:Hi('VisualNOS', '', s:oc['gray'][8])

    " Comment
    call s:Hi('Comment', s:oc['gray'][6], '')

    " Constant
    call s:Hi('Constant', s:oc['yellow'][4], '')
    call s:Hi('String', s:oc['lime'][4], '')
    call s:Hi('Character', s:oc['orange'][4], '')
    call s:Hi('Number', s:oc['orange'][4], '')
    call s:Hi('Boolean', s:oc['orange'][4], '')
    call s:Hi('Float', s:oc['orange'][4], '')

    " Identifier
    call s:Hi('Identifier', s:oc['yellow'][2], '', 'gui=bold')

    " Statement
    call s:Hi('Statement', s:oc['violet'][2], '')
    call s:Hi('Conditional', s:oc['indigo'][3], '')
    call s:Hi('Repeat', s:oc['indigo'][3], '')
    call s:Hi('Operator', s:oc['cyan'][2], '')

    " PreProc
    call s:Hi('PreProc', s:oc['violet'][2], '')

    " Type
    call s:Hi('Type', s:oc['cyan'][2], '')

    " Special
    call s:Hi('Special', s:oc['yellow'][2], '')

    " Underlined
    call s:Hi('Underlined', s:oc['cyan'][2], '')

    " Error
    call s:Hi('Error', s:oc['gray'][2], s:oc['red'][7])

    " Todo
    call s:Hi('Todo', s:oc['gray'][9], s:oc['lime'][4])

    " set textwidth=80 colorcolumn+=1
    call s:Hi('ColorColumn', '', s:oc['gray'][8])

    call s:Hi('Cursor', s:oc['gray'][9], s:oc['gray'][2])

    " set cursorline
    call s:Hi('CursorLine', '', s:oc['gray'][8], 'cterm=NONE')
    call s:Hi('CursorLineNr', s:oc['yellow'][2], s:oc['gray'][8], 'cterm=NONE')
    " set cursorcolumn
    call s:Hi('CursorColumn', '', s:oc['gray'][8])

    call s:Hi('Directory', s:oc['indigo'][3], '')

    call s:Hi('DiffAdd', 'NONE', s:oc['green'][9])
    call s:Hi('DiffDelete', s:oc['gray'][9], s:oc['red'][5])
    call s:Hi('DiffChange', 'NONE', s:oc['blue'][9])
    call s:Hi('DiffText', 'NONE', s:oc['violet'][9])
    call s:Hi('diffAdded', s:oc['lime'][4], '')
    call s:Hi('diffRemoved', s:oc['red'][5], '')

    call s:Hi('VertSplit', s:oc['gray'][8], s:oc['gray'][6])

    call s:Hi('Folded', s:oc['gray'][6], s:oc['gray'][9])
    " set foldcolumn=1
    call s:Hi('FoldColumn', s:oc['gray'][6], s:oc['gray'][9])
    call s:Hi('MatchParen', '', s:oc['gray'][6])

    " :help error-messages
    call s:Hi('ErrorMsg', s:oc['gray'][2], s:oc['red'][7])
    " -- INSERT --
    call s:Hi('ModeMsg', s:oc['gray'][2], '')
    " -- More --
    call s:Hi('MoreMsg', s:oc['lime'][4], '')
    " Press ENTER or type command to continue
    call s:Hi('Question', s:oc['lime'][4], '')
    " Search hit bottom
    call s:Hi('WarningMsg', s:oc['red'][5], '')

    " let &showbreak = '> '
    call s:Hi('NonText', s:oc['gray'][6], '')

    " Popup menu
    call s:Hi('Pmenu', s:oc['gray'][2], s:oc['gray'][8])
    call s:Hi('PmenuSel', s:oc['gray'][9], s:oc['gray'][2])
    call s:Hi('PmenuSbar', '', s:oc['gray'][6])
    call s:Hi('PmenuThumb', '', s:oc['gray'][2])

    call s:Hi('Search', s:oc['gray'][9], s:oc['yellow'][2])
    " call s:Hi('IncSearch', '', '')

    " :map, listchars
    call s:Hi('SpecialKey', s:oc['gray'][6], '')

    call s:Hi('StatusLine', s:oc['gray'][8], s:oc['lime'][4])
    call s:Hi('StatusLineNC', s:oc['gray'][8], s:oc['gray'][6])
    call s:Hi('TabLineFill', s:oc['gray'][7], '')
    call s:Hi('TabLineSel', s:oc['gray'][2], s:oc['gray'][6], 'cterm=NONE')
    call s:Hi('TabLine', s:oc['gray'][6], s:oc['gray'][8], 'cterm=NONE')
    call s:Hi('WildMenu', s:oc['gray'][9], s:oc['lime'][4])

    " :set all
    call s:Hi('Title', s:oc['indigo'][3], '')

    " :set conceallevel=1
    call s:Hi('Conceal', s:oc['gray'][2], s:oc['gray'][8])
    call s:Hi('Ignore', s:oc['gray'][6], s:oc['gray'][9])

    " syntax/ruby.vim
    " .each { |value| ... }
    call s:Hi('rubyBlockParameter', s:oc['yellow'][2], '')
    " ARGV, $stdout
    call s:Hi('rubyPredefinedIdentifier', s:oc['red'][5], '')

    " vim-gitgutter
    call s:Hi('GitGutterAdd', s:oc['lime'][4], '')
    call s:Hi('GitGutterChange', s:oc['yellow'][2], '')
    call s:Hi('GitGutterDelete', s:oc['red'][5], '')
    call s:Hi('GitGutterChangeDelete', s:oc['yellow'][2], '')
  else
    " :help group-name
    " :help highlight-groups
    call s:Hi('Normal', s:oc['gray'][8], s:oc['gray'][1])
    call s:Hi('LineNr', s:oc['gray'][6], '')
    call s:Hi('Visual', '', s:oc['gray'][4])
    call s:Hi('VisualNOS', '', s:oc['gray'][4])

    " Comment
    call s:Hi('Comment', s:oc['gray'][6], '')

    " Constant
    call s:Hi('Constant', s:oc['pink'][6], '')
    call s:Hi('String', s:oc['lime'][8], '')
    call s:Hi('Character', s:oc['orange'][8], '')
    call s:Hi('Number', s:oc['orange'][8], '')
    call s:Hi('Boolean', s:oc['orange'][8], '')
    call s:Hi('Float', s:oc['orange'][8], '')

    " Identifier
    call s:Hi('Identifier', s:oc['yellow'][7], '', 'cterm=bold gui=bold')

    " Statement
    call s:Hi('Statement', s:oc['violet'][6], '')
    call s:Hi('Conditional', s:oc['indigo'][5], '')
    call s:Hi('Repeat', s:oc['indigo'][5], '')
    call s:Hi('Operator', s:oc['cyan'][5], '')

    " PreProc
    call s:Hi('PreProc', s:oc['violet'][6], '')

    " Type
    call s:Hi('Type', s:oc['cyan'][5], '')

    " Special
    call s:Hi('Special', s:oc['yellow'][7], '')

    " Underlined
    call s:Hi('Underlined', s:oc['cyan'][5], '')

    " Error
    call s:Hi('Error', s:oc['gray'][8], s:oc['red'][5])

    " Todo
    call s:Hi('Todo', s:oc['gray'][9], s:oc['lime'][4])

    " set textwidth=80 colorcolumn+=1
    call s:Hi('ColorColumn', '', s:oc['gray'][0])

    call s:Hi('Cursor', s:oc['gray'][1], s:oc['gray'][5])

    " set cursorline
    call s:Hi('CursorLine', '', s:oc['gray'][0], 'cterm=NONE')
    call s:Hi('CursorLineNr', s:oc['yellow'][7], s:oc['gray'][0], 'cterm=NONE')
    " set cursorcolumn
    call s:Hi('CursorColumn', '', s:oc['gray'][0])

    call s:Hi('Directory', s:oc['indigo'][5], '')

    call s:Hi('DiffAdd', 'NONE', s:oc['lime'][3])
    call s:Hi('DiffDelete', s:oc['gray'][1], s:oc['red'][5])
    call s:Hi('DiffChange', 'NONE', s:oc['indigo'][1])
    call s:Hi('DiffText', 'NONE', s:oc['cyan'][1])
    call s:Hi('diffAdded', s:oc['lime'][8], '')
    call s:Hi('diffRemoved', s:oc['red'][5], '')

    call s:Hi('VertSplit', s:oc['gray'][3], s:oc['gray'][6])

    call s:Hi('Folded', s:oc['gray'][6], s:oc['gray'][1])
    " set foldcolumn=1
    call s:Hi('FoldColumn', s:oc['gray'][6], s:oc['gray'][1])
    call s:Hi('MatchParen', '', s:oc['gray'][3])

    " :help error-messages
    call s:Hi('ErrorMsg', s:oc['gray'][8], s:oc['red'][5])
    " -- INSERT --
    call s:Hi('ModeMsg', s:oc['gray'][8], '')
    " -- More --
    call s:Hi('MoreMsg', s:oc['lime'][8], '')
    " Press ENTER or type command to continue
    call s:Hi('Question', s:oc['lime'][8], '')
    " Search hit bottom
    call s:Hi('WarningMsg', s:oc['red'][7], '')

    " let &showbreak = '> '
    call s:Hi('NonText', s:oc['gray'][6], '')

    " Popup menu
    call s:Hi('Pmenu', s:oc['gray'][8], s:oc['gray'][3])
    call s:Hi('PmenuSel', s:oc['gray'][2], s:oc['gray'][6])
    call s:Hi('PmenuSbar', '', s:oc['gray'][4])
    call s:Hi('PmenuThumb', '', s:oc['gray'][8])

    call s:Hi('Search', s:oc['gray'][9], s:oc['yellow'][3])
    " call s:Hi('IncSearch', '', '')

    " :map, listchars
    call s:Hi('SpecialKey', s:oc['gray'][6], '')

    call s:Hi('StatusLine', s:oc['gray'][4], s:oc['lime'][8])
    call s:Hi('StatusLineNC', s:oc['gray'][4], s:oc['gray'][6])
    call s:Hi('TabLineFill', s:oc['gray'][4], '')
    call s:Hi('TabLineSel', s:oc['gray'][1], s:oc['gray'][6], 'cterm=NONE')
    call s:Hi('TabLine', s:oc['gray'][6], s:oc['gray'][2], 'cterm=NONE')
    call s:Hi('WildMenu', s:oc['gray'][1], s:oc['lime'][8])

    " :set all
    call s:Hi('Title', s:oc['indigo'][5], '')

    call s:Hi('Conceal', s:oc['gray'][8], s:oc['gray'][3])
    call s:Hi('Ignore', s:oc['gray'][6], s:oc['gray'][1])

    " syntax/ruby.vim
    " .each { |value| ... }
    call s:Hi('rubyBlockParameter', s:oc['yellow'][7], '')
    " ARGV, $stdout
    call s:Hi('rubyPredefinedIdentifier', s:oc['red'][7], '')

    " vim-gitgutter
    call s:Hi('GitGutterAdd', s:oc['lime'][8], '')
    call s:Hi('GitGutterChange', s:oc['yellow'][7], '')
    call s:Hi('GitGutterDelete', s:oc['red'][7], '')
    call s:Hi('GitGutterChangeDelete', s:oc['yellow'][7], '')
  endif
endif

let g:colors_name = 'open-color'
let &background = s:background

let &cpoptions = s:save_cpo
unlet s:save_cpo
