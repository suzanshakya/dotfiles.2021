# dotfiles.2021
Based on simplicity, portability and efficiency!

Features:

***tmux***

**macOS like tab navigation:**
Command" + Shift + { -> Change focus from current tab to right tab
Command" + Shift + } -> Change focus from current tab to left tab
Command + w          -> Close current pane [or <prefix> + X]

**Renders 256color when available**
  
**Easy Splitting**
  <prefix> + \ -> Cuts current pane into 2 horizontal panes, and focus on the new pane.
  <prefix> + | -> full width - requires shift
  <prefix> + - -> split horizontally
  <prefix> + _ -> full width - requires shift
  
**Easy Navigation**
Navigates easily beteen panes by <prefix> + [hjkl].
Navigates even more easily when vim in active by <Control + [hjkl]> ie without any prefix.
  
 

To install:
```
make
make install
```

To uninstall:
```
make clean
```
