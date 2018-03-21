alias sshgg='ssh -X -p 1989 greggardner.info'
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
