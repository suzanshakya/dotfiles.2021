# dotfiles.2021
Based on simplicity, portability and efficiency!

**Features:**

** Alacritty **
Shift hover over hyperlink to make the link clicable.

** zsh **
When new zsh shell is created, autorun `dotfiles $(cat .workon)` if there's a .workon file

**tmux**

*** macOS like tab navigation: ***  
Command + t         -> Open new tab in terminal: alacritty  
Command + w         -> Close current pane [or \<prefix\> + X]  
Command + Shift + { -> Change focus from current tab to right tab [or tmux window if you will]  
Command + Shift + } -> Change focus from current tab to left tab  
Command + q         -> Quit alacritty (default shortut to kill any app in macOS)


***Renders 256color when available***  
  
***Easy Splitting***  
\<prefix\> + \ -> Cuts current pane into 2 horizontal panes, and focus on the new pane.  
\<prefix\> + | -> full width - requires Shift  
\<prefix\> + - -> split horizontally  
\<prefix\> + _ -> full width - requires Shift  
  
***Easy Navigation***  
Navigates easily beteen panes by \<prefix\> + [hjkl].  
Navigates even more easily when vim in active by <Control + [hjkl]> ie without any \<prefix\>.  

*** File Navigation in Neovim ***
;f Shows fzf interface showing all the files, `fd` can find.
;g Shows fzf interface showing all the files, `git ls-files` can find.
;b Shows fzf interface showing all the files in vim buffer.
;; Same as ;b
;r Show ranger interface at `pwd`


** Neovim
Ctrl-q Ctrl-q to quit nvim
Command-s to save current buffer
;w

**To install:**
```
make
make install
```

**To uninstall:**
```
make clean
```
