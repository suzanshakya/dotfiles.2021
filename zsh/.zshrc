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


[[ -f ~/.env_brew ]] && source ~/.env_brew
source $HOMEBREW_PREFIX/opt/antidote/share/antidote/antidote.zsh

# ${ZDOTDIR:-~}/.zshrc

# Set the root name of the plugins files (.txt and .zsh) antidote will use.
zsh_plugins=${ZDOTDIR:-~}/.zsh_plugins

# Ensure the .zsh_plugins.txt file exists so you can add plugins.
[[ -f ${zsh_plugins}.txt ]] || touch ${zsh_plugins}.txt

# Lazy-load antidote from its functions directory.
fpath=(/path/to/antidote/functions $fpath)
autoload -Uz antidote

# Generate a new static file whenever .zsh_plugins.txt is updated.
if [[ ! ${zsh_plugins}.zsh -nt ${zsh_plugins}.txt ]]; then
  antidote bundle <${zsh_plugins}.txt >|${zsh_plugins}.zsh
fi

# Source your static plugins file.
source ${zsh_plugins}.zsh



# Sources z - jump around
[[ ! -f $HOMEBREW_PREFIX/etc/profile.d/z.sh ]] || source $HOMEBREW_PREFIX/etc/profile.d/z.sh


#### pyenv setups
eval "$(pyenv init -)"
pyenv virtualenvwrapper_lazy


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


### Aliases
alias ll='ls -Gapl'
alias lh='ls -Ghapl'
alias l='ls -GhAp'

alias rg.='rg -u'
alias rg..='rg -uu'
alias rg...='rg -uuu'

alias fd.='fd -u'
alias fd..='fd -uu'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias g='git'

alias godot='/Applications/Godot.app/Contents/MacOS/Godot'

alias c='clear'


# Uncomment this if Alacritty is installed at /Applications
#alias alacritty='/Applications/Alacritty.app/Contents/MacOS/alacritty'

alias pv='echo -n "which python      : " && which python
          echo -n "python --version  : " && python --version
          echo -n "which pip         : " && which pip
          echo -n "pip --version     : " && pip --version
          echo -n "which ipython     : " && which ipython
          echo -n "ipython --version : " && ipython --version'

alias pi="pip install"
alias ta="tmux attach -t localhost || tmux new -t localhost"

alias vi=nvim
export VISUAL=nvim
export EDITOR=nvim


### `vip os` will open python os module with vi
function vip() {
	module="$1"
	if [[ "$module" ]] ; then
		module_path=$(python -c"import $module; print($module.__file__)" 2>/dev/null)
		if [[ -f "$module_path" ]] ; then
			echo vi $module_path
			vi "$module_path"
		else
                        VENV=$(basename "$VIRTUAL_ENV")
			if [[ "$VENV" ]] ; then
			else
				VENV=$(pyenv version)
			fi
			echo \"$module\" not found in \"$VENV\"
		fi
	fi
}


### Auto run `workon` when there's a .workon file in current or any parent dirs
#   And deactivates when there's no .workon file in current or all parent dirs
function cd() {
	# save previous pwd because we need it later below
	prev_pwd="$(pwd)"

	builtin cd "$@" || return

	# save pwd because we need it later below
	pwd="$(pwd)"

	# remove prev_pwd from PATH
	# ??? if prev_pwd contains /scripts/
	PATH=:$PATH:
	PATH=${PATH//:$prev_pwd:/:}
	PATH=${PATH#:}; PATH=${PATH%:}

	# add pwd to PATH
	# ??? if pwd contains /scripts/
	PATH=$pwd:$PATH

	# now export updated PATH
	export PATH

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
# Activate above function now!
cd . >/dev/null


[[ -f ~/.env_android ]] && source ~/.env_android
[[ -f ~/.env_cocos ]] && source ~/.env_cocos


export PATH=~/.local/bin:$PATH
export FZF_DEFAULT_COMMAND="fd --type file   \
                               --follow      \
                               --hidden      \
                               --exclude .git"

export HIGHLIGHT_STYLE=solarized-light
#export PYTHONSTARTUP=~/.pythonrc

#zprof
