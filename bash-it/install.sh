#!/bin/bash

# Download bash-it sources
if [ ! -d "~/.bash_it/.git" ] ; then
rm -rf ~/.bash_it
git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
fi

# No configuration to do, already included in .bashrc

# Enable plugins
mkdir -p ~/.bash_it/plugins/enabled
cd ~/.bash_it/plugins/enabled
ln -s ../available/alias-completion.plugin.bash .
ln -s ../available/base.plugin.bash .
ln -s ../available/docker-compose.plugin.bash .
ln -s ../available/git.plugin.bash .
ln -s ../available/less-pretty-cat.plugin.bash .

# Get gallifrey theme
mkdir -p ~/.bash_it/custom/themes/gallifrey
wget https://raw.githubusercontent.com/Bash-it/bash-it/master/themes/gallifrey/gallifrey.theme.bash -O ~/.bash_it/custom/themes/gallifrey/gallifrey.theme.bash

