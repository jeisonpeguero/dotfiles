# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes

ZSH_THEME="robbyrussell-custom"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    zsh-syntax-highlighting
    zsh-autosuggestions
    fzf-tab
    fzf
    git
    dotnet
    docker
    deno
    golang
    node
    npm
    vscode
    ng
    brew
)

(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none
FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border --tabstop=4'

source $ZSH/oh-my-zsh.sh

# User configuration
export PATH="$PATH:/opt/homebrew/bin:$HOME/.dotnet/tools:$HOME/.config/composer/vendor/bin"

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#alias startdocker="sudo update-alternatives --set iptables /usr/sbin/iptables-legacy && sudo update-alternatives --set ip6tables /usr/sbin/ip6tables-legacy && sudo service docker start"
# alias startdocker="sudo service docker start"
# alias stopdocker="sudo service docker stop"
# alias statusdocker="sudo service docker status"
# alias startapache="sudo service apache2 start"
# alias stopapache="sudo service apache2 stop"
alias cat="bat"
alias ls='lsd --group-dirs=first'
alias l='ls -l --group-dirs=first'
alias ll='ls -l --group-dirs=first'
alias la='ls -a --group-dirs=first'
alias lla='ls -la --group-dirs=first'
alias lt='ls --tree --group-dirs=first'

alias generate_hash="openssl rand -base64"
alias generate_hash_256="openssl rand -base64 256"
alias generate_hash_512="openssl rand -base64 512"

alias ovftool="/Applications/VMware\ Fusion.app/Contents/Library/VMware\ OVF\ Tool/ovftool"

alias autoeditor="auto-editor --margin 0.3sec --export resolve"

alias brew_upgrade_all="brew upgrade && brew upgrade --greedy"

#BAT CONFIG
#https://github.com/sharkdp/bat/releases

export BAT_CONFIG_PATH="$HOME/.bat.conf"

#GOLANG
export GOPATH="$HOME/.go"

#NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#DART AND FLUTTER
export PATH="$HOME/Code/devtools/android_sdk/cmdline-tools/bin:$PATH"
export PATH="$HOME/Code/devtools/android_sdk/emulator:$PATH"
export PATH="$HOME/Code/devtools/flutter/bin:$PATH"
export PATH=$HOME/.gem/bin:$PATH


# Load Angular CLI autocompletion.
if command -v ng 2>&1 >/dev/null
then
  source <(ng completion script)
fi

# Created by `pipx` on 2024-07-03 15:22:50
export PATH="$PATH:/Users/jeison/.local/bin"

export PATH="$PATH":"$HOME/.pub-cache/bin"

# source /opt/homebrew/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh
# zstyle ':autocomplete:*' default-context history-incremental-search-backward
