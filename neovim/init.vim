call plug#begin('~/.vim/plugged')

Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

Plug 'christoomey/vim-tmux-navigator'

call plug#end()


nmap <C-p> :FZF<cr>
