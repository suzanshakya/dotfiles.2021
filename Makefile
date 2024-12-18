UNAME := $(shell uname)

target:
	# brew setup
ifeq ($(UNAME), Darwin)
	[ -f /opt/homebrew/bin/brew ] || /bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
endif
	make zsh-setup
	make git-setup
	make tmux-setup
	make neovim-setup
	make dev-setup

ifeq ($(UNAME), Darwin)
	make rectangle-setup
	make alacritty-setup
endif


zsh-setup:
	ln -sf `pwd`/zsh/.env_android ~/
	ln -sf `pwd`/zsh/.env_cocos ~/
	ln -sf `pwd`/zsh/.zshrc ~/
	ln -sf `pwd`/zsh/.zsh_plugins.txt ~/
	ln -sf `pwd`/zsh/.p10k.zsh ~/

	### Install antidote, my zsh plugin manager
ifeq ($(UNAME), Darwin)
	ln -sf `pwd`/zsh/.env_brew ~/
	brew install antidote
endif
ifeq ($(UNAME), Linux)
	apt install zsh -y
	[ -d ~/.antidote ] || git clone --depth=1 https://github.com/mattmc3/antidote.git ~/.antidote
endif


dev-setup:
ifeq ($(UNAME), Darwin)
	### Install ripgrep, my alternative to grep
	brew install ripgrep

	### Install fd, my alternative to find
	brew install fd

	### Install fzf, my file interactor
	brew install fzf

	### Install ranger, my file explorer
	brew install ranger

	### Install tree, as in linux
	brew install tree

	### Install z - jump around
	brew install z
endif

ifeq ($(UNAME), Linux)
	apt install ripgrep -y
	apt install fd-find -y
	apt install fzf -y
	apt install ranger -y
	apt install tree -y
endif
	mkdir -p ~/.config/ranger/
	ln -sf `pwd`/ranger/rc.conf ~/.config/ranger/

	### SSH config
	ln -sf `pwd`/ssh/config ~/.ssh/
	mkdir -p ~/.ssh/sockets


rectangle-setup:
	brew install rectangle


git-setup:
	### Install newer version of git, my version control
	#brew install git
	ln -sf `pwd`/git/.gitignore_global ~/
	make gitconfig

	### Install tig, my alternative to git-log
ifeq ($((UNAME)), Darwin)
	brew install tig

	### Install git-filter-repo, my alternative to git-filter-branch
	brew install git-filter-repo

	### Install git-sizer, my alternative to `du -sh .git`
	brew install git-sizer
endif


gitconfig:
	### git aliases
	# ';' is required at the end for linux: https://stackoverflow.com/a/62562135/77868
	git config --global alias.s status;
	git config --global alias.st status;
	git config --global alias.ss 'status -s';
	git config --global alias.sts stash;

	git config --global alias.sw switch;
	git config --global alias.swc 'switch -c';

	git config --global alias.co checkout;
	git config --global alias.cop 'checkout -p';
	git config --global alias.cob 'checkout -b';

	git config --global alias.f fetch;
	git config --global alias.fe fetch;
	git config --global alias.fp 'fetch --prune';

	git config --global alias.b branch;
	git config --global alias.br 'branch -r';

	git config --global alias.c commit;
	git config --global alias.cm 'commit -m';
	git config --global alias.cms "commit -m 'Squash this commit to the previous commit.'";
	git config --global alias.cp cherry-pick;

	git config --global alias.d diff;
	git config --global alias.di diff;
	git config --global alias.dc 'diff --cached';

	git config --global alias.r restore;
	git config --global alias.rs 'restore --staged';
	git config --global alias.rsp 'restore --staged -p';

	git config --global alias.rb rebase;
	git config --global alias.rst reset;

	git config --global alias.pl pull;
	git config --global alias.ps push;

	git config --global alias.a add;
	git config --global alias.ap 'add -p';
	git config --global alias.au 'add -u';
	git config --global alias.m merge;

	git config --global alias.ls ls-files;

	git config --global core.excludesfile '~/.gitignore_global';
	git config --global pull.ff only;


alacritty-setup:
	brew install alacritty
	mkdir -p ~/.config/alacritty/
	ln -sf `pwd`/alacritty/alacritty.toml ~/.config/alacritty/


tmux-setup:
ifeq ($(UNAME), Linux)
	# do something Linux-y
endif
ifeq ($((UNAME)), Darwin)
	brew install tmux
endif

	tic -xe tmux-256color tmux/tmux-256color

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
ifeq ($((UNAME)), Darwin)
	brew install neovim
	brew install code-minimap
endif
ifeq ($((UNAME)), Linux)
	apt install neovim -y
endif

	### Install vim-plug, my neovim plugin manager
ifeq (,$(wildcard ~/.local/share/nvim/site/autoload/plug.vim))
	# ~/.local/share/nvim/site/autoload/plug.vim doesn't exist
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

	mkdir -p ~/.config/nvim/
	ln -sf `pwd`/neovim/init.vim ~/.config/nvim/

	#make python-setup
	PATH=~/.pyenv/shims:$$PATH && pip install pynvim

	### Initialized installation of vim plugins
	nvim +PlugInstall +qall


python-setup:
ifeq ($(UNAME), Darwin)
	### Install pyenv, my python version manager
	brew install pyenv
	brew install pyenv-virtualenvwrapper
endif
ifeq ($(UNAME), Linux)
	[ -d ~/.pyenv ] || git clone https://github.com/pyenv/pyenv.git ~/.pyenv
	[ -d ~/.pyenv/plugins/pyenv-virtualenvwrapper ] || git clone https://github.com/pyenv/pyenv-virtualenvwrapper.git ~/.pyenv/plugins/pyenv-virtualenvwrapper
endif

	### Load pyenv enviroment
	eval "$$(pyenv init -)" && \
	export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true" && \
	pyenv virtualenvwrapper_lazy

	### Install python
	#[[ -d ~/.pyenv/versions/3.13.0 ]] || pyenv install 3.13.0
	#pyenv global 3.13.0
	pip install -U pip


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
	rm -r ~/.config/alacritty/alacritty.toml
	rm -r ~/.config/ranger/rc.conf
