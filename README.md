# dotVim

cd ~    
git clone http://github.com/danerwilliams/dotVim.git ~/.vim #delete or rename current .vim folder if you have one    
ln -s ~/.vim/vimrc ~/.vimrc   #delete or rename your preexisting .vimrc to allow for symlink to be created in home directory    
cd ~/.vim      
git submodule init #ignore 'fatal: No url found for submodule path 'bundle/vim-sensible' in .gitmodules'    
git submodule update     
