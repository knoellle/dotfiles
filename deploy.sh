#!/bin/sh

SCRIPT=`realpath $0`
SCRIPTPATH=`dirname $SCRIPT`

# set up fixed location for the dotfile repo
ln -s $SCRIPTPATH -T ~/.dotfiles

# homedir dotfiles
ln -s ~/.dotfiles/.profile -T ~/.profile
ln -s ~/.profile -T ~/.zprofile
ln -s ~/.dotfiles/.zshrc -T ~/.zshrc
ln -s ~/.dotfiles/.xinitrc -T ~/.xinitrc

# .config
ln -s ~/.dotfiles/.config/compton.conf ~/.config/compton.conf

mkdir -p ~/.config/newsboat
ln -s ~/.dotfiles/.config/newsboat/config ~/.config/newsboat/config
ln -s ~/.dotfiles/.config/newsboat/urls ~/.config/newsboat/urls

mkdir -p ~/.config/termite
ln -s ~/.dotfiles/.config/termite/config ~/.config/termite/config

mkdir -p ~/.config/nvim
ln -s ~/.dotfiles/.config/nvim/init.vim ~/.config/nvim/init.vim

# ~/bin
mkdir -p ~/bin
for file in ~/.dotfiles/bin/*; do
	ln -s $file -T ~/bin/$(basename $file)
done
