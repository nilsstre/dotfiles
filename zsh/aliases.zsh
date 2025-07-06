#!/usr/bin/env zsh

alias lg="lazygit"

alias gb='git branch | grep -v "^\*" | fzf --height=20% --reverse --info=inline | xargs git checkout'

alias docker-clean='docker ps -aq | xargs docker stop | xargs docker rm'

alias git-clean='git fetch origin --prune'

alias he='history 1 | sort -rn | fzf |  sed -E "s/^[[:space:]]*[[:digit:]]+[[:space:]]+//" | /bin/zsh'

alias zr='source ~/.zshrc'

alias tmuxr='tmux source $XDG_CONFIG_HOME/tmux/tmux.conf' 
alias tkill="tmux kill-session -t"
alias tkills="tmux kill-server"

alias c='clear'

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~"

alias mkdir="mkdir -p"

alias vimdiff="nvim -d"

