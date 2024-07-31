{
  description = "NixOS Configuration Flake";

  inputs = {
		homeManager.url = "github:nix-community/home-manager/master";
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
		neovim.url = "github:DhavySantos/NixVim";
		dpkgs.url = "github:DhavySantos/NixPkgs";
		xremap.url = "github:xremap/nix-flake";
		stylix.url = "github:danth/stylix";
  };

  outputs = { self, nixpkgs, homeManager, neovim, ... } @inputs :

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
		nvim = neovim.packages.${system}.default;
		system = "x86_64-linux";
	in

	{
    nixosConfigurations.default = nixpkgs.lib.nixosSystem {
			specialArgs = { inherit vars;  inherit inputs; };
			modules = [ ./system/default.nix ];
			inherit system;
    };

		homeConfigurations.default = homeManager.lib.homeManagerConfiguration {
			extraSpecialArgs = { inherit vars; inherit inputs; inherit system; inherit nvim; };
			modules = [ ./home/default.nix ];
			inherit pkgs;
		};
  };
}
