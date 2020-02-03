"test
"call pathogen#runtime_append_all_bundles()
"call pathogen#helptags()
execute pathogen#infect()

"fix tmux color issue
"set background = dark
set t_Co=256

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

	"Plugin 'https://gitlab.com/mmorri22/vim-header.git'
	let g:VimHeaderEmails = 'dwilli36@nd.edu'
	let g:VimHeaderNames = 'Dane Williams'

	"Plugin 'https://github.com/airblade/vim-gitgutter.git'
	"Plugin 'airblade/vim-gitgutter'
	
	Plugin 'kien/rainbow_parentheses.vim'
	au VimEnter * RainbowParenthesesToggle
	let g:rbpt_colorpairs = [ 
	    \ ['darkgreen',   'RoyalBlue3'],
		\ ['brown',       'RoyalBlue3'],	
	    \ ['red',         'firebrick3'],
	    \ ['Darkblue',    'SeaGreen3'],
	    \ ['darkgray',    'DarkOrchid3'],
	    \ ['darkgreen',   'firebrick3'],
	    \ ['darkcyan',    'RoyalBlue3'],
	    \ ['darkred',     'SeaGreen3'],
	    \ ['darkmagenta', 'DarkOrchid3'],
	    \ ['brown',       'firebrick3'],
	    \ ['gray',        'RoyalBlue3'],
	    \ ['darkmagenta', 'DarkOrchid3'],
	    \ ['darkgreen',   'RoyalBlue3'],
	    \ ['darkcyan',    'SeaGreen3'],
	    \ ['Darkblue',    'firebrick3'],
	    \ ['darkred',     'DarkOrchid3'],
		\ ['white',		  'RoyalBlue3'],
	    \ ]


call vundle#end()
filetype plugin indent on
