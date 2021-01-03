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

ifeq (,$(shell which antibody))
	### Install antibody, my zsh plugin manager
	brew install antibody
endif

ifeq (,$(shell which autojump))
	### Install autojump, my shortcutter to cd with j
	brew install autojump
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
	ln -s `pwd`/neovim/init.vim ~/.config/nvim/
	ln -s `pwd`/alacritty/alacritty.yml ~/.config/alacritty/
	ln -s `pwd`/ranger/rc.conf ~/.config/ranger/
	### Initialized installation of tmux plugins
	~/.tmux/plugins/tpm/bin/install_plugins
	### Initialized installation of vim plugins
	nvim +PlugInstall +qall


clean:
	rm -rf ~/.tmux/plugins/
	rm -rf ~/.vim/plugged/
	rm -f ~/.local/share/nvim/site/autoload/plug.vim
	rm -f ~/.zshrc
	rm -f ~/.zshenv
	rm -f ~/.env_brew
	rm -f ~/.zsh_plugins.*
	rm -f ~/.p10k.zsh
	rm -f ~/.tmux.conf
	rm -f ~/.gitconfig
	rm -f ~/.config/nvim/init.vim
	rm -f ~/.config/alacritty/alacritty.yml
	rm -f ~/.config/ranger/rc.conf
