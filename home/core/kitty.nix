{ pkgs, lib, ... } : {
	programs.kitty = {
		shellIntegration.enableZshIntegration = true;
		font.name = lib.mkForce "CaskaydiaCove Nerd Font";
		font.package = lib.mkForce (import ../pkgs/caskaydiacove.nix { inherit pkgs; });
		font.size = lib.mkForce 12;
		enable = true;
		settings = {
			"confirm_os_window_close" = lib.mkForce "0";
			"window_padding_width" = lib.mkForce "10"; 
			"background_opacity" = lib.mkForce "1.0";
			"background_blur" = lib.mkForce "10";
			"shell" = "zsh";
		};
	};
}
