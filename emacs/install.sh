# Installation
# OS: Ubuntu 14.04

sudo apt-get install mercurial
rm -rf $HOME/.emacs $HOME/.emacs.d
mkdir $HOME/.emacs.d
cp .emacs $HOME
cp -r settings $HOME/.emacs.d
emacs &

