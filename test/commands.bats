#!./test/libs/bats/bin/bats

DOTFILES_REPO=$HOME/Dotfiles

load 'libs/bats-support/load'
load 'libs/bats-assert/load'
load 'test_helper'

wads='./wads'

@test "Should symlink file from home directory to ~/Dotfiles" {
    touch $HOME/.testrc
    run $wads add .testrc
    assert_success
    assert [ -e $DOTFILES_REPO/testrc ]
    rm -rf $HOME/.testrc
    rm -rf $DOTFILES_REPO/testrc
}

@test "Should remove file from dotfiles repo" {
    run $wads rm testrc
    assert_success
    assert [ ! -e $DOTFILES_REPO/testrc ]
    rm -rf $HOME/.testrc
    rm -rf $DOTFILES_REPO/testrc
}

@test "Should symlink file from dotfiles repo to home" {
    touch $DOTFILES_REPO/testrc
    run $wads install testrc
    assert_success
    assert [ -L $HOME/.testrc ]
    rm -rf $HOME/.testrc
    rm -rf $DOTFILES_REPO/testrc
}
