#!zsh

# Use default colors:
zstyle ':completion:*:default' list-colors ''

# Automatically separate completion lists into groups:
zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format '[%d]'

# Control completion menus:
zstyle ':completion:*' menu select search

# Control file completion:
zstyle ':completion:*' list-dirs-first
zstyle ':completion:*:cd:*' ignore-parents parent pwd

# Ignore functions that begin with _:
zstyle ':completion:*:functions' ignored-patterns '_*'

# Process completion:
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z.-]#)*=01;34=0=01'
zstyle ':completion:*:*:*:*:processes' command 'ps -u $USERNAME -o pid,comm,args -w -w'

# Other settings:
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

# Enable better completion:
autoload -U compinit
compinit
