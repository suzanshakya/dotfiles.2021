[[ -f ~/.env_brew ]] && source ~/.env_brew
[[ -f ~/.env_android ]] && source ~/.env_android
[[ -f ~/.env_cocos ]] && source ~/.env_cocos


export PATH=~/.local/bin:$PATH

#export PATH=/Library/PostgreSQL/13/bin:$PATH

export PATH="$(pyenv root)/shims:$PATH"

export EDITOR=vi

export FZF_DEFAULT_COMMAND="fd --type file   \
                               --follow      \
                               --hidden      \
                               --exclude .git"

export HIGHLIGHT_STYLE=solarized-light
