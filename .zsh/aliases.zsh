alias lh='ls -d .* --color' # show hidden files/directories only
alias lsd='ls -aFhlG --color'
alias l='ls -al --color'
alias ls='ls -GFh --color' # Colorize output, add file type indicator, and put sizes in human readable format
alias ll='ls -GFhl --color' # Same as above, but in long listing format

# Utiles 
alias rm='rm -i'
alias dropdb='dropdb -i'
#alias emacs='emacs -g -0+0' # emacs en haut à droite
alias emacs='emacs -mm' # emacs maximisé
alias rsync='rsync --exclude-from=$HOME/.rsync'
alias open='xdg-open'

# Programmation 
alias ocaml='ledit ocaml' 
alias gcc='gcc -Wall' 
alias pygrep='grep -HRn --include="*.py"'
alias xgrep='grep -HRn --include="*.xml"'
alias ygrep='grep -HRn --include="*.yml"'

# Python
alias flake8='flake8 --filename=*.py --exclude=__init__.py,*.md'
