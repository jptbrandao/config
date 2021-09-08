set nocompatible "not vi compatible
filetype off

"--------------------------------
"      Syntax and indent
"--------------------------------
"syntax on         "Turns on syntax highlighting
set showmatch     "Show matching braces when text indicator is over them

augroup CursorLineOnlyInActiveWindow
    autocmd!
    autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    autocmd WinLeave * setlocal nocursorline
augroup END

filetype plugin indent on "enable file type detection
set autoindent


"--------------------------------
"      Basic Editing Config
"--------------------------------

set nu "Set number of lines
set rnu "Set relative line numbering
set incsearch "Set incremental search (as string is being typed)
set hls "Highlight search
set lbr "Set linebreak
set backspace=indent,eol,start "allows backspacing over everything
set listchars=tab:>>,nbsp:~ "set list to see tabs and non breakable spaces
set wildmenu "Provides graphical menu for matches in autocomplete , try ':e <filename>'
set lazyredraw "Draws only when necessary
set ruler "Shows cursor position at all times
set showcmd "Displays incomplete commands

" Use two spaces instead of tab during formatting
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

" Smart case sensitive search
set smartcase
set ignorecase

set splitright "New splits on the right

set backupdir=~/tmp// "Saves backup files to tmp
set directory=~/tmp// "Saves swap files to tmp
set undodir=~/tmp//   "Saves undo files to tmp


"--------------------------------
"     Remapping Keys 
"--------------------------------
"'Q' in normal mode enters Ex mode. Don't want this.
nmap Q <Nop> 
"space opens and closes folding
nnoremap <space> za  

"Maps B and E to beginning and end of lines repectively
nnoremap B ^
nnoremap E $

"Maps keys J and K for scrolling up and down screen
nnoremap J <C-e>
nnoremap K <C-y>

"Maps leader to ,
let mapleader=","

"Maps ,<space> to turn off highlight
nnoremap <leader><space> :nohlsearch<CR>


"--------------------------------
"      Folding 
"--------------------------------
set foldenable "enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
set foldmethod=indent   " fold based on indent level
" This is especially useful for me since I spend my days in Python.
" Other acceptable values are marker, manual, expr, syntax, diff.
" Run :help foldmethod to find out what each of those do.


call plug#begin('~/.config/nvim/plugged')
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'hdima/python-syntax'
Plug 'magicalbanana/sql-syntax-vim'

" Javascript syntax
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'

" React-Typescript syntax
" Reference: https://github.com/peitalin/vim-jsx-typescript
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

" js prettier ESLint
" Reference: https://github.com/dense-analysis/ale
Plug 'w0rp/ale'
call plug#end()

" Dictionary
set spelllang=en_us,pt
set spell
set splitright

" COLORS
"
let g:gruvbox_invert_selection=0
colorscheme gruvbox

" PLUGIN NERDTREE
autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd BufWinEnter * NERDTreeMirror
autocmd VimEnter * wincmd p
let g:NERDTreeWinPos = "right"


" PLUGIN ES Linter (ALE)
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow

let g:ale_fixers = {
\  'javascript': ['eslint'],
\}
let g:ale_fix_on_save = 1
