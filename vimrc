"test
"call pathogen#runtime_append_all_bundles()
"call pathogen#helptags()
execute pathogen#infect()

syntax on

let g:dracula_italic = 0
let g:dracula_colorterm = 0
colorscheme dracula

"filetype plugin on

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


"morrison header stuff
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
	Plugin 'VundleVim/Vundle.vim'
	Plugin 'https://gitlab.com/mmorri22/vim-header.git'
	let g:VimHeaderEmails = 'dwilli36@nd.edu'
	let g:VimHeaderNames = 'Dane Williams'
call vundle#end()	
filetype plugin indent on
