{ pkgs, ... } : {
	xdg.portal.extraPortals = with pkgs; [
		xdg-desktop-portal-hyprland
		xdg-desktop-portal-gtk
	];

	services.displayManager.sddm.enable = true;
	programs.hyprland.xwayland.enable = true;
	programs.hyprland.enable = true;

	environment.sessionVariables."WLR_NO_HARDWARE_CURSOR" = "1";
	environment.sessionVariables."NIXOS_OZONE_WL" = "1";

	environment.systemPackages = with pkgs; [
		wl-clipboard hyprcursor hyprland
		hyprshot kitty swww rofi-wayland
	];
}

