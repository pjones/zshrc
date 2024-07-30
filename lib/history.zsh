#!zsh

# History stuff
HISTSIZE=2000
SAVEHIST=$HISTSIZE

setopt append_history
setopt inc_append_history
setopt extended_history
setopt hist_find_no_dups
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt hist_ignore_space
setopt hist_no_store
setopt no_hist_beep
setopt hist_save_no_dups
setopt hist_expire_dups_first
unsetopt share_history
