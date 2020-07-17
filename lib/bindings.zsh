#!zsh

# fix ^w
export WORDCHARS="*?_-.[]~={}<>"
autoload backward-kill-word-match select-word-style match-words-by-style
zle -N backward-kill-word-match
select-word-style normal
match-words-by-style normal

# my widgets
for widget in last-cmd-as-expansion; do
  autoload $widget
  zle -N $widget
done

# default key binding is emacs:
bindkey -e

# Edit command lines in EDITOR:
autoload edit-command-line
zle -N edit-command-line

# Smart inserting of previous words:
autoload copy-earlier-word
zle -N copy-earlier-word

# Insert some custom keybindings
bindkey '^[e' end-of-buffer-or-history
bindkey '^[h' run-help
bindkey '^[i' last-cmd-as-expansion
bindkey '^[l' insert-last-word
bindkey '^[p' push-line-or-edit
bindkey '^[w' copy-earlier-word
bindkey '^i' expand-or-complete-prefix
bindkey '^n' down-history
bindkey '^p' up-history
bindkey '^r' history-incremental-search-backward
bindkey '^t' edit-command-line
bindkey '^u' kill-whole-line
bindkey '^w' backward-kill-word-match
