#!./test/libs/bats/bin/bats

DOTFILES_REPO=~/Dotfiles

load 'libs/bats-support/load'
load 'libs/bats-assert/load'


wads='./wads'

@test "Should symlink file from home directory to ~/Dotfiles" {
    touch ~/.testrc
    run $wads add .testrc
    assert_success
    assert [ -f $DOTFILES_REPO/testrc ]
}

@test "Should remove file from dotfiles repo" {
    run $wads rm testrc
    assert_success
    assert [ ! -f $DOTFILES_REPO/testrc ]
    rm -rf ~/.testrc
    rm -rf $DOTFILES_REPO/testrc
}

@test "Should symlink file from dotfiles repo to home" {
    touch $DOTFILES_REPO/testrc
    run $wads install testrc
    assert_success
    assert [ -f ~/.testrc ]
    rm -rf ~/.testrc
    rm -rf $DOTFILES_REPO/testrc
}