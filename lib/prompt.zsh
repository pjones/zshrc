#!zsh

# Prompt magic
autoload -U colors; colors

function precmd() {
  PS1="$ "
  RPROMPT=""
  top_prompt=""

  case "$TERM" in
    eterm*)
      # Tell the Emacs terminal where/who we are:
      printf "AnSiTc %s\n" ${PWD:=`pwd`}
      printf "AnSiTh %s\n" ${HOST:=`hostname`}
      printf "AnSiTu %s\n" ${USER:=`whoami`}
      ;& # fall through to the next case check...

    xterm*|rxvt*|screen*)
      # The terminal seems to be smart enough:
      # Make it easy to see when I'm in a nix-shell:
      top_prompt="%F{blue}%n%F{red}@%F{green}%m:%F{yellow}%20<..<%2~%<<%f"

      if [[ -n "$NIX_BUILD_TOP" ]]; then
        top_prompt="%F{red}╒ %f$top_prompt%F{red} ══%f"
      else
        top_prompt="%F{red}╭ %f$top_prompt%F{red} ──%f"
      fi

      PS1="$top_prompt"$'\n'"%F{red}│ %f%(?.%F{cyan}❯%f .%F{magenta}❯%f "
      ;;
  esac
}
