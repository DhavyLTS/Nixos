{
  description = "NixOS Configuration Flake";

  inputs = {
		homeManager.url = "github:nix-community/home-manager/master";
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
		xremap.url = "github:xremap/nix-flake";
		dpkgs.url = "github:dhavylts/nixpkgs";
		nvim.url = "github:dhavylts/neovim";
		stylix.url = "github:danth/stylix";
		nvim.flake = false;
  };

  outputs = { self, nixpkgs, homeManager, ... } @inputs :

	let
		vars.colors_scheme = "gruvbox-dark-medium";
		vars.timezone = "America/Sao_Paulo";
		vars.state_version = "24.11";
		vars.hostname = "tsugumori";
		vars.username = "tanikaze";
		vars.flavor = "i3wm";

		vars.default_locale = "en_US.UTF-8";
		vars.console_keymap = "br-abnt2";
		vars.xkb_variant = "abnt2";
		vars.xkb_layout = "br";

		pkgs = nixpkgs.legacyPackages.${system};
		system = "x86_64-linux";
	in

	{
    nixosConfigurations.default = nixpkgs.lib.nixosSystem {
			specialArgs = { inherit vars;  inherit inputs; };
			inherit system;
			modules = [ ./system/default.nix ];
    };

		homeConfigurations.default = homeManager.lib.homeManagerConfiguration {
			extraSpecialArgs = { inherit vars; inherit inputs; };
			inherit pkgs;
			modules = [ ./home/default.nix ];
		};
  };
}
