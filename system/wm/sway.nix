{ config, pkgs, lib, ... } : {
  environment.systemPackages = with pkgs; [
    grim slurp wl-clipboard mako rofi-wayland
  ];

	xdg.portal.extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];

	services.displayManager.sddm.enable = true;
  services.gnome.gnome-keyring.enable = true;

	programs.sway.enable = true;
  programs.sway.wrapperFeatures.gtk = true;
}
