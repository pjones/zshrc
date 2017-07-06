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

# default key binding is Emacs:
bindkey -e

# Edit command lines in EDITOR:
autoload edit-command-line
zle -N edit-command-line

# Smart inserting of previous words:
autoload copy-earlier-word
zle -N copy-earlier-word

# Insert some custom keybindings
bindkey -e '^x^e' edit-command-line
bindkey -e '^x^p' push-line-or-edit
bindkey -e '^x^h' run-help
bindkey -e '^x^i' last-cmd-as-expansion
bindkey -e '^r'   history-incremental-search-backward
bindkey -e '^w'   backward-kill-word-match
bindkey -e '^i'   expand-or-complete-prefix
bindkey -e '^[_'  insert-last-word
bindkey -e '^[-'  copy-earlier-word
