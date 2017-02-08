execute pathogen#infect()
syntax on
filetype plugin indent on
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
set nofoldenable

syntax enable
set background=dark
let g:solarized_termcolors=256
let g:solarized_visibility="low"
colorscheme solarized

set list
set paste
set number
set expandtab
set tabstop=4

