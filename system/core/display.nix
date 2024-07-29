{ pkgs, vars, ... } : {
	
	systemd.services."autovt@tty1".enable = false;
	systemd.services."getty@tty1".enable = false;

	services.displayManager.autoLogin.user = "${vars.username}";
	services.displayManager.autoLogin.enable = true;
	services.dbus.enable = true;

	hardware.graphics.enable = true;
	programs.dconf.enable = true;

	services.xserver.videoDrivers = ["amdgpu"];
	services.xserver.xkb.layout = "br";
	services.xserver.enable = true;

	xdg.portal.config.common.default = "*";
	xdg.portal.enable = true;
}
