# Prompt magic
autoload -U colors; colors

function precmd() {
  PS1="$ "
  RPROMPT=""

  case "$TERM" in
    eterm*)
      # Tell the Emacs terminal where/who we are:
      printf "AnSiTc %s\n" ${PWD:=`pwd`}
      printf "AnSiTh %s\n" ${HOST:=`hostname`}
      printf "AnSiTu %s\n" ${USER:=`whoami`}
      ;& # fall through to the next case check...

    xterm*|rxvt*)
      # The terminal seems to be smart enough:
      PS1="%B%(?.%F{cyan}❯%f .%F{magenta}❯%f %b"
      RPROMPT="%F{blue}%n%F{red}@%F{green}%m:%F{yellow}%20<..<%2~%<<%f"

      # Make it easy to see when I'm in a nix-shell:
      if [[ -n "$NIX_BUILD_TOP" ]]; then
        RPROMPT="%F{red}[%f$RPROMPT%F{red}]%f"
      fi
      ;;
  esac
}
