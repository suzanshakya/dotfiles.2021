SHELL := /bin/zsh

target:
	make install-zsh
	make install-rectangle
	make install-git


hacker-env:
	make install-alacritty
	make install-tmux
	make install-neovim
	make install-python


install-zsh:
	brew install zsh
	ln -sf `pwd`/zsh/.zshrc ~/
	ln -sf `pwd`/zsh/.zshenv ~/
	ln -sf `pwd`/zsh/.env_brew ~/
	ln -sf `pwd`/zsh/.zsh_plugins.txt ~/
	ln -sf `pwd`/zsh/.p10k.zsh ~/

	### Install antibody, my zsh plugin manager
	brew install antibody

	### Install z - jump around
	brew install z

	### Install ripgrep, my alternative to grep
	brew install ripgrep

	### Install fd, my alternative to find
	brew install fd

	### Install fzf, my file interactor
	brew install fzf

	### Install ranger, my file explorer
	brew install ranger
	mkdir -p ~/.config/ranger/
	ln -sf `pwd`/ranger/rc.conf ~/.config/ranger/

	### Install tree, as in linux
	brew install tree


install-rectangle:
	brew install rectangle
	ln -sf `pwd`/rectangle/com.knollsoft.Rectangle.plist ~/Library/Preferences/


install-git:
	### Install newer version of git, my version control
	brew install git
	ln -sf `pwd`/git/.gitignore_global ~/
	make gitconfig

	### Install tig, my alternative to git-log
	brew install tig

	### Install git-filter-repo, my alternative to git-filter-branch
	brew install git-filter-repo

	### Install git-sizer, my alternative to `du -sh .git`
	brew install git-sizer


gitconfig:
	### git aliases
	git config --global alias.s status
	git config --global alias.st status
	git config --global alias.co checkout
	git config --global alias.ap 'add -p'
	git config --global alias.f fetch
	git config --global alias.fe fetch
	git config --global alias.b branch
	git config --global alias.br 'branch -r'
	git config --global alias.cm 'commit -m'
	git config --global alias.d diff
	git config --global alias.di diff
	git config --global alias.dc 'diff --cached'
	git config --global alias.cop 'checkout -p'
	git config --global alias.pl pull
	git config --global alias.ps push
	git config --global alias.reba rebase
	git config --global alias.rese reset
	git config --global alias.rest restore
	git config --global alias.m merge
	git config --global alias.a add
	git config --global alias.ls ls-files

	git config --global core.excludesfile '~/.gitignore_global'
	git config --global pull.ff only


install-alacritty:
	brew install alacritty
	mkdir -p ~/.config/alacritty/
	ln -sf `pwd`/alacritty/alacritty.yml ~/.config/alacritty/


install-tmux:
	brew install tmux

	### Install tpm, my tmux plugin manager
ifeq (,$(wildcard ~/.tmux/plugins/tpm))
	# ~/.tmux/plugins/tpm doesn't exist
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
else
	cd ~/.tmux/plugins/tpm && git reset --hard HEAD
endif

	ln -sf `pwd`/tmux/.tmux.conf ~/
	### Initialized installation of tmux plugins
	~/.tmux/plugins/tpm/bin/install_plugins


install-neovim:
	brew install neovim

	### Install vim-plug, my neovim plugin manager
ifeq (,$(wildcard ~/.local/share/nvim/site/autoload/plug.vim))
	# ~/.local/share/nvim/site/autoload/plug.vim doesn't exist
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

	mkdir -p ~/.config/nvim/
	ln -sf `pwd`/neovim/init.vim ~/.config/nvim/

	make install-python
	pip install pynvim

	### Initialized installation of vim plugins
	nvim +PlugInstall +qall


install-python:
	### Install pyenv, my python version manager
	brew install pyenv
	brew install pyenv-virtualenvwrapper

	### Load pyenv enviroment
	eval "$$(pyenv init -)" && \
	export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true" && \
	pyenv virtualenvwrapper_lazy

	### Install python
	pyenv install 3.9.1
	pyenv global 3.9.1


misc:
	### Install nginx, my web server
	brew install nginx

	### Install node, my js console
	brew install node

	### Install openjdk, my java
	brew install openjdk

	### Install gh, my github cli
	brew install gh

	### Install bat, my alternative to cat
	brew install bat


clean:
	rm -rf ~/.tmux/plugins/
	rm -rf ~/.vim/plugged/
	rm -r ~/.local/share/nvim/site/autoload/plug.vim
	rm -r ~/.zshrc
	rm -r ~/.zshenv
	rm -r ~/.env_brew
	rm -r ~/.zsh_plugins.*
	rm -r ~/.p10k.zsh
	rm -r ~/.tmux.conf
	rm -r ~/.gitignore_global
	rm -r ~/.config/nvim/init.vim
	rm -r ~/.config/alacritty/alacritty.yml
	rm -r ~/.config/ranger/rc.conf
	rm -r ~/Library/Preferences/com.knollsoft.Rectangle.plist
