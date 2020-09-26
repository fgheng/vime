let g:onestatus_config_path = g:vim_root_path . "/plugins_config/onestatus.json"

au BufEnter * :OneStatus
set laststatus=0
set noshowmode noruler


" let g:onestatus_default_layout = 0

" au BufEnter call onestatus#build([
" \ {
        " \ 'command': 'set-option -g status-right',
        " \ 'attributes': [
            " \ {"fg": s:col2, "bg": "default", "label": ""},
            " \ {"fg": s:col1, "bg": s:col2, "label": "my current directory"},
            " \ {"fg": s:col1,"bg": s:col2, "label": ""},
            " \ {"fg": "#fcfcfc", "bg": s:col1, "label": "my branch"}
        " \ ]
        " \ }
" \])
