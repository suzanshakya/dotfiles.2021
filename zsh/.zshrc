### Powerlevel10k
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


### Antibody dynamic loading
source <(antibody init)
antibody bundle < ~/.zsh_plugins.txt


### Antibody static loading
# Run after plugin change:
# antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh
#source ~/.zsh_plugins.sh


### Autojump with j
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh


### Emacs mode; it was already working before, not sure how it broked.
# set emacs mode explicitly anyway
bindkey -e


### Control + [PN] for searching matched commands
bindkey "^P" up-line-or-search
bindkey "^N" down-line-or-search
