source ~/.env_brew

source "$HOME/.cargo/env"

### Sources z - jump around
source $HOMEBREW_PREFIX/etc/profile.d/z.sh

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

export PATH=~/.local/bin:$PATH
#export PATH=~/Library/Python/3.8/bin:$PATH
export PATH=$PATH:$HOMEBREW_PREFIX/opt/openjdk/bin

### `pyenv install` required these
export LDFLAGS="-L$HOMEBREW_PREFIX/opt/zlib/lib -L$HOMEBREW_PREFIX/opt/bzip2/lib"
export CFLAGS="-I$HOMEBREW_PREFIX/opt/zlib/include -I$HOMEBREW_PREFIX/opt/bzip2/include"
export CPPFLAGS="-I$HOMEBREW_PREFIX/opt/zlib/include -I$HOMEBREW_PREFIX/opt/bzip2/include"
export PKG_CONFIG_PATH="$HOMEBREW_PREFIX/opt/zlib/lib/pkgconfig"
