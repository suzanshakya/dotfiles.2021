alias ll='ls -lapG'
alias lh='ll -h'
alias l='lh'

alias vi='nvim'

alias g='git'

export EDITOR=nvim
export FZF_DEFAULT_COMMAND='fd --type file --follow --hidden --exclude .git'

source ~/.env_brew
source "$HOME/.cargo/env"
