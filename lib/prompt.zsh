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
    ;;
  esac
}
