{ pkgs, ... } : {
	systemd.services."autovt@tty1".enable = false;
  systemd.services."getty@tty1".enable = false;

	services.displayManager.autoLogin.user = "tanikaze";
	services.displayManager.autoLogin.enable = true;
	services.displayManager.sddm.enable = true;
	services.dbus.enable = true;

	services.xserver.videoDrivers = ["amdgpu"];
	services.xserver.xkb.layout = "br";
	services.xserver.enable = true;

  hardware.graphics.enable = true;

	xdg.portal.enable = true;
	xdg.portal.extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];

	programs.hyprland.xwayland.enable = true;
	programs.hyprland.enable = true;

	environment.sessionVariables."WLR_NO_HARDWARE_CURSOR" = "1";
	environment.sessionVariables."NIXOS_OZONE_WL" = "1";

	environment.systemPackages = with pkgs; [
		wl-clipboard
		hyprcursor
		hyprpaper
		hyprland
		hyprshot
		kitty
		wofi
	];
}
