call plug#begin('~/.vim/plugged')

Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

Plug 'christoomey/vim-tmux-navigator'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'jlanzarotta/bufexplorer'

Plug 'https://tpope.io/vim/fugitive.git'
Plug 'https://tpope.io/vim/unimpaired.git'

Plug 'rbgrouleff/bclose.vim'
Plug 'francoiscabrol/ranger.vim'

Plug 'vim-airline/vim-airline'

Plug 'ap/vim-buftabline'

call plug#end()

" Show line numbers
set nu

" Let mouse-drag select only text not line numbers
set mouse+=a

" reload file if changed from elsewhere
set autoread

" Control+P for FZF search
nmap <C-p> :FZF<cr>

nnoremap <C-s> :w<cr>
inoremap <C-s> <esc>:w<cr>
nnoremap <C-q> :q<cr>

let mapleader = ","
nnoremap <leader>r :source $MYVIMRC<cr>

let g:ranger_replace_netrw = 1
