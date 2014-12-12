#!/bin/bash

# Prepare the directories
mkdir -p ~/.ssh ~/.config/terminator

# Replace config files by link to this repo
ln -sf $PWD/bash_profile $HOME/.bash_profile
ln -sf $PWD/bashrc $HOME/.bashrc
ln -sf $PWD/emacs $HOME/.emacs
ln -sf $PWD/flake8 $HOME/.config/flake8
ln -sf $PWD/gitconfig $HOME/.gitconfig
ln -sf $PWD/gitignore_global $HOME/.gitignore_global
ln -sf $PWD/guake $HOME/.gconf/apps/guake
ln -sf $PWD/rsync $HOME/.rsync
ln -sf $PWD/vimrc $HOME/.vimrc
ln -sf $PWD/ssh.config $HOME/.ssh/config
ln -sf $PWD/terminator.config $HOME/.config/terminator/config
