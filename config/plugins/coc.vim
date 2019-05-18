let g:coc_global_extensions =
            \ [
            \ 'coc-ccls',
            \ 'coc-python',
            \ 'coc-tsserver',
            \ 'coc-vimtex',
            \ 'coc-html',
            \ 'coc-css',
            \ 'coc-json',
            \ 'coc-yaml',
            \ 'coc-snippets',
            \ 'coc-emmet',
            \ 'coc-emoji',
            \ 'coc-highlight',
            \ 'coc-git',
            \ ]
            " \ 'coc-java',
            " \ 'coc-sh',
            """""""
            " \ 'coc-ccls',
            " \ 'coc-diagnostic',
            " \ 'coc-prettier',
            " \ 'coc-pairs',
            " \ 'coc-ultisnips',
            " \ 'coc-syntax',
            " \ 'coc-pyls',
            " \ 'coc-java',

" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
" 使用ctrl j ctrl k来跳转补全块
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" 回车完成代码块
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() :
                                           \"\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" 跳转到下一个标记处
let g:coc_snippet_next = '<M-l>'
let g:coc_snippet_pre = '<M-h>'

" 使用ctrl space触发补全
inoremap <silent><expr> <c-space> coc#refresh()

" diagnostic 跳转
nmap <silent> <space>[ <Plug>(coc-diagnostic-prev)
nmap <silent> <space>] <Plug>(coc-diagnostic-next)

" 定义跳转
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
nnoremap <silent> K :call <SID>show_documentation()<CR>

nnoremap <silent> <space>k :call CocActionAsync('showSignatureHelp')<CR>

" Highlight symbol under cursor on CursorHold
set updatetime=100
au CursorHold * silent call CocActionAsync('highlight')
au CursorHoldI * sil call CocActionAsync('showSignatureHelp')

" Remap for rename current word
nmap <space>rn <Plug>(coc-rename)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
" xmap <leader>a  <Plug>(coc-codeaction-selected)
" nmap <leader>a  <Plug>(coc-codeaction-selected)
" Remap for do codeAction of current line
" nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
" lsp如果实现quickfix功能，那么通过space qf就可以快速进行修复
nmap <space>qf  <Plug>(coc-fix-current)

" Remap for format selected region
xmap <space>f  <Plug>(coc-format-selected)
nmap <space>f  <Plug>(coc-format-selected)
" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
"command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>d  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>t  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
" nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
" nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
" show coclist
nnoremap <silent> <space>l  :<C-u>CocList<CR>
