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
bindkey '^[b' backward-word
bindkey '^[e' edit-command-line
bindkey '^[f' forward-word
bindkey '^[h' run-help
bindkey '^[i' last-cmd-as-expansion
bindkey '^[j' down-history
bindkey '^[k' up-history
bindkey '^[l' insert-last-word
bindkey '^[p' push-line-or-edit
bindkey '^[w' copy-earlier-word
bindkey '^a'  beginning-of-line
bindkey '^b'  backward-char
bindkey '^e'  end-of-line
bindkey '^d'  delete-char-or-list
bindkey '^f'  forward-char
bindkey '^i'  expand-or-complete-prefix
bindkey '^k'  kill-line
bindkey '^n'  down-history
bindkey '^p'  up-history
bindkey '^r'  history-incremental-search-backward
bindkey '^w'  backward-kill-word-match
