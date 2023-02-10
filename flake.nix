{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils, ... }@inputs:
  (flake-utils.lib.eachSystem flake-utils.lib.defaultSystems (system: let
    pkgs = nixpkgs.legacyPackages."${system}";
    env = ''
      export NIX_PATH="nixpkgs=${nixpkgs}"
    '';
  in {
    devShell = pkgs.mkShell {
      packages = [ pkgs.stow ];
      shellHook = env;
    };
    apps.default = {
      type = "app";
      program = "${pkgs.writeShellScript "apply-wrapped" ''
        export PATH="${pkgs.coreutils}/bin:${pkgs.stow}/bin:PATH"
        ${pkgs.bash}/bin/bash ./apply
      ''}";
    };
  }));
}
