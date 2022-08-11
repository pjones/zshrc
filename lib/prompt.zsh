#!zsh

# Prompt magic
autoload -U add-zsh-hook
autoload -U colors
autoload -Uz vcs_info
colors

setopt PROMPT_SUBST

# Version control details (optional):
zstyle ':vcs_info:*' actionformats '%F{cyan}%b %F{red}→ %a%f'
zstyle ':vcs_info:*' formats '%F{cyan}%b%f:%F{yellow}%0.7i%f:%u%c'
zstyle ':vcs_info:*' unstagedstr '%F{red}M%f'
zstyle ':vcs_info:*' stagedstr '%F{green}M%f'
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' get-revision true

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
  vterm_printf "51;A$(whoami)@$(hostname -f):$(pwd)"
}
vterm_title() {
  print -Pn "\e]2;%m:%2~\a"
}
add-zsh-hook -Uz precmd vterm_title

function precmd() {
  PS1='$ '
  RPROMPT=''
  top_prompt=''
  info_prompt=''
  last_exit="%(?..%F{magenta}%?;%f )"

  case "$TERM" in
  dumb)
    unsetopt zle
    unsetopt prompt_cr
    unsetopt prompt_subst
    ;;

  xterm* | rxvt* | screen* | eterm*)
    # The terminal seems to be smart enough:
    top_prompt="%F{red}[ %F{blue}%n%F{red}@%F{green}%m:%F{yellow}%20<..<%2~%<<%f"

    if [ "${ZSH_SHOW_VCS:-1}" -eq 1 ]; then
      vcs_info

      if [ -n "${vcs_info_msg_0_}" ]; then
        info_prompt="${info_prompt}${vcs_info_msg_0_/%:/} "
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
