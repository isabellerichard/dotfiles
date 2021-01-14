#!/bin/bash

# Prepare the directories
mkdir -p $HOME/.ssh $HOME/.config/terminator

# Replace config files by link to this repo
cp .bash_aliases .bash_profile .bashrc .gitconfig .gitignore_global .pdbrc \
    .profile .psqlrc .rsync .vimrc $HOME
cp flake8 pep8 $HOME/.config
cp ssh.config.tmpl $HOME/.ssh/config.tmpl
cp terminator.config $HOME/.config/terminator/config

# Install Oh My Zsh
sudo apt install -y zsh
rm -rf /home/isabelle/.oh-my-zsh
curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install
git clone https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k\n
cp .zshrc .p10k.zsh $HOME
echo "-----"
echo "Do not forget to install these fonts: "
echo "https://github.com/romkatv/powerlevel10k#meslo-nerd-font-patched-for-powerlevel10k"

