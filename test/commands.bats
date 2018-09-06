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

@test "subcommands should work with multiple files" {
    touch $HOME/.testrc
    touch $HOME/.testrc1
    run $wads add .testrc
    run $wads add .testrc1
    assert_success
    assert [ -e $DOTFILES_REPO/testrc ]
    assert [ -e $DOTFILES_REPO/testrc1 ]

    run $wads rm testrc
    run $wads rm testrc1
    assert_success
    assert [ ! -e $DOTFILES_REPO/testrc ]
    assert [ ! -e $DOTFILES_REPO/testrc1 ]

    rm -rf $HOME/.testrc
    rm -rf $DOTFILES_REPO/testrc
    rm -rf $HOME/.testrc1
    rm -rf $DOTFILES_REPO/testrc1

    touch $DOTFILES_REPO/testrc
    touch $DOTFILES_REPO/testrc1
    run $wads install testrc
    run $wads install testrc1
    assert_success
    assert [ -L $HOME/.testrc ]
    assert [ -L $HOME/.testrc1 ]

    rm -rf $HOME/.testrc
    rm -rf $DOTFILES_REPO/testrc
    rm -rf $HOME/.testrc1
    rm -rf $DOTFILES_REPO/testrc1
}
