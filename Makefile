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
	rm -r ~/.tmux/plugins/
	rm -r ~/.vim/plugged/
	rm ~/.local/share/nvim/site/autoload/plug.vim
	rm ~/.zshrc
	rm ~/.zshenv
	rm ~/.env_brew
	rm ~/.zsh_plugins.*
	rm ~/.p10k.zsh
	rm ~/.tmux.conf
	rm ~/.gitconfig
	rm ~/.gitignore_global
	rm ~/.config/nvim/init.vim
	rm ~/.config/alacritty/alacritty.yml
	rm ~/.config/ranger/rc.conf
	rm ~/Library/Preferences/com.knollsoft.Rectangle.plist
