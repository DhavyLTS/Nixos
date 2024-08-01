{ pkgs, ... } : let modifier = "Mod4"; in {
	xsession.windowManager.i3.config.keybindings = {
		"Print" = "exec maim -s | xclip -selection clipboard -t image/png";
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
		"${modifier}+apostrophe" = "workspace number 0";

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
		"${modifier}+Shift+apostrophe" = "move container to workspace number 0";

		"${modifier}+Shift+space" = "floating toggle";
		"${modifier}+f" = "fullscreen toggle";
		"${modifier}+Shift+r" = "restart";
		"${modifier}+Shift+c" = "reload";
		"${modifier}+Shift+x" = "kill";
	};
}
