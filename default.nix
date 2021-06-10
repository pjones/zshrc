let
  sources = import nix/sources.nix;
in
{ pkgs ? import sources.nixpkgs { }
}:

pkgs.stdenvNoCC.mkDerivation {
  name = "zshrc";
  phases = [ "unpackPhase" "installPhase" "fixupPhase" ];
  src = ./.;

  installPhase = ''
    mkdir -p $out/share/zshrc

    make \
      DOT= \
      PREFIX=$out/share/zshrc \
      FZFTAB=${pkgs.zsh-fzf-tab} \
      install
  '';
}
