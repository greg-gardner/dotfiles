# Greg Gardner's
#   _               _              _ _                     
#  | |__   __ _ ___| |__      __ _| (_) __ _ ___  ___  ___ 
#  | '_ \ / _` / __| '_ \    / _` | | |/ _` / __|/ _ \/ __|
# _| |_) | (_| \__ \ | | |  | (_| | | | (_| \__ \  __/\__ \
#(_)_.__/ \__,_|___/_| |_|___\__,_|_|_|\__,_|___/\___||___/
#                      |_____|                            


alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# COLORED COMMANDS
if [ -f /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

    
# Debian only
if [ -f /etc/debian_version ]; then
    alias netboot='sudo service NetworkManager restart'
fi

alias src='source ~/.bash_aliases'

# py4fi
alias py4fi='ssh -qX root@137.184.102.25'