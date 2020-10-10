" bookmark文件存储路径
let g:bookmark_file = $HOME.'/.cache/vim/vim-bookmarks'

let g:bookmark_sign = '♥'
let g:bookmark_highlight_lines = 1
let g:bookmark_auto_save_file = g:bookmark_file

noremap ma :BookmarkAnnotate<cr>
noremap ml :BookmarkShowAll<cr>
noremap mm :BookmarkToggle<cr>

" |-----------------------------------------------|--------------|-------------------------------|
" | Action                                        | Shortcut     | Command                       |
" |-----------------------------------------------|--------------|-------------------------------|
" | Add/remove bookmark at current line           | `mm`         | `:BookmarkToggle`             |
" | Add/edit/remove annotation at current line    | `mi`         | `:BookmarkAnnotate <TEXT>`    |
" | Jump to next bookmark in buffer               | `mn`         | `:BookmarkNext`               |
" | Jump to previous bookmark in buffer           | `mp`         | `:BookmarkPrev`               |
" | Show all bookmarks (toggle)                   | `ma`         | `:BookmarkShowAll`            |
" | Clear bookmarks in current buffer only        | `mc`         | `:BookmarkClear`              |
" | Clear bookmarks in all buffers                | `mx`         | `:BookmarkClearAll`           |
" | Move up bookmark at current line              | `[count]mkk` | `:BookmarkMoveUp [<COUNT>]`   |
" | Move down bookmark at current line            | `[count]mjj` | `:BookmarkMoveDown [<COUNT>]` |
" | Move bookmark at current line to another line | `[count]mg`  | `:BookmarkMoveToLine <LINE>`  |
" | Save all bookmarks to a file                  |              | `:BookmarkSave <FILE_PATH>`   |
" | Load bookmarks from a file                    |              | `:BookmarkLoad <FILE_PATH>`   |
" |-----------------------------------------------|--------------|-------------------------------|
