{ inputs, pkgs, lib, ... } : {

	home.file.".config/nvim/lua/tanikaze".source = "${inputs.neovim-config}/lua/tanikaze";

	programs.neovim.extraLuaConfig = builtins.readFile "${inputs.neovim-config}/init.lua";
	programs.neovim.enable = true;
	programs.neovim = {
		defaultEditor = true;
		vimAlias = true;
		viAlias = true;
	};
}
