{ pkgs, lib, inputs,... } : {
	programs.kitty = {
		shellIntegration.enableZshIntegration = true;
		font.name = lib.mkForce "CaskaydiaCove Nerd Font";
		font.package = lib.mkForce inputs.dpkgs.caskaydiacove;
		font.size = lib.mkForce 12;
		enable = true;
		settings = {
			"confirm_os_window_close" = lib.mkForce "0";
			"background_opacity" = lib.mkForce "0.9";
			"background_blur" = lib.mkForce "10";
			"shell" = "zsh";
		};
	};
}
