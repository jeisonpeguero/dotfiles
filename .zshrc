# User configuration
export PATH="$PATH:/opt/homebrew/bin:$HOME/.dotnet/tools:$HOME/.config/composer/vendor/bin"

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

export BAT_CONFIG_PATH="$HOME/.bat.conf"

#GOLANG
export GOPATH="$HOME/.go"

#NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

#DART AND FLUTTER
export PATH="$HOME/Code/devtools/android_sdk/cmdline-tools/bin:$PATH"
export PATH="$HOME/Code/devtools/android_sdk/emulator:$PATH"
export PATH="$HOME/Code/devtools/flutter/bin:$PATH"
export PATH=$HOME/.gem/bin:$PATH

# Load Angular CLI autocompletion.
if command -v ng 2>&1 >/dev/null; then
  source <(ng completion script)
fi

# Created by `pipx` on 2024-07-03 15:22:50
export PATH="$PATH:/Users/jeison/.local/bin"

export PATH="$PATH":"$HOME/.pub-cache/bin"

# Starship Config
export STARSHIP_CONFIG=~/.dotfiles/.starship/config.toml
export STARSHIP_CACHE=~/.starship/cache

eval "$(starship init zsh)"

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
