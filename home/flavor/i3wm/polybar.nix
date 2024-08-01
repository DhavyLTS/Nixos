{ config, pkgs, lib, ... } : {
	services.polybar.script = "${pkgs.polybar}/bin/polybar &";
	services.polybar.package = pkgs.polybar;
	services.polybar.enable = true;
	services.polybar.config = {
		"colors" = with config.lib.stylix.colors; lib.mkForce {
			background-alt = "#${base01}";
			foreground-alt = "#${base04}";
			background = "#${base00}";
			foreground = "#${base05}";
			secondary = "#${base0B}";
			disabled = "#${base03}";
			primary = "#${base0D}";
			alert = "#${base08}";
		};

		"bar/default" = {
			separator-foreground = "\${colors.disabled}";
			background = "\${colors.background}";
			foreground = "\${colors.foreground}";

			modules-left = "date xworkspaces";
			modules-center = "xwindow";
			modules-right = "tray";

			cursor-scroll = "ns-resize";
			cursor-click = "pointer";

			font-0 = "caskaydiacove nerd font;1";
			separator = "/";

			border-size = "0pt";
			module-margin = "1";
			padding-right = "1";
			padding-left = "1";
			line-size = "3pt";
			bottom = "true";
			height = "20pt";
			width = "100%";
			radius = "0";
		};

		"module/xworkspaces" = {
			type = "internal/xworkspaces";
			label-active = "%name%";
			label-active-background = "\${colors.background-alt}";
			label-active-foreground = "\${colors.foreground-alt}";
			label-active-underline = "\${colors.primary}";
			label-active-padding = "1";

			label-occupied = "%name%";
			label-occupied-padding = "1";

			label-urgent = "%name%";
			label-urgent-background = "\${colors.alert}";
			label-urgent-padding = "1";

			label-empty = "%name%";
			label-empty-foreground = "\${colors.disabled}";
			label-empty-padding = "1";
		};

		"module/tray" = {
			type = "internal/tray";
			format-margin = "0px";
			tray-spacing = "8px";
		};

		"module/xwindow" = {
			type = "internal/xwindow";
			label = "%title:0:60:...%";
		};

		"module/date" = {
			type = "internal/date";
			interval = "1";
			date = "%H:%M";
			date-alt = "%Y-%m-%d %H:%M:%S";
			label = "%date%";
			label-foreground = "\${colors.primary}";
		};
	};
}
