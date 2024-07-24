{ pkgs, ... } : {
	imports = [ ./modules/shell.nix ./modules/kitty.nix ./modules/style.nix ./modules/hyprland.nix ./modules/xremap.nix ]; 
	nixpkgs.config.allowUnfree = true;

	home.homeDirectory = "/home/tanikaze";
	home.username = "tanikaze";

	programs.home-manager.enable = true;
	home.stateVersion = "24.11";

	home.packages = with pkgs; [
		lazygit
		vesktop
		neovim
		yazi
		gcc
		git
	];

	programs = {
		firefox.enable = true;
		btop.enable = true;
		yazi.enable = true;
	};

}
