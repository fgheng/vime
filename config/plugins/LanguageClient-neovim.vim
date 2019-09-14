set hidden

let g:LanguageClient_serverCommands = {
	\ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
	\ 'javascript': ['typescript-language-server'],
	\ 'python': ['~/Software/anaconda3/envs/keras/bin/pyls'],
	\ 'cpp': ['ccls'],
	\ 'c': ['ccls']
	\ }

nnoremap <space>l :call LanguageClient_contextMenu()<CR>
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <space>rn :call LanguageClient#textDocument_rename()<CR>
