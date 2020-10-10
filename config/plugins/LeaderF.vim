" fzf优先
highlight Lf_hl_rgHighlight guifg=#FFFF00 guibg=NONE ctermfg=yellow ctermbg=NONE
highlight Lf_hl_match gui=bold guifg=Red cterm=bold ctermfg=21
highlight Lf_hl_matchRefine  gui=bold guifg=Magenta cterm=bold ctermfg=201

let g:Lf_HideHelp = 1
" 使用leaderf file path的时候不更改目录到path
let g:Lf_NoChdir = 1
let g:Lf_UseCache = 0
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1
" popup mode
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }
let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }
let g:Lf_GtagsAutoGenerate = 0
let g:Lf_Gtagslabel = 'native-pygments'

function! LeaderfFileWithWiki(query) abort
    if empty(a:query) && &ft ==? 'vimwiki' && match(expand('%'), expand(g:vimwiki_path)) > -1
        exec "LeaderfFile " . g:vimwiki_path
    else
        exec "LeaderfFile " . a:query
    endif
endfunction

function! LeaderfRgWithWiki(query) abort
    if &ft ==? 'vimwiki' && match(expand('%'), expand(g:vimwiki_path)) > -1
        exec 'Leaderf rg -F -e "" ' . g:vimwiki_path
    else
        exec 'Leaderf rg -F -e ' . leaderf#Rg#visual()
    endif
endfunction

nnoremap <M-f> :call LeaderfFileWithWiki("")<CR>
nnoremap <M-F> :call LeaderfFileWithWiki($HOME)<CR>
nnoremap <M-s> :call LeaderfRgWithWiki("")<cr>
nnoremap <M-b> :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
nnoremap <M-c> :LeaderfCommand<cr>
nnoremap <M-t> :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
nnoremap <M-T> :LeaderfBufTagAll<cr>
nnoremap ?     :LeaderfLineAll<CR>
nnoremap <M-r> :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
nnoremap <M-w> :<C-U><C-R>=printf("Leaderf! window %s", "")<CR><CR>
