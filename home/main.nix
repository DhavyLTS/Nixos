{ pkgs, inputs, ... } : {
	imports = [ ./modules/shell.nix ./modules/kitty.nix ./modules/style.nix ./modules/hyprland.nix ./modules/xremap.nix ]; 
	nixpkgs.config.allowUnfree = true;

	home.homeDirectory = "/home/tanikaze";
	home.stateVersion = "24.11";
	home.username = "tanikaze";

	home.file.".config/nvim".source = inputs.nVim;

	home.packages = with pkgs; [
		lazygit
		vesktop
		neovim
		yazi
	];

	programs = {
		home-manager.enable = true;
		firefox.enable = true;
		btop.enable = true;
		yazi.enable = true;
	};

}
