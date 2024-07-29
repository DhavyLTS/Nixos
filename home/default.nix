{ pkgs, inputs, vars, ... } : {
	imports = [
		./core/shell.nix ./core/kitty.nix
		./core/style.nix ./core/xremap.nix
		./windows/${vars.flavor}.nix
	];

	nixpkgs.config.allowUnfree = true;

	home.homeDirectory = "/home/${vars.username}";
	home.stateVersion = "${vars.state_version}";
	home.username = "${vars.username}";

	home.file.".config/nvim/init.lua".source = "${inputs.nvim}/init.lua";
	home.file.".config/nvim/lua".source = "${inputs.nvim}/lua";

	home.packages = with pkgs; [
		lazygit vesktop yazi neovim spotify
			lua-language-server rust-analyzer
			path-of-building
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
