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

# default key binding is vi:
bindkey -v

# Indicate which vi mode you're in:
function zle-keymap-select {
  case $KEYMAP in
    vicmd)
      vi_mode="%K{yellow}%F{black} <N> %f%k"
      ;;

    *)
      vi_mode=""
      ;;
  esac

  RPROMPT="$vi_mode"
  zle reset-prompt
}

zle -N zle-keymap-select

# Edit command lines in EDITOR:
autoload edit-command-line
zle -N edit-command-line

# Smart inserting of previous words:
autoload copy-earlier-word
zle -N copy-earlier-word

# Insert some custom keybindings
bindkey '^b'   backward-char
bindkey '^f'   forward-char
bindkey '^i'   expand-or-complete-prefix
bindkey '^n'   down-history
bindkey '^p'   up-history
bindkey '^r'   history-incremental-search-backward
bindkey '^w'   backward-kill-word-match
bindkey '^x-'  copy-earlier-word
bindkey '^x^e' edit-command-line
bindkey '^x^h' run-help
bindkey '^x^i' last-cmd-as-expansion
bindkey '^x^p' push-line-or-edit
bindkey '^x_'  insert-last-word
