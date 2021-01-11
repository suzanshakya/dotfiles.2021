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

### `pyenv install` required these
export LDFLAGS="-L/usr/local/opt/zlib/lib -L/usr/local/opt/bzip2/lib"
export CPPFLAGS="-I/usr/local/opt/zlib/include -I/usr/local/opt/bzip2/include"

source ~/.env_brew

source "$HOME/.cargo/env"
