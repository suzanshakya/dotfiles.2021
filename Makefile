target:
	make zsh-setup
	make tmux-setup
	make git-setup
	make python-setup
	make neovim-setup
	make install-swiss-army


zsh-setup:
	apt install -y zsh
	ln -sf `pwd`/zsh/.zshrc ~/
	ln -sf `pwd`/zsh/.zshenv ~/
	ln -sf `pwd`/zsh/.env_brew ~/
	ln -sf `pwd`/zsh/.zsh_plugins.txt ~/
	ln -sf `pwd`/zsh/.p10k.zsh ~/

	### Install antibody, my zsh plugin manager
	curl -sfL git.io/antibody | sh -s - -b /usr/local/bin


install-swiss-army:
	### Install z - jump around
	#brew install z

	### Install ripgrep, my alternative to grep
	apt install -y ripgrep

	### Install fd, my alternative to find
	#apt install -y fd-find

	### Install fzf, my file interactor
	apt install -y fzf

	### Install ranger, my file explorer
	apt install -y ranger
	mkdir -p ~/.config/ranger/
	ln -sf `pwd`/ranger/rc.conf ~/.config/ranger/

	### Install tree, as in linux
	apt install -y tree

	### SSH config
	ln -sf `pwd`/ssh/config ~/.ssh/

	### Install git-filter-repo, my alternative to git-filter-branch
	#apt install -y git-filter-repo

	### Install git-sizer, my alternative to `du -sh .git`
	apt install -y git-sizer


git-setup:
	### Install newer version of git, my version control
	ln -sf `pwd`/git/.gitignore_global ~/
	make gitconfig

	### Install tig, my alternative to git-log
	apt install -y tig


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


tmux-setup:
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


neovim-setup:
	add-apt-repository ppa:neovim-ppa/unstable
	apt update -y
	apt install -y neovim

	### Install vim-plug, my neovim plugin manager
ifeq (,$(wildcard ~/.local/share/nvim/site/autoload/plug.vim))
	# ~/.local/share/nvim/site/autoload/plug.vim doesn't exist
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

	mkdir -p ~/.config/nvim/
	ln -sf `pwd`/neovim/init.vim ~/.config/nvim/

	pip install pynvim

	### Initialized installation of vim plugins
	nvim +PlugInstall +qall


python-setup:
	### Install pyenv, my python version manager
	git clone https://github.com/pyenv/pyenv.git ~/.pyenv

	### Install python
	apt install -y build-essential libffi-dev zlib1g-dev libbz2-dev libreadline-dev libssl-dev libsqlite3-dev
	PYENV_ROOT=~/.pyenv ~/.pyenv/bin/pyenv install 3.9.7
	PYENV_ROOT=~/.pyenv ~/.pyenv/bin/pyenv global 3.9.7

	git clone https://github.com/pyenv/pyenv-virtualenvwrapper.git ~/.pyenv/plugins/pyenv-virtualenvwrapper


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
	rm -r ~/.config/ranger/rc.conf
