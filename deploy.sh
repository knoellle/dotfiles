#!/bin/sh

SCRIPT=`realpath $0`
SCRIPTPATH=`dirname $SCRIPT`

# set up fixed location for the dotfile repo
ln -s $SCRIPTPATH -T ~/.dotfiles

# homedir dotfiles
ln -s ~/.dotfiles/.profile -T ~/.profile
ln -s ~/.dotfiles/.Xmodmap -T ~/.Xmodmap
ln -s ~/.profile -T ~/.zprofile
ln -s ~/.dotfiles/.zshrc -T ~/.zshrc
ln -s ~/.dotfiles/.xinitrc -T ~/.xinitrc

# .config
ln -s ~/.dotfiles/.config/compton.conf ~/.config/compton.conf
ln -s ~/.dotfiles/.config/starship.toml ~/.config/starship.toml

mkdir -p ~/.config/newsboat
ln -s ~/.dotfiles/.config/newsboat/config ~/.config/newsboat/config
ln -s ~/.dotfiles/.config/newsboat/urls ~/.config/newsboat/urls

mkdir -p ~/.config/termite
ln -s ~/.dotfiles/.config/termite/config ~/.config/termite/config

mkdir -p ~/.config/nvim
ln -s ~/.dotfiles/.config/nvim/init.vim ~/.config/nvim/init.vim

mkdir -p ~/.config/dunst
ln -s ~/.dotfiles/.config/dunst/dunstrc ~/.config/dunst/dunstrc

mkdir -p ~/.config/sxhkd
ln -s ~/.dotfiles/.config/sxhkd/sxhkdrc ~/.config/sxhkd/sxhkdrc

mkdir -p ~/.config/alacritty
ln -s ~/.dotfiles/.config/alacritty/alacritty.yml ~/.config/alacritty

# ~/bin
mkdir -p ~/bin
for file in ~/.dotfiles/bin/*; do
	ln -s $file -T ~/bin/$(basename $file)
done
