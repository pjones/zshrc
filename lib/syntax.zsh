# Make sure this variable is treated like an associative array:
typeset -A ZSH_HIGHLIGHT_STYLES

# Now tweak the styles:
ZSH_HIGHLIGHT_STYLES[command]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[precommand]=$ZSH_HIGHLIGHT_STYLES[command]
ZSH_HIGHLIGHT_STYLES[alias]=$ZSH_HIGHLIGHT_STYLES[command]
ZSH_HIGHLIGHT_STYLES[builtin]=$ZSH_HIGHLIGHT_STYLES[command]
ZSH_HIGHLIGHT_STYLES[hashed-command]=$ZSH_HIGHLIGHT_STYLES[command]
ZSH_HIGHLIGHT_STYLES[function]=$ZSH_HIGHLIGHT_STYLES[command]
ZSH_HIGHLIGHT_STYLES[suffix-alias]=$ZSH_HIGHLIGHT_STYLES[command]
ZSH_HIGHLIGHT_STYLES[comment]='fg=054'
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[redirection]=$ZSH_HIGHLIGHT_STYLES[commandseparator]
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=135'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=139'
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=magenta,bold'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=blue,bold'
ZSH_HIGHLIGHT_STYLES[globbing]='fg=red'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=green'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=$ZSH_HIGHLIGHT_STYLES[single-hyphen-option]
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=blue'
ZSH_HIGHLIGHT_STYLES[assign]='fg=blue'
ZSH_HIGHLIGHT_STYLES[path]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[path_prefix]='fg=green'
ZSH_HIGHLIGHT_STYLES[path_pathseparator]='fg=yellow,bold'
ZSH_HIGHLIGHT_STYLES[bracket-error]=$ZSH_HIGHLIGHT_STYLES[unknown-token]
