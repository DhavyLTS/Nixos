{ pkgs ,... } : {
	programs.waybar.enable = true;
	programs.waybar.settings.mainBar = {
		name = "main";
		layout = "top";
		position = "bottom";
		output = [ "HDMI-A-1" ];

		modules-left = [ "clock" "hyprland/workspaces" ];
		modules-right = [ "tray" ];
		modules-center = [ "hyprland/window" ];

		"hyprland/workspaces" = {
			disable-scroll = true;
			all-outputs = true;
		};

		"hyprland/window" = {
			format = "{}";
		};

		"tray" = {
			icon-size = 16;
			spacing = 10;
		};

		"clock" = {
			interval = 60;
			max-length = 25;
			format = "{:%H:%M}";
		};
	};

	programs.waybar.style = builtins.readFile ./waybar.css;
}
