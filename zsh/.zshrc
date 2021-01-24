#zmodload zsh/zprof

### Powerlevel10k
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


### PATH #######################################################################
source ~/.env_brew

export PATH=~/.local/bin:$PATH

### pyenv setups
eval "$(pyenv init -)"
export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"
pyenv virtualenvwrapper_lazy
### PATH #######################################################################


### Antibody dynamic loading
source <(antibody init)
antibody bundle < ~/.zsh_plugins.txt

### Antibody static loading
# Run after plugin change:
# antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh
#source ~/.zsh_plugins.sh


### Control + w clears one word. Separator is '/' instead of ' '.
autoload -U select-word-style
select-word-style bash
export WORDCHARS='.-'


### This actually enables tab completion on subcommands.
### So, git pu<Tab> will suggest 'pull' and 'push'.
### Or, ls -<Tab> will suggest '-l', '-s', '-p', '-g', '-a', etc.
autoload -Uz compinit && compinit


### cd by just typing the directory's name
setopt autocd


### Emacs mode
# zdharma/history-search-multi-word broke emacs mode, so removed that plugin.
bindkey -e


### Control + [PN] finds any command beginning with the exact typed command.
bindkey "^P" up-line-or-search
bindkey "^N" down-line-or-search


### UP or DOWN searches typed command in any part of history commands.
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down


### Sets history size upto 100000
### Removes duplicates in zsh_history
### Saves command prompt output on rotating files for backkup


### Auto run `workon` when there's .workon file at `pwd`
[[ ! -f .workon ]] || workon $(cat .workon)


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

alias pi="pip install"

export EDITOR=vi

export FZF_DEFAULT_COMMAND="fd --type file   \
                               --follow      \
                               --hidden      \
                               --exclude .git"

#zprof
