call plug#begin('~/.vim/plugged')

Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

Plug 'christoomey/vim-tmux-navigator'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" Control+P for FZF search
nmap <C-p> :FZF<cr>

" Show line numbers
set nu

" Let mouse-drag select only text not line numbers
set mouse+=a
