################################################################################
# Functions for making Nix and NixOS a bit easier.
if [ -d /etc/nix ]; then

  ##############################################################################
  function _nix-inside-shell () {
    if [[ -n $NIX_BUILD_TOP ]]; then
      return 0
    else
      return 1
    fi
  }

  ##############################################################################
  # Run a Nix command with the correct options and environment for a
  # local copy of nixpkgs.
  function _nix-with-nixpkgs () {
    command=$1
    shift

    typeset -a options
    options=()

    # Automatically add a binary cache when on my home network:
    if iwgetid | cut -d: -f2 | grep -q "515"; then
      options=($options --option extra-binary-caches http://10.0.1.10:8080)
    fi

    export NIX_PATH=nixpkgs=$HOME/develop/oss/nixpkgs:$NIX_PATH
    $command $options "$@"
  }

  ##############################################################################
  # Nix shell with a local clone of nixpkgs.
  function nixpkgs-shell () {
    _nix-with-nixpkgs nix-shell --command $(which zsh) "$@"
  }

  ##############################################################################
  # Nix build with a local clone of nixpkgs.
  function nixpkgs-build () {
    _nix-with-nixpkgs nix-build "$@"
  }

################################################################################
else

  ##############################################################################
  function _nix-inside-shell () {return 1}
fi
