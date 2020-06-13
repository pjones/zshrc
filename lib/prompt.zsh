#!zsh

# Prompt magic
autoload -U add-zsh-hook
autoload -U colors
colors

setopt PROMPT_SUBST

# Version control details (optional):
if [ -n "$ZSH_SHOW_VCS" ]; then
  zstyle ':vcs_info:*' actionformats '%F{cyan}%b %F{red}→ %a%f'
  zstyle ':vcs_info:*' formats '%F{cyan}%b%u%c%f'
  zstyle ':vcs_info:*' unstagedstr '%F{red}:U%f'
  zstyle ':vcs_info:*' stagedstr '%F{green}:S%f'
  zstyle ':vcs_info:*' check-for-changes true
fi

function emacs_send_directory_details() {
  if [ -n "$INSIDE_EMACS" ] && [ "$INSIDE_EMACS" != "vterm" ]; then
    # Tell the Emacs terminal where/who we are:
    printf "AnSiTc %s\n" ${PWD:=$(pwd)}
    printf "AnSiTh %s\n" ${HOST:=$(hostname)}
    printf "AnSiTu %s\n" ${USER:=$(whoami)}
  fi
}

# https://github.com/akermu/emacs-libvterm
vterm_printf() {
  if [ -n "$TMUX" ]; then
    # Tell tmux to pass the escape sequences through
    # (Source: http://permalink.gmane.org/gmane.comp.terminal-emulators.tmux.user/1324)
    printf "\ePtmux;\e\e]%s\007\e\\" "$1"
  elif [ "${TERM%%-*}" = "screen" ]; then
    # GNU screen (screen, screen-256color, screen-256color-bce)
    printf "\eP\e]%s\007\e\\" "$1"
  else
    printf "\e]%s\e\\" "$1"
  fi
}
vterm_prompt_end() {
  vterm_printf "51;A$(whoami)@$(hostname):$(pwd)"
}
vterm_title() {
  print -Pn "\e]2;%m:%2~\a"
}
add-zsh-hook -Uz chpwd vterm_title
vterm_title # Call now to set initial title.

function precmd() {
  PS1='$ '
  RPROMPT=''
  top_prompt=''
  info_prompt=''
  last_exit="%(?..%F{magenta}%?;%f )"

  # Where are we?
  emacs_send_directory_details

  case "$TERM" in
  dumb)
    unsetopt zle
    unsetopt prompt_cr
    unsetopt prompt_subst
    ;;

  xterm* | rxvt* | screen* | eterm*)
    # The terminal seems to be smart enough:
    top_prompt="%F{red}[ %F{blue}%n%F{red}@%F{green}%m:%F{yellow}%20<..<%2~%<<%f"

    if [ -n "$ZSH_SHOW_VCS" ]; then
      vcs_info

      if [ -n "${vcs_info_msg_0_}" ]; then
        info_prompt="${info_prompt}${vcs_info_msg_0_} "
      fi
    fi

    # Make it easy to see when I'm in a nix-shell:
    if [[ -n "$NIX_BUILD_TOP" ]]; then
      info_prompt="%F{cyan}λ%f ${info_prompt}"
    fi

    PS1="${top_prompt} ${info_prompt}%F{red}]%f"$'\n'"${last_exit}"'%(!.#.$) '
    PS1="${PS1}%{$(vterm_prompt_end)%}" # Add vterm prompt tracking.
    ;;
  esac
}
