{
	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
		flake-utils.url = "github:numtide/flake-utils";
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows= "nixpkgs";
		};
	};

	outputs = { nixpkgs, ... } @inputs: {
		nixosModules.default.imports = [
			inputs.home-manager.nixosModules.home-manager
			{
				home-manager.useGlobalPkgs = true;
				home-manager.useUserPackages = true;
				home-manager.users.me = ./home.nix;
			}
		];
		homeConfigurations = {
			"me" = inputs.home-manager.lib.homeManagerConfiguration {
				pkgs = nixpkgs.legacyPackages.x86_64-linux;
				modules = [ ./home.nix ];
			};
		};
	} // (inputs.flake-utils.lib.eachSystem
		inputs.flake-utils.lib.defaultSystems (
			system: let
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
			}
		)
	);
}
