# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/home/mystery/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="agnoster"
ZSH_THEME="ys"

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
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=2

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
  git
  archlinux
  colored-man-pages
  encode64
  you-should-use
  magic-enter
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi

if [ -d "$HOME/adb-fastboot" ] ; then
    export PATH="$HOME/adb-fastboot:$PATH"
fi

# Pretend to be xterm for ssh connections
export TERM="xterm"

# Enable touch scrolling in firefox
export MOZ_USE_XINPUT2=1

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

alias simrobert="optirun /home/mystery/hulks/nao/tools/SimRobot/build/SimRobot || simrobert-intel"
alias simrobert-intel="/home/mystery/hulks/nao/tools/SimRobot/build/SimRobot"
alias mate="/home/mystery/venv/hulks/bin/python /home/mystery/hulks/nao/tools/mate/run.py&!"
alias fucking="sudo"
alias please="sudo"
alias imperative="sudo"
alias setclip="xclip -selection c"
alias getclip="xclip -selection c -o"
alias v="/usr/bin/nvim"
alias p="python"
alias p2="python2"
alias r="ranger"
alias sranger="source ranger"
alias sr="sranger"
alias cm="cmatrix -a -u3"
alias venv="source venv"
alias btc="bluetoothctl"
alias resource="source ~/.zshrc"
alias fv='v $(fzf)'
alias xev='xev | grep "keycode"'
#alias alert="tee -p '$(tty)' | sed '/^[[:blank:]]*$/d' | tail -$1 | xargs -I {} notify-send 'Command finished' '{}' -t 5000"

export FZF_DEFAULT_COMMAND="rg --files --no-ignore --hidden --follow --ignore-file ~/.ignore"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

function mcdir
{
    command mkdir $1 && cd $1
}

function vw
{
    command nvim $(which $1)
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

export PATH="$HOME/bin:/usr/lib/ccache/bin:$HOME/helperScripts:$HOME/.local/bin/:$PATH"

BASE16_SHELL=$HOME/.config/base16-shell/
BASE16_SHELL_SET_BACKGROUND=false
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

# perl
PATH="/home/mystery/.perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/mystery/.perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/mystery/.perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/mystery/.perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/mystery/.perl5"; export PERL_MM_OPT;
