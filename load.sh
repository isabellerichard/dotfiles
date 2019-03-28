#!/bin/bash

# Prepare the directories
mkdir -p $HOME/.ssh $HOME/.config/terminator

# Replace config files by link to this repo
cp .bash_profile .bashrc .gitconfig .gitignore_global .pdbrc \
    .profile .psqlrc .rsync .vimrc $HOME
cp flake8 pep8 $HOME/.config
cp ssh.config.tmpl $HOME/.ssh/config.tmpl
cp terminator.config $HOME/.config/terminator/config

# Install bash-it
. bash-it/install.sh

