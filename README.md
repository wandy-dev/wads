# Wandy's auto dotfile synchronizer

## wads

  USAGE:

    wads: dotfile repo manager

     wads [ -n ] add

     wads -n         : send notification

     wads add .vimrc    : add .vimrc to dotfiles repo
     wads rm vimrc      : remove vimrc from dotfiles repo
     wads install vimrc : symlink vimrc from dotfiles repo to home dir

  OPTIONS:

     -n : send notification to commit dotfiles

  COMMANDS:

     add     : add file to dotfiles repo
     rm      : remove file from dotfiles repo
     install : symlink file from dotfiles repo to home dir
