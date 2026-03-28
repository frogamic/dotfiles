{ lib, ... }:
let
	inherit (builtins) attrNames listToAttrs readDir;

	genFiles = dir: listToAttrs(
		map (
			name: {
				inherit name;
				value = {
					source = dir + "/${name}";
					recursive = true;
				};
			}
		)
		(attrNames (readDir dir))
	);
in
{
	programs = {
		home-manager.enable = true;
	};

	home = {
		shellAliases = {
			ll = "ls -alh --color=auto";
		};
		stateVersion = "25.11";

		file = genFiles ./dotfiles;
	};
}
