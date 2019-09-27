{nixpkgs ? import <nixpkgs> {}}:
with nixpkgs;
let
  compilers = [ "ghc802" "ghc822" "ghc843" "ghc861" "ghc881" ];

  buildFor = ghc: haskell.packages."${ghc}".callPackage ./iterm-show.nix {};

in
  lib.genAttrs compilers buildFor
