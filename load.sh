#!/bin/bash

# Please configure the location of your dotfiles directory
SAVE_DIR=$HOME/Workspace/dotfiles

# Prepare the directories
mkdir -p ~/.ssh ~/.config/terminator

# Do the copy
cd $SAVE_DIR
cp bash_profile ~/.bash_profile
cp bashrc ~/.bashrc
cp emacs ~/.emacs
cp gitconfig ~/.gitconfig
cp rsync ~/.rsync
cp vimrc ~/.vimrc
cp ssh.config ~/.ssh/config
cp terminator.config ~/.config/terminator/config
