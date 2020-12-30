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


""" Preserves undo history upon writing and changing buffer.
""" This has no effect on history between sessions.
set hidden


""" NOT_TESTED, TODO:smartcase
set ignorecase


""" NOT_TESTED, TODO:smartcase
"set notimeout


""" Elect , to be a leader
let mapleader = ";"


""" Show hidden files in ranger
let g:ranger_map_keys = 0
let g:ranger_command_override = 'ranger --cmd "set show_hidden=true"'
let g:ranger_replace_netrw = 1


""" Reloads vi with ;R
""" R is consistent with tmux also, where C-b R is used for reloading config
nnoremap <leader>R :source $MYVIMRC<cr>


""" Open ranger with ;rn
map <leader>rn :Ranger<cr>


""" FZF search with ;ff
nnoremap <leader>ff :Files<cr>


""" Buffer search with ;bb
nnoremap <leader>bb :Buffers<cr>


""" Rg search with ;rg
nnoremap <leader>rg :Rg<cr>


""" Delete current buffer with ;bd
nnoremap <leader>bd :bd<cr>
nnoremap <leader>bD :bd!<cr>


""" C-s to save in vi. Alacritty will convert Command-s to C-s.
nnoremap <C-s> :w<cr>
inoremap <C-s> <esc>:w<cr>


""" C-q to quit in vi.
nnoremap <C-q> :q<cr>


""" Upon saving a file, this code saves current buffer state so that
""" next vi will restore current buffers.
""" Note: Default behavior in vim-auto-session was to also autosave session
""" upon quitting, that feature is disabled in their source code.
autocmd BufWritePost * call session#MakeSession()
