alias ll='ls -lapG'
alias lh='ll -h'
alias l='lh'

alias vi='nvim'

alias g='git'

alias rg.='rg --hidden'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

export EDITOR=nvim
export FZF_DEFAULT_COMMAND="fd \
       --type file             \
       --follow                \
       --hidden                \
       --exclude .git"
export PATH=~/bin:$PATH

source ~/.env_brew
source "$HOME/.cargo/env"
