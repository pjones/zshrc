#!zsh

# Set our EDITOR
if which editor >/dev/null 2>&1; then
  export EDITOR="editor"
elif which emacs >/dev/null 2>&1; then
  export EDITOR="emacs -nw"
elif which vim >/dev/null 2>&1; then
  export EDITOR=vim
elif which vi >/dev/null 2>&1; then
  export EDITOR=vi
else
  export EDITOR=nano
fi
