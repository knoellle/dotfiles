# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/home/mystery/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="agnoster"
ZSH_THEME="rkj-repos-modified"
# ZSH_THEME="jnrowe"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=7

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd/mm/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  archlinux
  colored-man-pages
  command-time
  docker
  docker-compose
  encode64
  fzf
  git
  grc
  pip
  rust
  sudo
  systemd
  wd
  you-should-use
  zbell
  # zsh-autosuggestions
  zsh-hulks
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# Plugin configuration

## ZSH autosuggestions
# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#888888"
# bindkey '^j' autosuggest-execute
# bindkey '^h' autosuggest-accept

## Timing
zsh_command_time() {
    if [ -n "$ZSH_COMMAND_TIME" ]; then
        hours=$(($ZSH_COMMAND_TIME/3600))
        min=$((($ZSH_COMMAND_TIME/60)%60))
        sec=$(($ZSH_COMMAND_TIME%60))
        timer_show=""
        if [ $hours -gt 0 ]; then
            timer_show="$timer_show $hours""h"
        fi
        if [ $min -gt 0 ]; then
            timer_show="$timer_show $min""m"
        fi
        if [ $sec -gt 0 ]; then
            timer_show="$timer_show $sec""s"
        fi
        export ZSH_COMMAND_TIME=$timer_show
    fi
}

## zbell
zbell_duration=5
zbell_ignore=(
  $EDITOR
  v
  $PAGER
  ssh
  r
  ranger
)

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

export EDITOR="nvim"

if [ -d "$HOME/adb-fastboot" ] ; then
    export PATH="$HOME/adb-fastboot:$PATH"
fi

# Pretend to be xterm for ssh connections
export TERM="xterm-256color"

# Enable touch scrolling in firefox
export MOZ_USE_XINPUT2=1

# Make qt5 behave
export QT_QPA_PLATFORMTHEME=qt5ct

# Disable F13 inserting garbage characters
bindkey -s "\e[25~" ""

export GTK_THEME=Adwaita:dark

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias simrobert="prime-run /home/mystery/hulks/nao/tools/SimRobot/build/SimRobot || read"
alias simrobert-intel="/home/mystery/hulks/nao/tools/SimRobot/build/SimRobot"
alias resim="(cd ~/hulks/nao && ./scripts/compile && (simrobert))"
alias mate="(cd /home/mystery/hulks/nao && /home/mystery/.venv/hulks/bin/python /home/mystery/hulks/nao-cpp/tools/mate/run.py&!)"
alias fucking="sudo"
alias please="sudo"
alias yolo="sudo"
alias gib="xclip -selection c"
alias take="xclip -selection c -o"
alias v="/usr/bin/nvim"
alias p="python"
alias p2="python2"
alias j="julia"
alias r="ranger"
alias sranger="source ranger"
alias sr="sranger"
alias cm="cmatrix -a -u3"
alias venv="source venv"
alias btc="bluetoothctl"
alias resource="source ~/.zshrc"
alias rs="resource"
alias fv='v $(fzf)'
alias xev='xev | grep "keycode"'
alias wtf='journalctl -r'
alias samedir='(cd $(pwd); $TERMINAL)  >/dev/null 2>&1 &!'
alias suspend='systemctl suspend'
alias zconf="nvim ~/.zshrc"
alias aconf="nvim ~/.config/awesome/rc.lua"
alias atconf="nvim ~/.config/awesome/themes/hulks-dark/theme.lua"
alias vconf="nvim ~/.config/nvim/init.vim"
# taskwarrior
alias ts="task sync"
alias ta="task add"
# ssh
alias rechenknecht="ssh -X knoellle@10.2.24.6"
alias pi="ssh pi@raspberrypi"
alias vps="ssh mystery@193.30.120.235 -p 51337"
alias nas="ssh core@192.168.178.205"

alias gs="git status"
alias gwipco='git commit --no-verify --no-gpg-sign -m '\''--wip-- [skip ci]'\'
alias glr="git pull --rebase"
alias gdc="git diff --word-diff=color"
alias gpsup="git push --set-upstream"
alias watchdiff="watch -c git diff --color=always"

alias cdiff="diff --color=always"

alias http="python -m http.server 8080"
alias ci="cargo build --all-features && cargo test --all-features && cargo clippy --all-features --profile dev -- -D warnings && cargo fmt --check"

alias films="curl -sS https://writemd.rz.tuhh.de/P_wASTksR7OdY0aVfZPBOg/download | awk '/^#/{f=0} f * NF; /## Common/{f=1}'"
alias filmrng="films | shuf -n 1"

if ifinstalled exa ; then
  alias ls="exa --git -l"
  alias la="exa --git -la"
  alias ll="exa --git -l"
fi

export FZF_DEFAULT_COMMAND="rg --files --no-ignore --hidden --follow --ignore-file ~/.ignore 2> /dev/null"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

samedir-widget() {
  samedir
}
zle -N samedir-widget
bindkey '^n' samedir-widget

function gwa()
{
  NAME="$(basename $(command git worktree list | head -n1 | cut -d' ' -f1))-$1"
  NEW_WORKTREE_PATH="$(command git worktree list | head -n1 | cut -d' ' -f1)/../$NAME"
  command git worktree add "$NEW_WORKTREE_PATH" "$(git rev-parse HEAD)"
  cd "$NEW_WORKTREE_PATH"
}
alias gwl="git worktree list"
function gwj
{
  WORKTREE="$(git worktree list | fzf | cut -d' ' -f1)"
  cd $WORKTREE
}
function gwd
{
  ORIGINAL_WORKTREE="$(git worktree list | head -n1 | cut -d' ' -f1)"
  command git worktree remove "$(pwd)"
  cd $ORIGINAL_WORKTREE
}

function mcdir
{
    command mkdir $1 && cd $1
}

function vw
{
    command nvim $(which $1)
}

function pac
{
    source ~/.venv/$1/bin/activate
}

gms () {
        trackingBranch=$1
        git merge --squash $trackingBranch
        git commit -m "squashed $trackingBranch"
}

function alert
{
    tee -p >&2 | sed '/^[[:blank:]]*$/d' | tail -"${1:-1}" | sed 's/\x1b\[[0-9;]*m//g' | xargs -I {} notify-send "${3:-Command finished}" " {}" -u ${2:-normal} -t ${4:-5000}
}

if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent > ~/.ssh-agent-thing
fi
if [[ "$SSH_AGENT_PID" == "" ]]; then
    eval "$(<~/.ssh-agent-thing)" > /dev/null
fi

export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
export PATH="$HOME/bin:/usr/lib/ccache/bin:$HOME/helperScripts:$HOME/.local/bin/:$GEM_HOME/bin:$PATH"

BASE16_SHELL=$HOME/.config/base16-shell/
BASE16_SHELL_SET_BACKGROUND=false
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

# perl
PATH="/home/mystery/.perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/mystery/.perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/mystery/.perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/mystery/.perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/mystery/.perl5"; export PERL_MM_OPT;

# export ZSH_AUTOSUGGEST_USE_ASYNC=1
