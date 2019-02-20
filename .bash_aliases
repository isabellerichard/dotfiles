# ------------------
# MY CONFIGURATION -
# ------------------
# Path
PATH=$PATH:$HOME/workspace/devops/dev-tools

# Utils
alias rm='rm -i'
alias ll='ls -lh'
alias dropdb='dropdb -i'
alias rsync='rsync --exclude-from=$HOME/.rsync'
alias open='xdg-open'
alias dc='docker-compose'
alias updateodooaddons='for module in $(echo smile_*); do diff $module ~/workspace/smile_addons/$module > /dev/null 2>&1 ; if [[ $? == 1 ]] ; then meld $module ~/workspace/smile_addons/$module ; fi ; done'

# Default editor
export VISUAL=/usr/bin/vim

# Programming
alias pygrep='grep -HRn --include="*.py"'
alias xgrep='grep -HRn --include="*.xml"'
alias ygrep='grep -HRn --include="*.yml"'

# Python
alias flake8='flake8 --filename=*.py --exclude=__init__.py,*.md'

# Git
export FLAKE8_STRICT=True  # forbids commit on Git projects if flake8 errors

# Enable auto completion for cd only on directories
complete -d cd

# Prompt
# Colors:
# 30 : black
# 31 : red
# 32 : green
# 33 : yellow
# 34 : blue
# 35 : purple
# 36 : cyan
# 37 : white
#PS1='\[\e[32m\]\u \[\e[33m\]{\A} \[\e[35m\]\W $ \[\e[m\]'
PS1='\[\e[1;32m\]\u@\h \[\e[1;34m\]\w\[\e[0;39m\]$(__git_ps1)\[\e[1;34m\] $ \[\e[m\]'
#PS1='\[\e[1;31m\]\w\[\e[0;39m\]$(__git_ps1)\[\e[1;31m\] > \[\e[m\]'
#PS1='\[\e[1;46;37m\]\w\[\e[0;39m\]$(__git_ps1)\[\e[1;31m\] > \[\e[m\]'

# orange bold
#PS1="\\033[1;95;38;5;214m\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\u@\h:\w\$\\033[0m "
# red bold
# PS1="\\033[1;95;38;5;160m\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\u@\h:\w\$\\033[0m "
