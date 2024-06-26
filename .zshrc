# Path to your oh-my-zsh installation.
export ZSH=/home/mystery/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="agnoster"
# ZSH_THEME="rkj-repos-modified"
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
HISTSIZE=500000
SAVEHIST=500000
setopt appendhistory
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  archlinux
  colored-man-pages
  docker
  docker-compose
  fzf
  git
  grc
  pip
  rust
  sudo
  systemd
  you-should-use
  zbell
  zsh-autosuggestions
  fast-syntax-highlighting
)

# make sure no plugin fucks with my PATH
OLDPATH=$PATH
source $ZSH/oh-my-zsh.sh
export PATH=$OLDPATH

# Plugin configuration

## ZSH autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#888888"
bindkey '^j' autosuggest-execute
bindkey '^h' autosuggest-accept

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
export EDITOR="nvim"

# Pretend to be xterm for ssh connections
export TERM="xterm-256color"

# Disable F13 inserting garbage characters
bindkey -s "\e[25~" ""

export GTK_THEME=Adwaita:dark

alias gib="xclip -selection c"
alias take="xclip -selection c -o"
alias cr="cargo run"
alias ct="cargo test"
alias cl="cargo clippy"
alias v="/usr/bin/nvim"
alias p="python"
alias r="ranger"
alias c="cargo"
alias sr="source ranger"
alias cm="cmatrix -a -u3"
alias btc="bluetoothctl"
alias rs="source ~/.zshrc"
alias fv='v $(fzf)'
alias xev='xev | grep "keycode"'
alias wtf='journalctl -r'
alias samedir='(cd $(pwd); $TERMINAL)  >/dev/null 2>&1 &!'
alias suspend='systemctl suspend'
alias zconf="nvim ~/.zshrc"
alias aconf="nvim ~/.config/awesome/rc.lua"
alias atconf="nvim ~/.config/awesome/themes/hulks-dark/theme.lua"
alias vconf="(cd ~/.config/nvim; nvim ~/.config/nvim/init.lua)"
alias hx="helix"
# ssh
alias rechenknecht="ssh -X knoellle@10.2.24.6"
alias pi="ssh pi@raspberrypi"
alias vps="ssh mystery@193.30.120.235 -p 51337"
alias nas="ssh core@192.168.178.205"

alias gwipco='git commit --no-verify --no-gpg-sign -m '\''--wip-- [skip ci]'\'
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
  CURRENT_WORKTREE_PATH="$(git rev-parse --show-toplevel)"
  BASE_WORKTREE_PATH="$(command git worktree list | head -n1 | cut -d' ' -f1)"
  NEW_WORKTREE_PATH="$CURRENT_WORKTREE_PATH/../$NAME"
  echo $NAME
  echo $CURRENT_WORKTREE_PATH
  echo $NEW_WORKTREE_PATH
  command git worktree add "$NEW_WORKTREE_PATH" "$(git rev-parse HEAD)"
  cd "$NEW_WORKTREE_PATH"
  
  case $3 in
    current)
      TARGET_SOURCE="$CURRENT_WORKTREE_PATH/target"
      ;;
    main)
      TARGET_SOURCE="$BASE_WORKTREE_PATH/target"
      ;;
  esac
  case $2 in
    share)
      echo "Sharing target folder: $(du -sh "$CURRENT_WORKTREE_PATH/target")"
      ln -sT "$TARGET_SOURCE" "$NEW_WORKTREE_PATH/target"
      ;;

    clone)
      echo "Cloning target folder: $(du -sh "$CURRENT_WORKTREE_PATH/target")"
      rsync -a --info=progress2 --no-inc-recursive "$TARGET_SOURCE" "$NEW_WORKTREE_PATH"
      ;;
  esac
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
  command git worktree remove "$(pwd)" && cd $ORIGINAL_WORKTREE
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

function vpn
{
    sudo wg-quick $1 nas-home
}

unalias gms
gms () {
        trackingBranch=$1
        git merge --squash $trackingBranch
        git commit -m "squashed $trackingBranch"
}

function alert
{
    tee -p >&2 | sed '/^[[:blank:]]*$/d' | tail -"${1:-1}" | sed 's/\x1b\[[0-9;]*m//g' | xargs -I {} notify-send "${3:-Command finished}" " {}" -u ${2:-normal} -t ${4:-5000}
}

function fix-routes
{
  ssh nao@10.1.24.$1 -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null "sudo ip r add 10.2.0.0/16 dev enp4s0 via 10.1.24.1"
}

if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent > ~/.ssh-agent-thing
fi
if [[ "$SSH_AGENT_PID" == "" ]]; then
    eval "$(<~/.ssh-agent-thing)" > /dev/null
fi

BASE16_SHELL=$HOME/.config/base16-shell/
BASE16_SHELL_SET_BACKGROUND=false
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

export ZSH_AUTOSUGGEST_USE_ASYNC=1

eval "$(luarocks path)"
eval "$(direnv hook zsh)"
eval "$(starship init zsh)"
