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
# Invite de commande
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
PS1='\[\e[1;32m\]\u@\h \[\e[1;34m\]\W\[\e[0;39m\]$(__git_ps1)\[\e[1;34m\] $ \[\e[m\]'

# Path
PATH=$PATH:$HOME/scripts:$HOME/Workspace/OpenERP7.0/server/history
PATH=$PATH:$HOME/Dropbox/smile/scripts

# Utiles 
alias rm='rm -i'
alias ll='ls -l'
alias dropdb='dropdb -i'
#alias emacs='emacs -g -0+0' # emacs en haut à droite
alias emacs='emacs -mm' # emacs maximisé
alias rsync='rsync --exclude-from=$HOME/.rsync'
alias open='xdg-open'

# Editeur par défaut
export VISUAL=/usr/bin/vim
export JBOSS_HOME=/home/isabelle/jboss-6.1.0.Final

# Programmation 
alias ocaml='ledit ocaml' 
alias gcc='gcc -Wall' 
alias pygrep='grep -HRn --include="*.py"'
alias xgrep='grep -HRn --include="*.xml"'
alias ygrep='grep -HRn --include="*.yml"'

# Python
alias flake8='flake8 --filename=*.py --exclude=__init__.py,*.md'

# Git
export FLAKE8_STRICT=True  # forbids commit on Git projects if flake8 errors

# Svn
svn () {

    #bail if the user didnt specify which subversion command to invoke
    if [ $# -lt 1 ]; then
	command svn
	return
    fi

    local sub_cmd=$1
    shift

    #intercept svn diff commands
    if [ $sub_cmd == diff ]; then

	#colorize the diff
	#remove stupid ^M dos line endings
	#page it if there's more one screen
	command svn diff "$@" | colordiff | sed -e 's/\r//g' | less -R

	#add some color to svn status output and page if needed:
	#M = blue
	#A = green
	#D/!/~ = red
	#C = magenta
	#
	#note that C and M can be preceded by whitespace - see $svn help status
    elif [[ $sub_cmd =~ ^(status|st)$ ]]; then
	command svn status "$@" | sed -e 's/^\(\([A-Z]\s\+\(+\s\+\)\?\)\?C .*\)$/\o33\[1;35m\1\o33[0m/' \
	    -e 's/^\(\s*M.*\)$/\o33\[1;34m\1\o33[0m/' \
	    -e 's/^\(A.*\)$/\o33\[1;32m\1\o33[0m/' \
	    -e 's/^\(\(D\|!\|~\).*\)$/\o33\[1;31m\1\o33[0m/' | less -R

	#page some stuff I often end up paging manually
    elif [[ $sub_cmd =~ ^(blame|help|h|cat)$ ]]; then
	command svn $sub_cmd "$@" | less -R

	#colorize and page svn log
	#rearrange the date field from:
	#  2010-10-08 21:19:24 +1300 (Fri, 08 Oct 2010)
	#to:
	#  2010-10-08 21:19 (Fri, +1300)
    elif [[ $sub_cmd == log ]]; then
	command svn log "$@" | sed -e 's/^\(.*\)|\(.*\)| \(.*\) \(.*\):[0-9]\{2\} \(.*\) (\(...\).*) |\(.*\)$/\o33\[1;32m\1\o33[0m|\o33\[1;34m\2\o33[0m| \o33\[1;35m\3 \4 (\6, \5)\o33[0m |\7/' | less -R 

	#let svn handle it as normal
    else
	command svn $sub_cmd "$@"
    fi
}

# Odoo projects
if [ -f $HOME/.odoo/.odoorc ]; then
    source $HOME/.odoo/.odoorc
fi
