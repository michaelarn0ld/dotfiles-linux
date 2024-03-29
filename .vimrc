""""""""""""""""""""""""
"       Settings       "
""""""""""""""""""""""""

call plug#begin()
Plug 'pangloss/vim-javascript'
Plug 'fatih/vim-go'
Plug 'morhetz/gruvbox'
Plug 'mattn/emmet-vim'
call plug#end()

" Some basics
set nocompatible          " enable modern Vim features (not Vi compatible)
set noerrorbells          " no beeps
set tabstop=2             " tab is 2 columns 
set softtabstop=2         " tab in insert mode is 2 columns
set shiftwidth=2          " indenting is 2 columns
set expandtab             " tab in insert mode produces spaces
set autoindent            " auto-indents new lines...
set smartindent           " ...and do the right thing (mostly)
set nu                    " show line numbers on left side
set nowrap                " do not wrap lines of text
set ignorecase            " search case insensitive...
set smartcase             " ...but not if the search has upper case
set incsearch             " highlight search matches while typing
set colorcolumn=80        " show wall at col 80 so I know where to wrap

" Backups, swaps, and undos 
set undofile
set undodir=~/.vim/undodir//
set backup
set backupdir=~/.vim/backupdir//
set directory=~/.vim/swapdir//

" Colorscheme
syntax on
set background=dark
colorscheme gruvbox

" File Navigation
set wildmenu


""""""""""""""""""""""""
"       Mappings       "
""""""""""""""""""""""""

" Disable arrow keys and mouse
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
set mouse=
set ttymouse=

" Bracket, Quote, Parenthesis Completion
inoremap ( ()<Esc>i
inoremap { {}<Esc>i
inoremap {<CR> {<CR>}<Esc>O
inoremap [ []<Esc>i
inoremap ' ''<Esc>i
inoremap " ""<Esc>i
inoremap /*<CR> /*<CR>*/<Esc>O


"""""""""""""""""""""""
"      Functions      "
"""""""""""""""""""""""
let t:is_transparent = 0
function! Toggle_transparent()
    if t:is_transparent == 0
        hi Normal guibg=NONE ctermbg=NONE
        let t:is_transparent = 1
    else
        set background=dark
        let t:is_transparent = 0
    endif
endfunction
nnoremap <C-t> : call Toggle_transparent()<CR>

"""""""""""""""""""""""
"       Plugins       "
"""""""""""""""""""""""

" Emmet shortcuts
let g:user_emmet_mode = 'n'           " only enable normal mode functions
let g:user_emmet_leader_key = ','

" Syntax highlighting for go
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1 
let g:go_highlight_function_calls = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1

