alias ll='ls -Ghapl'
alias l='ls -GhAp'

alias vi='nvim'

alias g='git'

alias rg.='rg --hidden'
alias fd.='fd --hidden --exclude .git'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias godot='/Applications/Godot.app/Contents/MacOS/Godot'

alias pv='echo -n "which python      : " && which python
          echo -n "python --version  : " && python --version
          echo -n "which pip         : " && which pip
          echo -n "pip --version     : " && pip --version
          echo -n "which ipython     : " && which ipython
          echo -n "ipython --version : " && ipython --version'


export EDITOR=vi

export FZF_DEFAULT_COMMAND="fd \
       --type file             \
       --follow                \
       --hidden                \
       --exclude .git"

export PATH=/opt/homebrew/bin:$PATH
