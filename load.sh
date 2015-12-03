#!/bin/bash

# Prepare the directories
mkdir -p ~/.ssh ~/.config/terminator ~/.subversion

# Replace config files by link to this repo
ln -sf $PWD/bash_profile $HOME/.bash_profile
ln -sf $PWD/bashrc $HOME/.bashrc
ln -sf $PWD/emacs $HOME/.emacs
ln -sf $PWD/flake8 $HOME/.config/flake8
ln -sf $PWD/gitconfig $HOME/.gitconfig
ln -sf $PWD/gitignore_global $HOME/.gitignore_global
ln -sf $PWD/multitailrc $HOME/.multitailrc
ln -sf $PWD/pdbrc $HOME/.pdbrc
ln -sf $PWD/pep8 $HOME/.config/pep8
ln -sf $PWD/profile $HOME/.profile
ln -sf $PWD/psqlrc $HOME/.psqlrc
ln -sf $PWD/rsync $HOME/.rsync
ln -sf $PWD/subversion.config $HOME/.subversion/config
ln -sf $PWD/vimrc $HOME/.vimrc
ln -sf $PWD/ssh.config.tmpl $HOME/.ssh/config.tmpl
ln -sf $PWD/terminator.config $HOME/.config/terminator/config

