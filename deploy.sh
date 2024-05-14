#!/bin/sh

SCRIPT=`realpath $0`
SCRIPTPATH=`dirname $SCRIPT`

# set up fixed location for the dotfile repo
ln -sf $SCRIPTPATH -T ~/.dotfiles

# homedir dotfiles
ln -s ~/.dotfiles/.profile -T ~/.profile
ln -s ~/.dotfiles/.Xmodmap -T ~/.Xmodmap
ln -s ~/.profile -T ~/.zprofile
ln -s ~/.dotfiles/.zshrc -T ~/.zshrc
ln -s ~/.dotfiles/.xinitrc -T ~/.xinitrc

# .config
mkdir -p ~/.config/

ln -s ~/.dotfiles/.config/starship.toml ~/.config/starship.toml

ln -sT ~/.dotfiles/.config/nvim ~/.config/nvim

mkdir -p ~/.config/dunst
ln -s ~/.dotfiles/.config/dunst/dunstrc ~/.config/dunst/dunstrc

mkdir -p ~/.config/alacritty
ln -s ~/.dotfiles/.config/alacritty/alacritty.yml ~/.config/alacritty

ln -sT ~/.dotfiles/.config/fish ~/.config/fish
ln -sT ~/.dotfiles/.config/fuzzel ~/.config/fuzzel
ln -sT ~/.dotfiles/.config/helix ~/.config/helix
ln -sT ~/.dotfiles/.config/hypr ~/.config/hypr
ln -sT ~/.dotfiles/.config/kitty ~/.config/kitty
ln -sT ~/.dotfiles/.config/ranger ~/.config/ranger
ln -sT ~/.dotfiles/.config/waybar ~/.config/waybar
ln -sT ~/.dotfiles/.config/zathura ~/.config/zathura
ln -sT ~/.dotfiles/.config/zellij ~/.config/zellij

ln -sT ./$(hostname).conf ~/.config/hypr/machines/current.conf

sudo ln -sT ~/.dotfiles/.config/keyd /etc/keyd

# ~/bin
mkdir -p ~/bin
for file in ~/.dotfiles/bin/*; do
	ln -sT $file ~/bin/$(basename $file)
done
