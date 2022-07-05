""" List of vim plugins plugged by vim-plug
call plug#begin('~/.vim/plugged')

""" Easy file navigation with fzf
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

Plug 'jremmen/vim-ripgrep'

""" Easy navigation to tmux pane with C-[hjkl]
"Plug 'christoomey/vim-tmux-navigator'
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

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
""" AsyncRun for running godot executable
Plug 'skywind3000/asyncrun.vim'

Plug 'wfxr/minimap.vim'

"Plug 'arcticicestudio/nord-vim'
Plug 'romainl/flattened'

""" Autocompletion
let g:python_host_prog = '/full/path/to/neovim2/bin/python'
let g:python3_host_prog = '~/.pyenv/versions/3.10.2/bin/python'

Plug 'davidhalter/jedi-vim'
"let g:jedi#completions_command = "<Tab>"

Plug 'github/copilot.vim'

"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'deoplete-plugins/deoplete-jedi'
"let g:deoplete#enable_at_startup = 1

""" Scrolls through deoplete completion suggestion words
"inoremap <silent><expr> <TAB>
"        \ pumvisible() ? "\<C-n>" :
"        \ <SID>check_back_space() ? "\<TAB>" :
"        \ deoplete#manual_complete()
"        function! s:check_back_space() abort "{{{
"        let col = col('.') - 1
"        return !col || getline('.')[col - 1]  =~ '\s'
"        endfunction"}}}
"
"inoremap <silent><expr> <S-TAB>
"        \ pumvisible() ? "\<C-p>" : "\<TAB>"

call plug#end()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"colorscheme nord
colorscheme flattened_dark

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

""" Searching stops at the end of file
"set nowrapscan


""" Confirm whether to save when deleting or quitting a changed buffer
set confirm


""" Automatically save undo history between sessions.
set undofile


""" set a directory to store the undo history
set undodir=~/.vim/undo/


""" Hide ~ sign at empty lines
let &fcs='eob: '


""" Elect ; to be a leader
let mapleader = ";"


""" Removes ranger default key-binding of ;f.
""" btw, ;f is used by fzf for :Files [== :FZF]
let g:ranger_map_keys = 0


""" Defines godot executable. now working though!
let g:godot_executable="/Applications/Godot.app/Contents/MacOS/Godot -t --resolution 715x400 --position 725,0"
nnoremap <leader>G :AsyncStop<cr>:sleep 1<cr>:GodotRun<cr>
nnoremap <leader>X :AsyncStop<cr>


""" Show hidden files in ranger
""" Deprecating in favor of system wide ~/.config/ranger/rc.conf'
"let g:ranger_command_override = 'ranger --cmd "set show_hidden=true"'


""" Reloads vi with ;R or ;RR
""" R is consistent with tmux also, where C-b R is used for reloading config
nnoremap <leader>R :source $MYVIMRC<cr>
nnoremap <leader>RR :source $MYVIMRC<cr>


""" Open ranger with ;e
nnoremap <leader>e :Ranger<cr>

""" Buffer search with ;b
nnoremap <leader>b :Buffers<cr>

""" Search in Git files with ;;
nnoremap <leader><leader> :GitFiles<cr>

""" FZF files search with ;f
nnoremap <leader>f :Files<cr>

""" Rg search with ;Rg
nnoremap <leader>Rg :Rg<cr>

""" ;hh for searching vim file history
nnoremap <leader>hh :History<cr>

""" ;h; for searching vim command history
nnoremap <leader>h; :History:<cr>

""" ;h/ for searching vim find history
nnoremap <leader>h/ :History/<cr>


""" Removes bclose map of deleting buffer with ;bd
let g:bclose_no_plugin_maps = 1

""" Deletes current buffer with ;w
nnoremap <leader>w :bd<cr>

""" Goto last buffer with ;Tab
nnoremap <leader><Tab> :b#<cr>

""" Removes all highlights from matched chars
nnoremap <leader>/ :noh<cr>


""" C-s to save in vi. In mac, alacritty will convert Command-s to C-s.
nnoremap <C-s> :w<cr>
inoremap <C-s> <esc>:w<cr>

""" C-q to quit in vi.
nnoremap <C-q> :q<cr>

""" Removes trailing space by "; "
nnoremap <leader><space> :%s/\s\+$//e<cr>

nnoremap <leader>m :MinimapToggle<cr>

nnoremap <leader>\ <C-W>v
nnoremap <leader>- <C-W>s

""" In visual mode, Y to copy to clipboard
vnoremap Y "*y


""" Switches 2 buffers left
map [2b [b[b
""" Switches 2 buffers right
map ]2b ]b]b


""" Upon saving a file, this code saves current buffer state so that
""" next vi will restore current buffers.
autocmd BufWritePost * call session#MakeSession()


""" Shift enter to insert newline in normal mode

""" Fix tab space
" by default, the indent is 2 spaces.
set shiftwidth=2
set softtabstop=2
set tabstop=2

" for html files, 2 spaces
autocmd Filetype         html setlocal ts=2 sw=2 expandtab

" for python/java/javascript files, 4 spaces
autocmd Filetype       python setlocal ts=4 sw=4 sts=0 expandtab
autocmd Filetype           sh setlocal ts=4 sw=4 sts=0 expandtab
autocmd Filetype         java setlocal ts=4 sw=4 sts=0 expandtab
autocmd Filetype   javascript setlocal ts=4 sw=4 sts=0 expandtab
autocmd Filetype          xml setlocal ts=4 sw=4 sts=0 expandtab
autocmd BufRead,BufNewFile *.gradle set filetype=groovy
autocmd Filetype       groovy setlocal ts=4 sw=4 sts=0 expandtab
autocmd Filetype       gdscript setlocal tabstop=4 shiftwidth=4 sts=0


""" Enables italic font on comments
highlight Comment cterm=italic
highlight Comment gui=italic
