{ pkgs, ... } :
let modifier = "Mod4"; in {

	programs.rofi.package = pkgs.rofi;
	programs.rofi.enable = true;

	programs.feh.enable = true;

	xsession.windowManager.i3.package = pkgs.i3-gaps;
	xsession.windowManager.i3.enable = true;
	xsession.windowManager.i3.config = {
		modifier = "${modifier}";
		gaps.inner = 10;
		gaps.outer = 6;
	};

	services.picom.enable = true;
  services.picom = {
    fade = true;
		backend = "glx";
    activeOpacity = 1.0;
    inactiveOpacity = 1.0;
		settings.vsync = true;
		settings.fade-delta = 3;
    settings.corner-radius = 8;
  };

	xsession.windowManager.i3.config.keybindings = {
		"${modifier}+r" = "exec ${pkgs.rofi}/bin/rofi -show drun -show-icons";
		"${modifier}+Return" = "exec ${pkgs.kitty}/bin/kitty";

		"${modifier}+w" = "focus up";
		"${modifier}+a" = "focus left";
		"${modifier}+s" = "focus down";
		"${modifier}+d" = "focus right";

		"${modifier}+Shift+w" = "move up";
		"${modifier}+Shift+a" = "move left";
		"${modifier}+Shift+s" = "move down";
		"${modifier}+Shift+d" = "move right";

		"${modifier}+1" = "workspace number 1";
		"${modifier}+2" = "workspace number 2";
		"${modifier}+3" = "workspace number 3";
		"${modifier}+4" = "workspace number 4";
		"${modifier}+5" = "workspace number 5";
		"${modifier}+6" = "workspace number 6";
		"${modifier}+7" = "workspace number 7";
		"${modifier}+8" = "workspace number 8";
		"${modifier}+9" = "workspace number 9";
		"${modifier}+0" = "workspace number 10";

		"${modifier}+Shift+1" = "move container to workspace number 1";
		"${modifier}+Shift+2" = "move container to workspace number 2";
		"${modifier}+Shift+3" = "move container to workspace number 3";
		"${modifier}+Shift+4" = "move container to workspace number 4";
		"${modifier}+Shift+5" = "move container to workspace number 5";
		"${modifier}+Shift+6" = "move container to workspace number 6";
		"${modifier}+Shift+7" = "move container to workspace number 7";
		"${modifier}+Shift+8" = "move container to workspace number 8";
		"${modifier}+shift+9" = "move container to workspace number 9";
		"${modifier}+Shift+0" = "move container to workspace number 10";

		"${modifier}+Shift+space" = "floating toggle";
		"${modifier}+f" = "fullscreen toggle";
		"${modifier}+Shift+x" = "kill";
	};

	xsession.windowManager.i3.config.startup = [
		{
			command = "${pkgs.feh}/bin/feh --bg-fill ~/.config/wallpaper.png";
			notification = false;
			always = true;
		}
		{
			command = "${pkgs.picom}/bin/picom";
			notification = false;
			always = true;
		}
	];

	xsession.windowManager.i3.extraConfig = ''
default_floating_border pixel 0
default_border pixel 0
'';
}
