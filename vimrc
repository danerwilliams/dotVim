set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"dracula theme
Plugin 'dracula/vim', { 'name': 'dracula' }

"toml syntax support
Plugin 'cespare/vim-toml'

"cool status bar
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

"vim settings everyone can agree on
Plugin 'tpope/vim-sensible'

"flex and bison syntax highlighting for compilers
Plugin 'justinmk/vim-syntax-extra'

"bminor syntax highlighting
Plugin 'ginglis13/bminor-vim-syntax-highlighting'

Plugin 'tpope/vim-fugitive'

call vundle#end()            " required
filetype plugin indent on    " required

"fix tmux color issue
"set background = dark
set t_Co=256

"syntax on

let g:dracula_italic = 0
let g:dracula_colorterm = 0
colorscheme dracula

set tabstop=4 expandtab
set shiftwidth=4
set softtabstop=4

set autoindent
set smartindent
"set cindent

set mouse=a

set number

