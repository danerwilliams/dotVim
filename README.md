# dotVim
My vim configuration  
  
## Installation
Navigate to home directory  
`cd ~`  
Delete or rename current .vim folder if you have one  
`git clone http://github.com/danerwilliams/dotVim.git ~/.vim`  
Delete or rename your preexisting .vimrc to allow for symlink to be created in home directory  
`ln -s ~/.vim/vimrc ~/.vimrc`  
  
Navigate to .vim directory  
`cd ~/.vim`  
Initiatialize and update submodules  
`git submodule init`  
`git submodule update`  
  
Run:  
`vim +PluginInstall +qall`  
