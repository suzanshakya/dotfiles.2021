""" List of vim plugins plugged by vim-plug
call plug#begin('~/.vim/plugged')

Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

Plug 'christoomey/vim-tmux-navigator'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'https://tpope.io/vim/fugitive.git'
Plug 'https://tpope.io/vim/unimpaired.git'

Plug 'rbgrouleff/bclose.vim'
Plug 'francoiscabrol/ranger.vim'

Plug 'vim-airline/vim-airline'

Plug 'ap/vim-buftabline'

Plug 'wilon/vim-auto-session'

call plug#end()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""" Show line numbers
set nu


""" Let mouse-drag select only text not line numbers
set mouse+=a


""" reload file if changed from elsewhere (seems not working!)
set autoread


""" Control+P for FZF search
nmap <C-p> :FZF<cr>


""" C-s to save in vi. Alacritty will convert Command-s to C-s.
nnoremap <C-s> :w<cr>
inoremap <C-s> <esc>:w<cr>


""" C-q to quit in vi.
nnoremap <C-q> :q<cr>


""" Elect , to be a leader
let mapleader = ","


""" Reloads vi with ,r
nnoremap <leader>r :source $MYVIMRC<cr>


""" Replaces netrw with ranger
let g:ranger_replace_netrw = 1


""" Upon saving a file, this code saves current buffer state so that
""" next vi will restore current buffers
autocmd BufWritePost * call session#MakeSession()


""" Preserves undo history upon writing and changing buffer.
set hidden
