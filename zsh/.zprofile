[[ -f ~/.env_brew ]] && source ~/.env_brew
[[ -f ~/.env_android ]] && source ~/.env_android
[[ -f ~/.env_cocos ]] && source ~/.env_cocos


export PATH="$(pyenv root)/shims:$PATH"
export PATH=~/.local/bin:$PATH
export PATH=$PATH:~/projects/teslatech/callbreakserver/scripts/docker

#export PATH=/Library/PostgreSQL/13/bin:$PATH


export EDITOR=vi

export FZF_DEFAULT_COMMAND="fd --type file   \
                               --follow      \
                               --hidden      \
                               --exclude .git"

export HIGHLIGHT_STYLE=solarized-light
#export PYTHONSTARTUP=~/.pythonrc
