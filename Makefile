target:
	### Install my development tools

ifeq (,$(shell which alacritty))
	brew install alacritty
endif

ifeq (,$(shell which tmux))
	brew install tmux
endif

ifeq (,$(shell which nvim))
	brew install neovim
endif

ifeq (,$(shell ls /Applications/Rectangle.app))
	brew install rectangle
endif

ifeq (,$(shell which antibody))
	### Install antibody, my zsh plugin manager
	brew install antibody
endif

ifeq (,$(shell which z))
	### Install z - jump around
	brew install z
endif

ifeq (,$(shell which bat))
	### Install bat, my
	brew install bat
endif

ifeq (,$(shell which fd))
	### Install fd, my
	brew install fd
endif

ifeq (,$(shell which fzf))
	### Install fzf, my
	brew install fzf
endif

ifeq (,$(shell which gh))
	### Install gh, my
	brew install gh
endif

### Install newer version of git
ifeq (,$(shell which git))
	### Install git, my
	brew install git
endif

ifeq (,$(shell which git-filter-repo))
	### Install git-filter-repo, my
	brew install git-filter-repo
endif

ifeq (,$(shell which git-sizer))
	### Install git-sizer, my
	brew install git-sizer
endif

ifeq (,$(shell which nginx))
	### Install nginx, my
	brew install nginx
endif

ifeq (,$(shell which node))
	### Install node, my
	brew install node
endif

ifeq (,$(shell which openjdk))
	### Install openjdk, my
	brew install openjdk
endif

ifeq (,$(shell which pyenv))
	### Install pyenv, my
	brew install pyenv
endif

ifeq (,$(shell which ranger))
	### Install ranger, my
	brew install ranger
endif

ifeq (,$(shell which ripgrep))
	### Install ripgrep, my
	brew install ripgrep
endif

ifeq (,$(shell which tree))
	### Install tree, my
	brew install tree
endif

ifeq (,$(shell which tig))
	### Install tig, my
	brew install tig
endif

#ifeq (,$(shell which ))
#	### Install , my
#	brew install
#endif
#

	### Install glances
	/usr/bin/python3 -m pip install glances
	/usr/bin/python3 -m pip install bottle

	### Install tpm, my tmux plugin manager
ifeq (,$(wildcard ~/.tmux/plugins/tpm))
	# ~/.tmux/plugins/tpm doesn't exist
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
else
	# ~/.tmux/plugins/tpm exists
	cd ~/.tmux/plugins/tpm && git reset --hard HEAD
endif

	### Install vim-plug, my neovim plugin manager
ifeq (,$(wildcard ~/.local/share/nvim/site/autoload/plug.vim))
	# ~/.local/share/nvim/site/autoload/plug.vim doesn't exist
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
else
	# ~/.local/share/nvim/site/autoload/plug.vim exists
endif

	mkdir -p ~/.config/nvim/
	mkdir -p ~/.config/alacritty/
	mkdir -p ~/.config/ranger/


install:
	ln -s `pwd`/zsh/.zshrc ~/
	ln -s `pwd`/zsh/.zshenv ~/
	ln -s `pwd`/zsh/.env_brew ~/
	ln -s `pwd`/zsh/.zsh_plugins.txt ~/
	ln -s `pwd`/zsh/.p10k.zsh ~/
	ln -s `pwd`/tmux/.tmux.conf ~/
	ln -s `pwd`/git/.gitconfig ~/
	ln -s `pwd`/git/.gitignore_global ~/
	ln -s `pwd`/neovim/init.vim ~/.config/nvim/
	ln -s `pwd`/alacritty/alacritty.yml ~/.config/alacritty/
	ln -s `pwd`/ranger/rc.conf ~/.config/ranger/
	ln -s `pwd`/rectangle/com.knollsoft.Rectangle.plist ~/Library/Preferences/
	### Initialized installation of tmux plugins
	~/.tmux/plugins/tpm/bin/install_plugins
	### Initialized installation of vim plugins
	nvim +PlugInstall +qall


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
	rm -r ~/.gitconfig
	rm -r ~/.gitignore_global
	rm -r ~/.config/nvim/init.vim
	rm -r ~/.config/alacritty/alacritty.yml
	rm -r ~/.config/ranger/rc.conf
	rm -r ~/Library/Preferences/com.knollsoft.Rectangle.plist
