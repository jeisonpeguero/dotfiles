PROMPT_COMMAND='history -a'

export STARSHIP_CONFIG=~/.dotfiles/.starship/config.toml
export STARSHIP_CACHE=~/.starship/cache

eval "$(starship init bash)"
