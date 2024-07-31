{ pkgs, vars, nvim, ... } : {
	imports = [
		./wm/${vars.flavor}.nix
		./core/xremap.nix
		./core/shell.nix
		./core/kitty.nix
		./core/style.nix
	];

	nixpkgs.config.allowUnfree = true;

	home.homeDirectory = "/home/${vars.username}";
	home.stateVersion = "${vars.state_version}";
	home.username = "${vars.username}";

	home.packages =  [
		pkgs.lazygit pkgs.vesktop
		pkgs.yazi pkgs.spotify
		nvim
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
