{ pkgs, ... } : let modifier = "Mod4"; in {

	wayland.windowManager.sway.enable = true;
	wayland.windowManager.sway.config = rec {
		modifier = "${modifier}";
		terminal = "kitty";
		keybindings = {
			"${modifier}+Return" = "exec ${pkgs.rofi-wayland}/bin/rofi -show drun -show-icons";
			"${modifier}+Return" = "exec ${pkgs.kitty}/bin/kitty";
			"${modifier}+Shift+X" = "kill";
		};
	};

}
