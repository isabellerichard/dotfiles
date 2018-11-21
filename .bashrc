# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
    xterm*|rxvt*)
	PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
	;;
    *)
	;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi



# ------------------
# MA CONFIGURATION -
# ------------------
# Path
PATH=$PATH:$HOME/workspace/dev-tools

# Utiles
alias rm='rm -i'
alias ll='ls -lh'
alias dropdb='dropdb -i'
#alias emacs='emacs -g -0+0' # emacs en haut à droite
alias emacs='emacs -mm' # emacs maximisé
alias rsync='rsync --exclude-from=$HOME/.rsync'
alias open='xdg-open'
alias stellarhelp='echo "postgresql+psycopg2://odoo:odoo@localhost:5432/3S"'
alias dc='docker-compose'

# Editeur par défaut
export VISUAL=/usr/bin/vim

# Programmation
alias ocaml='ledit ocaml'
alias gcc='gcc -Wall'
alias pygrep='grep -HRn --include="*.py"'
alias xgrep='grep -HRn --include="*.xml"'
alias ygrep='grep -HRn --include="*.yml"'

# Python
alias flake8='flake8 --filename=*.py --exclude=__init__.py,*.md'

# SSH
alias enable_ssh_home='sed -i '/^#ProxyCommand/s/^#//g' ~/.ssh/config'
alias disable_ssh_proxy='sed -i '/^ProxyCommand/s/^/#/g' ~/.ssh/config'

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

# Path to the bash it configuration
export BASH_IT="$HOME/.bash_it"

# Lock and Load a custom theme file
# location /.bash_it/themes/
export BASH_IT_THEME='purity'

# (Advanced): Change this to the name of your remote repo if you
# cloned bash-it with a remote other than origin such as `bash-it`.
# export BASH_IT_REMOTE='bash-it'

# Your place for hosting Git repos. I use this for private repos.
export GIT_HOSTING='git@git.domain.com'

# Don't check mail when opening terminal.
unset MAILCHECK

# Change this to your console based IRC client of choice.
export IRC_CLIENT='irssi'

# Set this to the command you use for todo.txt-cli
export TODO="t"

# Set this to false to turn off version control status checking within the prompt for all themes
export SCM_CHECK=true

# Set Xterm/screen/Tmux title with only a short hostname.
# Uncomment this (or set SHORT_HOSTNAME to something else),
# Will otherwise fall back on $HOSTNAME.
#export SHORT_HOSTNAME=$(hostname -s)

# Set vcprompt executable path for scm advance info in prompt (demula theme)
# https://github.com/djl/vcprompt
#export VCPROMPT_EXECUTABLE=~/.vcprompt/bin/vcprompt

# (Advanced): Uncomment this to make Bash-it reload itself automatically
# after enabling or disabling aliases, plugins, and completions.
# export BASH_IT_AUTOMATIC_RELOAD_AFTER_CONFIG_CHANGE=1

# Load Bash It
source $BASH_IT/bash_it.sh
