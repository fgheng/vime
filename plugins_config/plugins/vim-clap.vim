let g:clap_layout = { 'relative': 'editor' }
let g:clap_theme = 'material_design_dark'
" Change the CamelCase of related highlight group name to under_score_case.
" let g:clap_theme = { 'search_text': {'guifg': 'red', 'ctermfg': 'red'} }

" ref https://github.com/junegunn/fzf.vim/issues/379
function! s:SystemExecute(lines)
    for line in a:lines
        exec 'silent !xdg-open ' . fnameescape(line) . ' > /dev/null'
    endfor
endfunction
let g:clap_open_action = {
            \ 'ctrl-t': 'tab split',
            \ 'ctrl-s': 'split',
            \ 'ctrl-v': 'vsplit',
            \ 'ctrl-x': function('s:SystemExecute'),
\ }

function! s:ClapFiles() abort
    if &ft ==? 'vimwiki' && match(expand('%:p'), expand(g:vimwiki_path)) > -1
        exec "Clap files " . g:vimwiki_path
    else
        exec "Clap files"
    endif
endfunc

function! s:ClapGrep() abort
    if &ft ==? 'vimwiki' && match(expand('%:p'), expand(g:vimwiki_path)) > -1
        exec "Clap grep " . g:vimwiki_path
    else
        exec "Clap grep"
    endif
endfunc

nnoremap <M-f> :call <SID>ClapFiles()<CR>
" nnoremap <M-F> :Clap files $HOME<CR>
nnoremap <M-b> :Clap buffers<CR>
nnoremap <M-c> :Clap command<CR>
nnoremap <M-t> :Clap tags<CR>
nnoremap <M-T> :Clap proj_tags<CR>
" 使用rg搜索工作目录
nnoremap <M-s> :call <SID>ClapGrep()<CR>
" 模糊搜索所有buffer
nnoremap ? :Clap lines<CR>
nnoremap <M-r> :Clap history<CR>
nnoremap <M-m> :Clap marks<CR>
nnoremap <M-M> :Clap maps<CR>
nnoremap <M-w> :Clap windows<CR>
nnoremap <M-y> :Clap yanks<CR>
nnoremap <M-J> :Clap jumps<CR>

nnoremap <F8> :Clap quickfix<CR>
nnoremap <F9> :Clap loclist<CR>

nnoremap <leader>gd :Clap git_diff_files<CR>
nnoremap <leader>gf :Clap gfiles<CR>
nnoremap <leader>gm :Clap bcommits<cr>
nnoremap <leader>gM :Clap commits<cr>
