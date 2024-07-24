{ config, lib, ... } : {
	wayland.windowManager.hyprland = {
		enable = true;
		settings = {
			"$mod1" = "SUPER";
			"$mod2" = "SUPER SHIFT";

			windowrulev2 = [
				"suppressevent maximize, class:.*"
				"monitor 1,class:^steam_apps_(.*)$"
				"fullscreen,class:^steam_apps_(.*)$"
				"workspace 10,class:^steam_app_(.*)+$"
			];

			workspace = "10, border:false, rounding:false";

			general = with config.lib.stylix.colors; lib.mkForce {
				"col.active_border" = "rgba(${base09}ff) rgba(${base09}ff) 60deg";
				"col.inactive_border" = "rgba(${base00}ff)";
			};

			decoration = {
				rounding = 6;
			};

			#exec-once = [
			#	"${pkgs.swww}/bin/swww-daemon"
			#	"${pkgs.swww}/bin/swww ./wallpaper.png"
			#];

			monitor = "HDMI-A-1, 1920x1080, 0x0, 1";

			input = {
				kb_layout = "br";
			};

			bind = [
				"     , PRINT, exec, hyprshot -m region --clipboard-only"
				"$mod1, R, exec, wofi --show drun"
				"$mod1, RETURN, exec, kitty"
				"$mod1, SPACE, togglefloating"
				"$mod1, F, fullscreen"
				"$mod2, X, killactive"

				"$mod1, 1, workspace, 1"
				"$mod1, 2, workspace, 2"
				"$mod1, 3, workspace, 3"
				"$mod1, 4, workspace, 4"
				"$mod1, 5, workspace, 5"
				"$mod1, 6, workspace, 6"
				"$mod1, 7, workspace, 7"
				"$mod1, 8, workspace, 8"
				"$mod1, 9, workspace, 9"
				"$mod1, Q, workspace, 10"

				"$mod1, apostrophe, togglespecialworkspace, magic"
				"$mod1 SHIFT, apostrophe, movetoworkspace, special:magic"

				"$mod1 SHIFT, 1, movetoworkspace, 1"
				"$mod1 SHIFT, 2, movetoworkspace, 2"
				"$mod1 SHIFT, 3, movetoworkspace, 3"
				"$mod1 SHIFT, 4, movetoworkspace, 4"
				"$mod1 SHIFT, 5, movetoworkspace, 5"
				"$mod1 SHIFT, 6, movetoworkspace, 6"
				"$mod1 SHIFT, 7, movetoworkspace, 7"
				"$mod1 SHIFT, 8, movetoworkspace, 8"
				"$mod1 SHIFT, 9, movetoworkspace, 9"
				"$mod1 SHIFT, Q, movetoworkspace, 10"
			];

			bindm = [
				"$mod1, mouse:272, movewindow"
				"$mod1, mouse:273, resizewindow"
			];
		};
	};
}
