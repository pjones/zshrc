{ pkgs ? import <nixpkgs> { }
}:

pkgs.stdenvNoCC.mkDerivation {
  name = "zshrc";
  phases = [ "unpackPhase" "installPhase" "fixupPhase" ];
  src = ./.;

  installPhase = ''
    mkdir -p $out/share/zshrc
    make PREFIX=$out/share/zshrc DOT= install
  '';
}
