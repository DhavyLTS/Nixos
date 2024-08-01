{ inputs, pkgs, ... } : {

	home.file.".config/nvim/lua/plugins".source = "${inputs.neovim-config}/lua/plugins";
	home.file.".config/nvim/lua/core".source = "${inputs.neovim-config}/lua/core";

	programs.neovim.enable = true;
	programs.neovim = {
		defaultEditor = true;
		vimAlias = true;
		viAlias = true;
	};

	programs.neovim.extraLuaConfig = ''
		require("core.options");
		require("core.lazynvim");
	'';
}
