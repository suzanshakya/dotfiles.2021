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

Plug 'pbrisbin/vim-mkdir'

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


""" Search using smartcase. Both are needed for normal behavior!
set ignorecase
set smartcase


""" Automatically save undo history between sessions.
set undofile


""" set a directory to store the undo history
set undodir=~/.vim/undo/


""" Elect ; to be a leader
let mapleader = ";"


""" Removes ranger default key-binding of ;f to ;rr.
""" btw, ;ff is used for :Files [== :FZF]
let g:ranger_map_keys = 0


""" Show hidden files in ranger
""" Deprecating in favor of system wide ~/.config/ranger/rc.conf'
"let g:ranger_command_override = 'ranger --cmd "set show_hidden=true"'


""" Reloads vi with ;R
""" R is consistent with tmux also, where C-b R is used for reloading config
nnoremap <leader>R :source $MYVIMRC<cr>
nnoremap <leader>RR :source $MYVIMRC<cr>


""" Open ranger with ;r
nnoremap <leader>r :Ranger<cr>

""" Buffer search with ;b
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>bb :Buffers<cr>

""" Search in Git files with ;g
nnoremap <leader>g :GFiles<cr>

""" FZF files search with ;f
nnoremap <leader>f :Files<cr>

""" Rg search with ;Rg
nnoremap <leader>Rg :Rg<cr>

""" ;hh for searching file history
nnoremap <leader>hh :History<cr>

""" ;hh for searching vim command history
nnoremap <leader>h; :History:<cr>

""" ;hh for searching find history
nnoremap <leader>h/ :History/<cr>


""" Delete current buffer with ;bd
nnoremap <leader>bd :bd<cr>
nnoremap <leader>bD :bd!<cr>

""" Goto last buffer
nnoremap <leader>bl :b#<cr>


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
