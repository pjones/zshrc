#!zsh

# stuff for every os
alias vared="IFS=\$'\n' vared"
alias bc='bc -q'
alias lc='fc -lnD -1'
alias h='history -fdD'
alias j='jobs -l'
alias f="find . -name"
alias g="egrep"
alias df="df -hP"

# ls command
if [[ $OS == "freebsd" || $OS == "darwin" ]]; then
    alias ls='ls -G'
    alias l='ls -lFGh'
    alias ll='ls -lFGh'
    alias la='ls -lFGha'

elif [[ $OS == "linux"  || $OS == "cygwin_nt-5.0" ]]; then
    alias ls='\ls --color=auto --group-directories-first'
    alias lsa='ls -A'
    alias l='\ls -lhF --color=auto --group-directories-first'
    alias ll='l'
    alias la='l -A'
else
    alias l='ls -lF'
    alias ll='ls -lF'
    alias la='ls -lFa'

fi

# ps
if [[ $OS == "freebsd" ]]; then
    alias p='ps -axwwopid,ppid,user,pcpu,vsz,rss,comm,args'
elif [[ $OS == "darwin" ]]; then
    alias p='ps -axwwopid,ppid,user,pcpu,vsz,rss,command'
elif [[ $OS == "linux"  || $OS == "cygwin_nt-5.0" ]]; then
    alias p='ps -ewwopid,ppid,user,pcpu,vsz,rss,comm,args'
elif [[ $OS == "aix" || $OS == "hp-UX" ]]; then
    alias p='ps -eopid,ppid,user,pcpu,vsz,comm,args'
else
    alias p='ps -eopid,ppid,user,pcpu,vsz,rss,comm,args'
fi

# ps | grep
alias pg="p|g"

# ldd
if [[ $OS == "darwin" ]]; then
    alias ldd='otool -L'
fi

# Just to shorten typing
alias mrs='mr -d ~ status'
alias nix-unstable='nix-shell -I nixpkgs=https://github.com/NixOS/nixpkgs-channels/tarball/nixpkgs-unstable'
