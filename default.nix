{ pkgs ? import <nixpkgs> { }
}:

pkgs.stdenvNoCC.mkDerivation {
  name = "zshrc";
  src = ./.;

  enableParallelBuilding = true;

  makeFlags = [
    "PREFIX=$(out)/share/zshrc"
    "DOT="
  ];
}
