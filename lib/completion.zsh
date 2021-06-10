#!zsh

zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
zstyle ':completion:*:descriptions' format '[%d]'

# prevent CVS directories from being auto completed
zstyle ':completion:*:(all-|)files' ignored-patterns '(|*/)CVS'
zstyle ':completion:*:cd:*' ignored-patterns '(*/)#CVS'

# other stuff for cd(1)
zstyle ':completion:*:cd:*' ignore-parents parent pwd

# ignore functions that begin with _
zstyle ':completion:*:functions' ignored-patterns '_*'

# Enable better completion:
autoload -U compinit
compinit

# load some plugins:
if [[ -e @fzftab@/share/fzf-tab/fzf-tab.plugin.zsh ]] &&
  which fzf >/dev/null 2>&1; then

  source @fzftab@/share/fzf-tab/fzf-tab.plugin.zsh
  enable-fzf-tab
else
  zstyle ':completion:*' menu select
fi
