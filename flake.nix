{
	description = "NixOS Configuration Flake";
	inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
	inputs.homeManager.url = "github:nix-community/home-manager/master";
	inputs.homeManager.inputs.nixpkgs.follows = "nixpkgs";
	inputs.xremap.url = "github:xremap/nix-flake";
	inputs.nVim.url = "github:dhavylts/neovim";
	inputs.stylix.url = "github:danth/stylix";

	outputs = { nixpkgs, homeManager, ... }@inputs : let pkgs = nixpkgs.legacyPackages.${system}; system = "x86_64-linux"; in {
		nixosConfigurations."tsugumori" = nixpkgs.lib.nixosSystem {
			modules = [ ./system/main.nix ];
		};

		homeConfigurations."tanikaze" = homeManager.lib.homeManagerConfiguration {
			extraSpecialArgs = { inherit inputs; };
			modules = [ ./home/main.nix ];
			inherit pkgs;
		};
	};
}
