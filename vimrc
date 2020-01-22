
"call pathogen#runtime_append_all_bundles()
"call pathogen#helptags()
execute pathogen#infect()

syntax on

let g:dracula_italic = 0
let g:dracula_colorterm = 0
colorscheme dracula

filetype plugin on

set tabstop=4
set shiftwidth=4
set softtabstop=4

set autoindent
set smartindent
set cindent

" Automatically closing braces
"inoremap { {<CR>}<Esc>ko
"inoremap <silent> ( ()<ESC>hli

set mouse=a

set number
