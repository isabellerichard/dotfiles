#!/bin/bash

# Prepare the directories
mkdir -p ~/.ssh ~/.config/terminator

# Do the copy
cp bash_profile ~/.bash_profile
cp bashrc ~/.bashrc
cp emacs ~/.emacs
cp gitconfig ~/.gitconfig
cp rsync ~/.rsync
cp vimrc ~/.vimrc
cp ssh.config ~/.ssh/config
cp terminator.config ~/.config/terminator/config
