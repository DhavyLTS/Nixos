{
	description = "NixOS Configuration Flake";
	inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
	inputs.repo.url = "github:dhavylts/nixospackages";
	inputs.xremap.url = "github:xremap/nix-flake";
	inputs.stylix.url = "github:danth/stylix";
	inputs.homeManager = {
		url = "github:nix-community/home-manager/master";
		inputs.nixpkgs.follows = "nixpkgs";
	};

	inputs.nvim = {
		url = "github:dhavylts/neovim";
		flake = false;
	};

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
