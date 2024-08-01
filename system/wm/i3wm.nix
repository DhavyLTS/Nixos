{ pkgs, ... } : {

	services.xserver.windowManager.i3.package = pkgs.i3-gaps;
	services.xserver.windowManager.i3.enable = true;

	services.xserver.desktopManager.xterm.enable = false;
	services.displayManager.defaultSession = "none+i3";
  services.displayManager.sddm.enable = true;

	environment.pathsToLink = [ "/libexec" ];

	xdg.portal.extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];
	environment.systemPackages = with pkgs; [
		dmenu i3status i3lock i3blocks
		xclip maim rofi
	];
}
