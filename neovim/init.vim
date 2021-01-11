""" List of vim plugins plugged by vim-plug
call plug#begin('~/.vim/plugged')

""" Easy file navigation with fzf
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

""" Easy navigation to tmux pane with C-[hjkl]
Plug 'christoomey/vim-tmux-navigator'

""" Distracting free coding
Plug 'junegunn/goyo.vim'

""" Smooth scrolling
Plug 'psliwka/vim-smoothie'

""" Makes git command available from vim console
Plug 'https://tpope.io/vim/fugitive.git'

""" Shows git modifications inline
Plug 'airblade/vim-gitgutter'

""" Used mainly for buffer switching
Plug 'https://tpope.io/vim/unimpaired.git'

""" Opens ranger gui
Plug 'rbgrouleff/bclose.vim'
Plug 'francoiscabrol/ranger.vim'

""" Show various info on statusbar
Plug 'vim-airline/vim-airline'

""" Shows open buffer as tab in tabline
Plug 'ap/vim-buftabline'

""" Automatically save vim session
""" saves vim-session on VimLeave and loads session on VimEnter
Plug 'wilon/vim-auto-session'

""" Automatically mkdir when saving buffer
Plug 'pbrisbin/vim-mkdir'

""" Godot syntax and runner
Plug 'habamax/vim-godot'

""" Autocompletion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-jedi'
let g:deoplete#enable_at_startup = 1
let g:python3_host_prog = '~/.pyenv/versions/3.9.0/bin/python'

""" Scrolls through deoplete completion suggestion words
inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ deoplete#manual_complete()
        function! s:check_back_space() abort "{{{
        let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~ '\s'
        endfunction"}}}

inoremap <silent><expr> <S-TAB>
        \ pumvisible() ? "\<C-p>" : "\<TAB>"

call plug#end()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""" Show line numbers
set nu


""" Let mouse-drag select only text not line numbers
set mouse+=a


""" reload file if changed from elsewhere (TODO test if working)
set autoread


""" Preserves undo history upon writing and changing buffer.
""" This has no effect on history between sessions.
set hidden


""" Search using smartcase. Both are needed for normal behavior!
set ignorecase
set smartcase


""" Confirm whether to save when deleting or quitting a changed buffer
set confirm


""" Automatically save undo history between sessions.
set undofile


""" set a directory to store the undo history
set undodir=~/.vim/undo/


""" Elect ; to be a leader
let mapleader = ";"


""" Removes ranger default key-binding of ;f.
""" btw, ;r is used for ranger and ;f for :Files [== :FZF]
let g:ranger_map_keys = 0


""" Defines godot executable. now working though!
let g:godot_executable="/Applications/Godot.app/Contents/MacOS/Godot"


""" Show hidden files in ranger
""" Deprecating in favor of system wide ~/.config/ranger/rc.conf'
"let g:ranger_command_override = 'ranger --cmd "set show_hidden=true"'


""" Reloads vi with ;R or ;RR
""" R is consistent with tmux also, where C-b R is used for reloading config
nnoremap <leader>R :source $MYVIMRC<cr>
nnoremap <leader>RR :source $MYVIMRC<cr>


""" Open ranger with ;r
nnoremap <leader>r :Ranger<cr>

""" Buffer search with ;b
nnoremap <leader>b :Buffers<cr>
nnoremap <leader><leader> :Buffers<cr>

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


""" Removes bclose map of deleting buffer with ;bd
let g:bclose_no_plugin_maps = 1

""" Deletes current buffer with ;w
nnoremap <leader>w :bd<cr>

""" Goto last buffer with ;Tab
nnoremap <leader><Tab> :b#<cr>

""" Removes all highlights from matched chars
nnoremap <leader>/ :noh<cr>


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

""" Shift enter to insert newline in normal mode
""" Fix tab space
