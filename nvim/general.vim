call plug#begin('~/.config/nvim/plugged')
Plug 'neovim/nvim-lspconfig'
Plug 'gruvbox-community/gruvbox'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'hdima/python-syntax'
Plug 'magicalbanana/sql-syntax-vim'
Plug 'mbbill/undotree'

" Rust
Plug 'rust-lang/rust.vim'

" Tyescript
Plug 'peitalin/vim-jsx-typescript'

" telescope
"Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Javascript syntax
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'

" Golang syntax
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Git blame, shows author next to line
Plug 'APZelos/blamer.nvim'
call plug#end()

" Dictionary
set spelllang=en_us
set spell
set splitright

" telescope
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({search = vim.fn.input("Grep for > ")})<CR>

" COLORS
highlight Normal guibg=none
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_invert_selection=0
set background=dark
colorscheme gruvbox


augroup CursorLineOnlyInActiveWindow
  autocmd!
  autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  autocmd WinLeave * setlocal nocursorline
augroup END

"----------------------------------------------
" Plugin: 'scrooloose/nerdtree'
"----------------------------------------------
"Map ctrl n to go straight nerd tree
map <silent> <C-n> :NERDTreeFocus<CR>
autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd BufWinEnter * NERDTreeMirror
autocmd VimEnter * wincmd p
let g:NERDTreeWinPos = "right"
let g:NERDTreeShowHidden = 1



"----------------------------------------------
" Plugin: 'neoclide/coc.nvim'
"----------------------------------------------
" COC  AutoCompletion Settings
let g:coc_global_extensions = [
\ 'coc-eslint', 'coc-prettier',
\ 'coc-tsserver', 'coc-tslint-plugin',
\ 'coc-json', 'coc-rls', 'coc-yaml', 'coc-rust-analyzer',
\ 'coc-go'
\ ]


"----------------------------------------------
" Language: Go
"----------------------------------------------
" Enable syntax highlighting per default
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
" Show type information
let g:go_auto_type_info = 1
" Highlight variable uses
let g:go_auto_sameids = 0
" Using gopls to find definitions and information.
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'


set cmdheight=2
set updatetime=300
set shortmess+=c

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gt <Plug>(coc-type-definition)     # maps to change tab
nmap <silent> gr <Plug>(coc-references)
nmap <silent> <C-f> <Plug>(coc-refactor)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Function to trim whitespace
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

" Automatically call a few functions when saving files
augroup formatCode
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
    " automatically format files on save
    autocmd BufWrite * :call CocAction('format')
augroup END

" open the diagnostic window
nnoremap <leader>xx <cmd>CocDiagnostics<cr>

" Use `lj` and `lk` for navigate diagnostics
nmap <silent> <leader>lj <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>lk <Plug>(coc-diagnostic-next)

"
"END COC"

" Git blame Plugin
let g:blamer_prefix = '   //   '
let g:blamer_template ='<committer>: <committer-time> => <summary>'
let g:blamer_delay = 500

" PLUGIN CTRLP
"let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc
"--exclude-standard']
"let g:ctrlp_use_caching = 0
nnoremap <C-p> :lua require('telescope.builtin').find_files()<CR>
