function coc#source#foo#init() abort
    return {
        \ 'shortcut': 'foo',
        \ 'priority': 3,
      \ }
endfunction

function coc#source#foo#complete(opt, cb) abort
    let items = [
            \ {
            \ "word": "foo"
            \ },
            \ {
            \ "word": "bar"
            \ }
        \ ]
    call a:cb(items)
endfunction
