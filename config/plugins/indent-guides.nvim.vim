lua << EOF
require('indent_guides').setup({
    indent_levels = 30;
    indent_guide_size = 1;
    indent_start_level = 1;
    indent_space_guides = true;
    indent_tab_guides = false;
    indent_soft_pattern = '\\s';
    exclude_filetypes = {'help','dashboard','dashpreview','NvimTree','vista','sagahover', 'startify', 'markdown', 'md'};
    even_colors = { fg ='#2E323A',bg='#34383F' };
    odd_colors = {fg='#34383F',bg='#2E323A'};
})
EOF
