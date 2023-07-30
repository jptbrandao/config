set termguicolors "set t_Co=256 turm=xterm-256color

function! ColorGruvbox()
    highlight Normal guibg=none
    let g:gruvbox_italic=1
    let g:gruvbox_contrast_dark="hard" " hard, medium or soft
    let g:gruvbox_contrast_light="medium" " hard, medium or soft
    let g:gruvbox_invert_selection=0
    set background=dark
    colorscheme gruvbox
endfunction

"" Set colorscheme
call ColorGruvbox()
