{nixpkgs ? import <nixpkgs> {}}:
nixpkgs.haskellPackages.callPackage ./iterm-show.nix {}
