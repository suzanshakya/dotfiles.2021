# dotfiles.2021  
Based on simplicity, portability and efficiency!  


**Tmux features**  
***automatically saves session state once in 15 minutes.***  
`Ctrl+b + Ctrl+s` to save the state of all tmux sessions  
`Ctrl+b + Ctrl+r` to restore the saved state of tmux sessions  

***macOS like tab navigation:***  
`Command + t`         -> Open new tab in terminal: alacritty  
`Command + w`         -> Close current pane [or \<prefix\> + X]  
`Command + Shift + {` -> Change focus from current tab to right tab [or tmux window if you will]  
`Command + Shift + }` -> Change focus from current tab to left tab  
`Command + q`         -> Quit alacritty (default shortut to kill any app in macOS)  

***navigation in between tmux panes and tmux panes with vim***  
Navigates easily beteen panes by `<prefix> + [hjkl]`.  
Navigates even more easily when vim is active by `<Control> + [hjkl]` ie without any tmux `<prefix>`.  

***easy splitting panes***  
`<prefix> + \` -> Cuts current pane into 2 horizontal panes, and focus on the new pane.  
`<prefix> + |` -> full width - requires Shift  
`<prefix> + -` -> split horizontally  
`<prefix> + _` -> full width - requires Shift  
  
***renders 256color when available***  


**Neovim features**  
***file Navigation in Neovim***  
`;e` Show ranger interface at `pwd`  
`;f` Shows `fzf` interface showing all the files, `fd` can find.  
`;;` Shows `fzf` interface showing all the files, `git ls-files` can find.  
`;b` Shows `fzf` interface showing all the files in vim buffer.  

***adds some new nice mappings***  
`Command-s` to save current buffer  
`Ctrl-q Ctrl-q` to quit nvim  
`;w`  to delete current buffer  
`[b` to go to left buffer [tab]  
`]b` to go to right buffer [tab]  
`;Tab` to go to last buffer [tab]  


**Alacritty features**  
`Shift hover` over hyperlink to make the link clicable.  


**Zsh features**  
Prompt powered by powerlevel10k  
When new zsh shell is created, autorun `workon $(cat .workon)` if there's a .workon file  


**To install:**  
```
# To setup minimal installation that includes zsh, git, tmux, neovim configurations
make

# If you need to install only python, you can do:
make python-setup

# To install misc packages such as nginx, node, openjdk, gh, bat
make misc
```


**To uninstall:**  
```
make clean
```
