PROMPT_COMMAND='history -a'

# eval export POSH_THEME="/c/Users/jeison/.dotfiles/oh-my-posh/themes/personal.omp.json"
# eval "$(/c/Users/jeison/AppData/Local/Programs/oh-my-posh/bin/oh-my-posh.exe init bash)"

# _dotnet_bash_complete()
# {
#   local word=${COMP_WORDS[COMP_CWORD]}

#   local completions
#   completions="$(dotnet complete --position "${COMP_POINT}" "${COMP_LINE}" 2>/dev/null)"
#   if [ $? -ne 0 ]; then
#     completions=""
#   fi

#   COMPREPLY=( $(compgen -W "$completions" -- "$word") )
# }

# _ssh()
# {
#     local cur prev opts
#     COMPREPLY=()
#     cur="${COMP_WORDS[COMP_CWORD]}"
#     prev="${COMP_WORDS[COMP_CWORD-1]}"
#     opts=$(grep '^Host' ~/.ssh/config ~/.ssh/config.d/* 2>/dev/null | grep -v '[?*]' | cut -d ' ' -f 2-)

#     COMPREPLY=( $(compgen -W "$opts" -- ${cur}) )
#     return 0
# }

# # Load Angular CLI autocompletion.
# # source <(ng completion script)

# complete -F _ssh ssh
# complete -f -F _dotnet_bash_complete dotnet

alias cdcode="cd /d/Code"
alias db-services="docker compose -p db-services -f /d/Code/docker/db-services.yml"
alias cut-silence="auto-editor.exe --margin 0.3sec --export resolve"

export STARSHIP_CONFIG=~/.dotfiles/.starship/config.toml
export STARSHIP_CACHE=~/.starship/cache

eval "$(starship init bash)"
