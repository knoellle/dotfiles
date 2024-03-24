#!/bin/sh
# Profile file. Runs on login.

# Adds `~/.scripts` and all subdirectories to $PATH
export PATH="$PATH:$HOME/bin:$(du -L "$HOME/.scripts/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"
export EDITOR="nvim"
export TERMINAL="kitty"
export BROWSER="firefox"
export READER="zathura"
export FILE="ranger"
export BIB="$HOME/Documents/LaTeX/uni.bib"
export REFER="$HOME/Documents/referbib"
export SUDO_ASKPASS="$HOME/.scripts/tools/dmenupass"
export NOTMUCH_CONFIG="$HOME/.config/notmuch-config"
export GTK2_RC_FILES="$HOME/.config/gtk-2.0/gtkrc-2.0"

# less/man colors
export LESS=-R
export LESS_TERMCAP_mb="$(printf '%b' '[1;31m')"; a="${a%_}"
export LESS_TERMCAP_md="$(printf '%b' '[1;36m')"; a="${a%_}"
export LESS_TERMCAP_me="$(printf '%b' '[0m')"; a="${a%_}"
export LESS_TERMCAP_so="$(printf '%b' '[01;44;33m')"; a="${a%_}"
export LESS_TERMCAP_se="$(printf '%b' '[0m')"; a="${a%_}"
export LESS_TERMCAP_us="$(printf '%b' '[1;32m')"; a="${a%_}"
export LESS_TERMCAP_ue="$(printf '%b' '[0m')"; a="${a%_}"

# [ ! -f ~/.config/shortcutrc ] && shortcuts >/dev/null 2>&1

# echo "$0" | grep "bash$" >/dev/null && [ -f ~/.bashrc ] && source "$HOME/.bashrc"

# Switch escape and caps if tty:
# sudo -n loadkeys ~/.scripts/ttymaps.kmap 2>/dev/null

export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"

export PATH="$HOME/bin:$HOME/.cargo/bin:/usr/sbin:/sbin:/bin:/usr/games:$HOME/.nix-profile/bin/:/usr/lib/ccache/bin:$HOME/helperScripts:$HOME/.local/bin/:$GEM_HOME/bin:$PATH"

if [ -d "$HOME/adb-fastboot" ] ; then
    export PATH="$HOME/adb-fastboot:$PATH"
fi

# Enable touch scrolling in firefox
export MOZ_USE_XINPUT2=1

# Make qt5 behave
export QT_QPA_PLATFORMTHEME=qt5ct
export QT_STYLE_OVERRIDE=adwaita-dark
export CALIBRE_USE_DARK_PALETTE=1

# export RUST_BACKTRACE=1
