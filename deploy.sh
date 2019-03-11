#!/bin/sh

SCRIPT=`realpath $0`
SCRIPTPATH=`dirname $SCRIPT`

# set up fixed location for the dotfile repo
ln -s $SCRIPTPATH -T ~/.dotfiles

ln -s ~/.dotfiles/.profile -T ~/.profile
ln -s ~/.dotfiles/.zshrc -T ~/.zshrc

# .config
ln -s ~/.dotfiles/.config/compton.conf ~/.config/compton.conf

mkdir -p ~/.config/termite
ln -s ~/.dotfiles/.config/termite/config ~/.config/termite/config

# ~/bin
mkdir -p ~/bin
for file in ~/.dotfiles/bin/*; do
	ln -s $file -T ~/bin/$(basename $file)
done
