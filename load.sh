#!/bin/bash

# Prepare the directories
mkdir -p ~/.ssh ~/.config/terminator

# Do the copy
if false
then
    cp bash_profile ~/.bash_profile
    cp bashrc ~/.bashrc
    cp emacs ~/.emacs
    cp gitconfig ~/.gitconfig
    cp rsync ~/.rsync
    cp vimrc ~/.vimrc
    cp ssh.config ~/.ssh/config
    cp terminator.config ~/.config/terminator/config
fi

# Replace config files by link to this repo
ln -sf $PWD/bash_profile $HOME/.bash_profile
ln -sf $PWD/bashrc $HOME/.bashrc
ln -sf $PWD/emacs $HOME/.emacs
ln -sf $PWD/gitconfig $HOME/.gitconfig
ln -sf $PWD/rsync $HOME/.rsync
ln -sf $PWD/vimrc $HOME/.vimrc
ln -sf $PWD/ssh.config $HOME/.ssh/config
ln -sf $PWD/terminator.config $HOME/.config/terminator/config
