#!zsh

# Set our EDITOR
if which emacsclient > /dev/null 2>&1 && which e > /dev/null; then
  export EDITOR="e"
elif which emacs > /dev/null 2>&1; then
  export EDITOR="emacs -nw"
elif which vim > /dev/null 2>&1; then
  export EDITOR=vim
else
  export EDITOR=vi
fi
