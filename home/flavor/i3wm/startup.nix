{ pkgs, ... } : {
	xsession.windowManager.i3.config.startup = [
	 {
			command = "xrandr --output HDMI-A-0 --mode 1920x1080";
			notification = false;
			always = true;
		}
		{
			command = "sleep 2 && ${pkgs.feh}/bin/feh --bg-fill ~/.config/wallpaper.png";
			notification = false;
			always = true;
		}
		{
			command = "kill picom && ${pkgs.picom}/bin/picom";
			notification = false;
			always = true;
		}
		{
			command = "kill polybar && ${pkgs.polybar}/bin/polybar";
			notification = false;
			always = true;
		}
	];
}
