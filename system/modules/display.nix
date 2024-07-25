{ pkgs, ... } : {
	systemd.services."autovt@tty1".enable = false;
	systemd.services."getty@tty1".enable = false;

	services.displayManager.autoLogin.user = "tanikaze";
	services.displayManager.defaultSession = "none+i3";
	services.displayManager.autoLogin.enable = true;
	services.displayManager.sddm.enable = true;
	services.dbus.enable = true;

	environment.pathsToLink = [ "/libexec" ];
	hardware.graphics.enable = true;
	programs.dconf.enable = true;

	services.xserver.windowManager.i3.package = pkgs.i3-gaps;
	services.xserver.desktopManager.xterm.enable = false;
	services.xserver.windowManager.i3.enable = true;
	services.xserver.videoDrivers = ["amdgpu"];
	services.xserver.xkb.layout = "br";
	services.xserver.enable = true;

	xdg.portal.extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];
	xdg.portal.config.common.default = "*";
	xdg.portal.enable = true;

	environment.systemPackages = with pkgs; [
		dmenu i3status i3lock i3blocks
		xclip maim rofi
	];
}
