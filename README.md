# Wandy's auto dotfile synchronizer

[![Build Status](https://travis-ci.org/wandy-dev/wads.svg?branch=master)](https://travis-ci.org/wandy-dev/wads)

## wads

  USAGE:

    wads: dotfile repo manager

     wads [ -n ] add

     wads -n            : send notification
     wads add .vimrc    : add .vimrc to dotfiles repo
     wads rm vimrc      : remove vimrc from dotfiles repo
     wads install vimrc : symlink vimrc from dotfiles repo to home dir

  OPTIONS:

     -n : send notification to commit dotfiles

  COMMANDS:

     add     : add file to dotfiles repo
     rm      : remove file from dotfiles repo
     install : symlink file from dotfiles repo to home dir

## tests

You can run the tests with the following

```sh
git clone git@github.com:wandy-dev/wads.git
git submodule update --init --recursive
./test.sh
```
If you are changing the tests run `./dev.sh` to have the test run on file change

The requires `entr` to be installed but it is completely optional
