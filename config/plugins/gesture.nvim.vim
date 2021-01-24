set mouse=a
nnoremap <silent> <LeftDrag> <Cmd>Gesture draw<CR>
nnoremap <silent> <LeftRelease> <Cmd>Gesture finish<CR>
lua << EOF
    local gesture = require('gesture')
    gesture.register({
        name = "scroll to bottom",
        inputs = { gesture.up(), gesture.down() },
        action = "normal! G"
    })
    gesture.register({
        name = "scroll up",
        inputs = { gesture.up() },
        action = "normal! <c-u>"
    })
    gesture.register({
        name = "scroll down",
        inputs = { gesture.down() },
        action = "normal! <c-d>"
    })
    gesture.register({
        name = "next tab",
        inputs = { gesture.right() },
        action = "tabnext"
    })
    gesture.register({
        name = "previous tab",
        inputs = { gesture.left() },
        action = function() -- also can use function
            vim.cmd("tabprevious")
        end,
    })
EOF
