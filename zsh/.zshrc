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


alias ll='ls -Ghapl'
alias l='ls -GhAp'

alias vi='nvim'

alias g='git'

alias rg.='rg -u'
alias rg..='rg -uu'
alias rg...='rg -uuu'

alias fd.='fd -u'
alias fd..='fd -uu'

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


### Auto run `workon` when there's a .workon file in current or any parent dirs
#   And deactivates when there's no .workon file in current or all parent dirs
function cd() {
	builtin cd "$@" || return

	# save pwd because we need it later below
	pwd="$(pwd)"
	workon_file_check_at="$pwd"

	# echo $workon_file_check_at

	check_upto="/"
	current_virtualenv=$(basename "$VIRTUAL_ENV")

	while [[ $workon_file_check_at != $check_upto ]] ; do

		# echo "checking at $workon_file_check_at"

		workon_file=$workon_file_check_at/.workon

		if [[ -f $workon_file ]] ; then
			workon_project=$(cat $workon_file)

			if [[ $workon_project == $current_virtualenv ]] ; then
				# echo "already working on $workon_project"
				return
			fi

			echo "workon $workon_project (set by $workon_file)"
			workon $workon_project

			# workon changes the dir to one set by setvirtualenvproject
			# so go again to the previously saved pwd
			builtin cd $pwd
			return
		fi

		workon_file_check_at=$(dirname $workon_file_check_at)
	done

	# No .workon file found at any of the ancestors, deactivates if working on
	if [[ "$VIRTUAL_ENV" ]] ; then
		echo "deactivating $current_virtualenv"
		deactivate
	fi
}
cd . >/dev/null


#zprof
