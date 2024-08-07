{ pkgs, ... } : {
	xsession.windowManager.i3.config.startup = [
	 {
			command = "xrandr --output HDMI-A-0 --mode 1920x1080";
			notification = false;
			always = false;
		}
		{
			command = "sleep 1 && ${pkgs.feh}/bin/feh --bg-fill ~/.config/wallpaper.png";
			notification = false;
			always = false;
		}
		{
			command = "kill picom && ${pkgs.picom}/bin/picom";
			notification = false;
			always = false;
		}
		{
			command = "${pkgs.polybar}/bin/polybar";
			notification = false;
			always = false;
		}
	];
}
