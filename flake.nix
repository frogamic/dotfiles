{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils, ... }@inputs:
  (flake-utils.lib.eachSystem flake-utils.lib.defaultSystems (system: let
    pkgs = nixpkgs.legacyPackages."${system}";
  in {
    packages.default = pkgs.stow;
    apps = rec {
      apply = {
        type = "app";
        program = "${pkgs.writeShellScript "apply" ''
          ${pkgs.stow}/bin/stow --target=$HOME --no-folding --restow home
        ''}";
      };
      default = apply;
    };
  }));
}
