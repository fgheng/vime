let g:fzf_preview_floating_window_rate = 0.6
let g:fzf_preview_default_fzf_options = { '--reverse': v:true, '--preview-window': 'wrap' }
" jump to the buffers by default, when possible
let g:fzf_preview_buffers_jump = 1
let g:fzf_preview_fzf_preview_window_option = 'up:50%'
" let g:fzf_preview_command = g:scripts_root_path . '/preview.sh'
let g:fzf_preview_use_dev_icons = 1
let g:fzf_preview_dev_icon_prefix_string_length = 3
let g:fzf_preview_grep_cmd = 'rg --column --line-number --no-heading --color=always --smart-case'
let g:fzf_preview_cache_directory = g:cache_root_path . 'fzf_preview'
" let g:fzf_preview_preview_key_bindings = 'ctrl-f:preview-page-down,ctrl-b:preview-page-up,?:toggle-preview,ctrl-d:'

augroup vime_fzf_preview_group
    autocmd!
    au FileType fzf tnoremap <buffer> <C-j> <Down>
    au FileType fzf tnoremap <buffer> <C-k> <Up>
    au FileType fzf tunmap <buffer> <Esc>
augroup END

function! s:RipgrepFzfWithWiki(query, fullscreen)
    " 这个是在安装了vimwiki插件后使用的功能，需要配置一下g:vimwiki_path路径
    if common#functions#HasPlug('vimwiki') && &ft ==? 'vimwiki' && match(expand('%:p'), expand(g:vimwiki_path)) > -1
        let wiki_path = g:vimwiki_path
    else
        let wiki_path = ""
    endif
    execute 'FzfPreviewProjectGrep .' . ' ' . wiki_path
endfunction
command! -nargs=* -bang GrepWithWiki call s:RipgrepFzfWithWiki(<q-args>, <bang>0)

function! s:FilesWithWiki(query, fullscreen)
    let l:q=a:query
    if empty(l:q) && common#functions#HasPlug('vimwiki') && &ft ==? 'vimwiki' && match(expand('%:p'), expand(g:vimwiki_path)) > -1
        let l:q=g:vimwiki_path
    endif
    exec 'FzfPreviewDirectoryFiles' . ' ' . l:q
endfunction
command! -bang -nargs=? -complete=dir FWW call s:FilesWithWiki(<q-args>, <bang>0)

nnoremap <M-f> :<c-u>FWW<CR>
nnoremap <M-F> :<c-u>FWW $HOME<CR>
nnoremap <M-b> :<c-u>FzfPreviewAllBuffers<CR>
if common#functions#HasPlug('vista.vim')
    nnoremap <M-t> :<c-u>FzfPreviewVistaBufferCtags<CR>
    nnoremap <M-T> :<c-u>FzfPreviewVistaCtags<CR>
else
    nnoremap <M-t> :<c-u>FzfPreviewBufferTags<CR>
    nnoremap <M-T> :<c-u>FzfPreviewCtags<CR>
endif
" 使用rg搜索工作目录或者笔记目录
nnoremap <M-s> :GrepWithWiki<CR>
" 模糊搜索所有buffer
nnoremap ? :<c-u>FzfPreviewLines<CR>
if executable('bat')
    nnoremap <silent> * :<C-u>FzfPreviewLines --add-fzf-arg=--no-sort --add-fzf-arg=--query="'<C-r>=expand('<cword>')<CR>"<CR>
endif
nnoremap <M-r> :<c-u>FzfPreviewMruFiles<CR>
nnoremap <M-c> :<c-u>FzfPreviewCommandPalette<CR>
nnoremap <M-C> :<c-u>FzfPreviewChanges<CR>
if common#functions#HasPlug('vim-bookmarks')
    nnoremap <M-m> :<c-u>FzfPreviewBookmarks<CR>
else
    nnoremap <M-m> :<c-u>FzfPreviewMarks<CR>
endif
if common#functions#HasPlug('yankround.vim')
    nnoremap <M-y> :<c-u>FzfPreviewYankround<CR>
endif
nnoremap <M-J> :<c-u>FzfPreviewJumps<CR>
" nnoremap <M--> :<c-u>FzfPreviewQuickFix<CR>
" nnoremap <M-_> :<c-u>FzfPreviewLocationList<CR>
nnoremap <F8> :<c-u>FzfPreviewQuickFix<CR>
nnoremap <F9> :<c-u>FzfPreviewLocationList<CR>

" git相关
nnoremap <leader>gf :<c-u>FzfPreviewGitFiles<CR>
nnoremap <leader>gs :<c-u>FzfPreviewGitStatus<CR>
nnoremap <leader>ga :<c-u>FzfPreviewGitActions<CR>
nnoremap <leader>gb :<c-u>FzfPreviewBlamePR<CR>
nnoremap <leader>gl :<c-u>FzfPreviewGitLogs<CR>
