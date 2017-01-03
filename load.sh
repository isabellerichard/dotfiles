#!/bin/bash

# Prepare the directories
mkdir -p $HOME/.ssh $HOME/.config/sublime-text-3/Packages/User $HOME/.config/terminator $HOME/.subversion

# Replace config files by link to this repo
cp .bash_profile .bashrc .gitconfig .gitignore_global .multitailrc .pdbrc \
    .profile .psqlrc .rsync .vimrc .zshrc $HOME
cp flake8 pep8 $HOME/.config
cp subversion.config $HOME/.subversion/config
cp ssh.config.tmpl $HOME/.ssh/config.tmpl
cp Anaconda/*.sublime-settings Anaconda/*.sublime-snippet $HOME/.config/sublime-text-3/Packages/User
cp terminator.config $HOME/.config/terminator/config
