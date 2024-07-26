{ pkgs, inputs, ... } : {
	imports = [ ./modules/shell.nix ./modules/kitty.nix ./modules/style.nix ./modules/xremap.nix ./modules/i3wm.nix ]; 
	nixpkgs.config.allowUnfree = true;

	home.homeDirectory = "/home/tanikaze";
	home.stateVersion = "24.11";
	home.username = "tanikaze";

	home.file.".config/nvim/init.lua".source = "${inputs.nvim}/init.lua";
	home.file.".config/nvim/lua".source = "${inputs.nvim}/lua";

	home.packages = with pkgs; [
		lazygit vesktop yazi neovim spotify
		lua-language-server rust-analyzer
		path-of-building protonup
	];

	home.sessionVariables = {
		STEAM_EXTRA_COMPAT_TOOLS_PATH = "\${HOME}/.steam/root/compatibility.d";
	};

	programs = {
		home-manager.enable = true;
		firefox.enable = true;
		btop.enable = true;
		yazi.enable = true;
	};
}
