" 使用一句命令，快速记录想法

function! s:quick_note(text) abort
    let text = substitute(a:text, '^\s*\(.\{-}\)\s*$', '\1', '')

    if exists('*writefile') && text != ''
        let filename = get(g:, 'quicknote_file', '~/.vim/quicknote.md')
        let notehead = get(g:, 'quicknote_head', '- ')
        let notetime = strftime('[%Y-%m-%d %H:%M:%S] ')
        let realname = expand(filename)

        call writefile([notehead . notetime . text], realname, 'a')
        checktime
        echo notetime . text
    endif
endfunction

function! s:quick_note_open() abort
    let filename = get(g:, 'quicknote_file', '~/.vim/quicknote.md')
    let realname = expand(filename)
    exec "e " . realname
endfunction

command! -nargs=+ Note call s:quick_note(<q-args>)
command! NoteOpen call s:quick_note_open()
