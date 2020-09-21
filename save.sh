#!/bin/bash

# Replace config files by link to this repo
cp $HOME/.bash_aliases $HOME/.bash_profile $HOME/.bashrc $HOME/.gitconfig $HOME/.gitignore_global \
    $HOME/.pdbrc  $HOME/.profile $HOME/.psqlrc $HOME/.rsync $HOME/.vimrc .
cp $HOME/.config/flake8 $HOME/.config/pep8 .
cp $HOME/.ssh/config.tmpl ssh.config.tmpl
cp $HOME/.config/terminator/config terminator.config
