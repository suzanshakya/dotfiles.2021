# dotfiles.2021
Based on simplicity, portability and efficiency!

Features:

***tmux***

**macOS like tab navigation:**  
Command + Shift + { -> Change focus from current tab to right tab [or tmux window if you will]
Command + Shift + } -> Change focus from current tab to left tab  
Command + t         -> Open new tab  
Command + w         -> Close current pane [or \<prefix\> + X]  

**Renders 256color when available**  
  
**Easy Splitting**  
  \<prefix\> + \ -> Cuts current pane into 2 horizontal panes, and focus on the new pane.  
  \<prefix\> + | -> full width - requires Shift  
  \<prefix\> + - -> split horizontally  
  \<prefix\> + _ -> full width - requires Shift  
  
**Easy Navigation**  
Navigates easily beteen panes by \<prefix\> + [hjkl].  
Navigates even more easily when vim in active by <Control + [hjkl]> ie without any \<prefix\>.  
  
 

To install:
```
make
make install
```

To uninstall:
```
make clean
```
