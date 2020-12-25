install:
	ln -s `pwd`/zsh/.zshrc ~/
	ln -s `pwd`/zsh/.zshenv ~/
	ln -s `pwd`/zsh/.zsh_plugins.txt ~/
	(mkdir -p ~/.config/nvim/ && \
	ln -s `pwd`/neovim/init.vim ~/.config/nvim/)
	ln -s `pwd`/tmux/.tmux.conf ~/
	(mkdir -p ~/.config/alacritty/ && \
	ln -s `pwd`/alacritty/alacritty.yml ~/.config/alacritty/)
	ln -s `pwd`/git/.gitconfig ~/

force-install:
	ln -sf `pwd`/zsh/.zshrc ~/
	ln -sf `pwd`/zsh/.zshenv ~/
	ln -sf `pwd`/zsh/.zsh_plugins.txt ~/
	(mkdir -p ~/.config/nvim/ && \
	ln -sf `pwd`/neovim/init.vim ~/.config/nvim/)
	ln -sf `pwd`/tmux/.tmux.conf ~/
	(mkdir -p ~/.config/alacritty/ && \
	ln -sf `pwd`/alacritty/alacritty.yml ~/.config/alacritty/)
	ln -sf `pwd`/git/.gitconfig ~/

remove:
	rm -f ~/.zshrc
	rm -f ~/.zshenv
	rm -f ~/.zsh_plugins.txt
	rm -f ~/.config/nvim/init.vim
	rm -f ~/.tmux.conf
	rm -f ~/.config/alacritty/alacritty.yml
	rm -f ~/.gitconfig
