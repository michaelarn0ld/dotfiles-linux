" Basic settings that have nothing to do with my plugins
syntax on
set noerrorbells
set tabstop=4 
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set colorcolumn=80


" Disable the use of arrow keys and mouse
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
set mouse=
set ttymouse=


call plug#begin()
Plug 'fatih/vim-go'
Plug 'morhetz/gruvbox'
Plug 'mattn/emmet-vim'
call plug#end()

" Modified settings for colorscheme
set background=dark
colorscheme gruvbox

" Modified settings for vim-go
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1 
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1

" Apply autosave (for :GoBuild)
set autowrite
